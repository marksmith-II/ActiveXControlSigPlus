*&---------------------------------------------------------------------*
*& Report ZMS_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMS_TEST.

PARAMETERS p_doc TYPE vbeln.
START-OF-SELECTION.


data(webgui) = CL_GUI_FRONTEND_SERVICES=>check_gui_support( component = 'webgui' feature_name = 'newwindow' ).

if webgui eq abap_true.
    " We are in WebGUI, most likely. Launch Fiori application.
*    data(url) = 'http://localhost:8080/test/flpSandbox.html?sap-ui-xx-viewCache=false#comborderstatestopazsignature-display?DeliveryNumber=' && wa_likp-vbeln.
*    call function 'ITS_BROWSER_WINDOW_OPEN'
*        exporting
*            url = url
*        exceptions
*            its_not_available = 1
*            others = 2
*        .

  message 'using webgui' type 'I'.
endif.


data: host type string,
      port type string,
      colon type string value ':',
      protocol type string value 'https://',
      suffix type string value '/sap/bc/ui5_ui5/sap/ztopaz_sig/index.html?sap-client=100&sap-ui-language=EN&DeliveryNumber=',
      url type string.

CALL FUNCTION 'TH_GET_VIRT_HOST_DATA'
DESTINATION 'FIORI'
  EXPORTING
   PROTOCOL             = 2
   virt_idx             = 0
   LOCAL                = 1
 IMPORTING
   HOSTNAME             = host
   PORT                 = port
 EXCEPTIONS
   NOT_FOUND            = 1
   INTERNAL_ERROR       = 2
   OTHERS               = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CONCATENATE protocol host colon port suffix p_doc INTO url.

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
        others                 = 10
    ).
    IF SY-SUBRC <> 0.
     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.
