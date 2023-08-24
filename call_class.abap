DATA: wrk      TYPE char20,
        Ingenico TYPE flag,
        Topaz    TYPE flag,
        host     TYPE string,
        port     TYPE string,
        colon    TYPE string VALUE ':',
        protocol TYPE string VALUE 'https://',
        suffix   TYPE string VALUE '/sap/bc/ui5_ui5/sap/ztopaz_sig/index.html?sap-client=100&sap-ui-language=EN&DeliveryNumber=',
        url      TYPE string.

*" get paramater ID for user
  GET PARAMETER ID 'WRK' FIELD wrk.
* New Topaz SigPlus code **

* determine which device should trigger for signature
* " Topaz or Ingenico
  SELECT *
    FROM zzpgmparm
    WHERE pgmid = 'INGENICO'
    AND id1 = @wrk
    INTO @DATA(run_ing_device).
   ENDSELECT.

   IF run_ing_device IS NOT INITIAL.
     ingenico = abap_true.
     ELSE.
       topaz = abap_true.
   ENDIF.

IF topaz = abap_true.

  CALL FUNCTION 'POPUP_TO_INFORM'
    EXPORTING
      titel         = 'Signature Capture in Progress'
      txt1          = 'Do not leave screen or begin other processes'
      txt2          = 'Processing Delivery Document..'
*     TXT3          = ' '
*     TXT4          = ' ' .
.
DATA(webgui) = cl_gui_frontend_services=>check_gui_support( component = 'webgui' feature_name = 'newwindow' ).
"If user is calling capture signature from webgui launch ui5 application
IF webgui EQ abap_true.
           .
CALL FUNCTION 'TH_GET_VIRT_HOST_DATA'
DESTINATION 'FIORI'
  EXPORTING
   protocol             = 2
   virt_idx             = 0
   local                = 1
 IMPORTING
   hostname             = host
   port                 = port
 EXCEPTIONS
   not_found            = 1
   internal_error       = 2
   OTHERS               = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CONCATENATE protocol host colon port suffix wa_likp-vbeln INTO url.
"launch UI5 application (ztopaz_sig)
    cl_gui_frontend_services=>execute(
     EXPORTING
*        document               =                  " Path+Name to Document
        application            =  'iexplore.exe'                " Path and Name of Application
        parameter              =   url              " Parameter for Application

      EXCEPTIONS
        cntl_error             = 1                " Control error
        error_no_gui           = 2                " No GUI available
        bad_parameter          = 3                " Incorrect parameter combination
        file_not_found         = 4                " File not found
        path_not_found         = 5                " Path not found
        file_extension_unknown = 6                " Could not find application for specified extension
        error_execute_failed   = 7                " Could not execute application or document
        synchronous_failed     = 8                " Cannot Call Application Synchronously
        not_supported_by_gui   = 9                " GUI does not support this
        OTHERS                 = 10
    ).
    IF sy-subrc <> 0.
     MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
       WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

ELSE.
"Gui signature capture
DATA: BEGIN OF gui,
       container   TYPE REF TO cl_gui_container,
       END OF gui.
DATA: del_items TYPE STANDARD TABLE OF lips,
      delivery_items TYPE tt_lips.
"get del items
LOOP AT i_sigitems ASSIGNING FIELD-SYMBOL(<fs_sigitem>).
  DATA(lips_item) = VALUE lips( vbeln = <fs_sigitem>-vbeln
                                posnr = <fs_sigitem>-posnr
                                arktx = <fs_sigitem>-arktx
                                lfimg = <fs_sigitem>-lfimg ).
  APPEND lips_item TO del_items.
ENDLOOP.
MOVE-CORRESPONDING del_items TO delivery_items.
"Instantiate Topaz device
DATA(activex_sig_control) = NEW zcl_topaz_sigplus_gui_control(
*  clsid    = ''
*  lifetime = 0
  parent   = gui-container
).

"Check if device is connected
 DATA(device_connection_status) = activex_sig_control->tablet_connect_query( ).

 IF device_connection_status > 0.
   "Start signature process if device is connected.
  DATA(sig_process_complete) = activex_sig_control->start_signature_process(
                                 delivery_number =  wa_likp-vbeln
                                 delivery_items  =  delivery_items
                               ).


  DATA: jobname   TYPE tbtcjob-jobname,
        jobcount  TYPE tbtcjob-jobcount.

IF sig_process_complete =  abap_true.
  READ TABLE ct_xlikp ASSIGNING FIELD-SYMBOL(<likp>) INDEX 1.
          IF sy-subrc = 0.
            <likp>-zzcustsigdat = sy-datlo.
            <likp>-zzcustsigtim = sy-timlo.
          ENDIF.
                 CONCATENATE 'POD' wa_likp-vbeln INTO jobname.

            CALL FUNCTION 'JOB_OPEN'
              EXPORTING
                jobname  = jobname
              IMPORTING
                jobcount = jobcount.

            SUBMIT z_cc_finalize_delivery WITH p_vbeln  = wa_likp-vbeln
            VIA JOB jobname NUMBER jobcount
            USER sy-uname
            AND RETURN.

* Schedule and close job.
            CALL FUNCTION 'JOB_CLOSE'
              EXPORTING
                jobcount  = jobcount
                jobname   = jobname
                sdlstrtdt = sy-datum
                sdlstrttm = sy-uzeit.

 ENDIF.

    ELSE.
*         sig_process_complete =  abap_false.
        DATA(connect_msg) = 'Error connecting device' .
        MESSAGE connect_msg TYPE 'I' .

 ENDIF.

ENDIF.
ENDIF.
**** END M30
