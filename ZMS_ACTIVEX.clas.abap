class ZCL_TOPAZ_SIGPLUS_GUI_CONTROL definition
  public
  inheriting from CL_GUI_CONTROL
  final
  create public .

public section.

  types:
    ty_delivery_list_t TYPE STANDARD TABLE OF lips WITH DEFAULT KEY .

  data DELIVERY_NUMBER type VBELN_VL .
  data NEXT_DEL_ITEM type INT4 .
  data DELIVERY_ITEMS_TO_PROCESS type TY_DELIVERY_LIST_T .
  data STOP_PROCESSING type FLAG .
  data PROCESS_STATUS type FLAG .
  data DELIVERY_ITEMS_ATT type TT_LIPS .

  methods CONSTRUCTOR
    importing
      value(CLSID) type C optional
      value(LIFETIME) type I optional
      !PARENT type ref to CL_GUI_CONTAINER .
  methods SET_TABLET_STATE
    importing
      !STATE type INT1 .
  methods GET_TABLET_STATE
    returning
      value(STATE) type INT2 .
  methods INIT_SIG_PLUS .
  methods SET_TEXT_VALUE
    importing
      !TEXT type STRING
      !DEST type INTEGER default 0
      !MODE type INTEGER default 2
      !XPOS type INTEGER default 100
      !YPOS type INTEGER default 100
      !XSIZE type INTEGER default 600
      !YSIZE type INTEGER default 600
      !FORMAT type INTEGER default 0 .
  methods GET_SIG_STRING
    returning
      value(SIG_STRING) type STRING .
  methods SET_FONT
    importing
      !HEIGHT type INTEGER default 50
      !WIDTH type INTEGER default 0
      !WEIGHT type INTEGER default 100
      !ITALIC type INTEGER default 0
      !UNDERLINE type INTEGER default 0
      !PITCHANDFAMILY type INTEGER default 0
      !FACENAME type STRING default 'ARIAL' .
  methods REFRESH_TABLET_SCREEN
    importing
      !MODE type INTEGER default 0
      !XPOS type INTEGER default 0
      !YPOS type INTEGER default 0
      !XSIZE type INTEGER default 640
      !YSIZE type INTEGER default 480 .
  methods SET_SIG_WINDOW
    importing
      !COORDS type INTEGER
      !XPOS type INTEGER
      !YPOS type INTEGER
      !XSIZE type INTEGER
      !YSIZE type INTEGER .
  methods SET_LCD_WINDOW
    importing
      !XSTART type INTEGER optional
      !YSTART type INTEGER optional
      !XSIZE type INTEGER optional
      !YSIZE type INTEGER optional .
  methods LCD_CAPTURE_MODE
    importing
      !MODE type INTEGER .
  methods LCD_WRITE_IMAGE
    importing
      !DEST type INTEGER default 0
      !MODE type INTEGER default 2
      !XPOS type INTEGER default 0
      !YPOS type INTEGER default 0
      !XSIZE type INTEGER
      !YSIZE type INTEGER
      !FORMAT type INTEGER default 0
      !FILENAME type STRING .
  methods SET_LCD_PIXEL_DEPTH
    importing
      !DEPTH type INTEGER
    returning
      value(RETURN) type BOOLEAN .
  methods WRITE_IMG_FILE
    returning
      value(RETURN) type BOOLEAN .
  methods LCD_WRITE_BITMAP
    returning
      value(RETURN) type BOOLEAN .
  methods GET_LCD_CAPTURE_MODE
    returning
      value(MODE) type INTEGER .
  methods CREATE_SCREEN_0
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CUST_CERT_SCREEN_2 .
  methods SIGNATURE_SCREEN_3 .
  methods GET_DELIVERY_ITEMS
    importing
      !DELIVERY_DOCUMENT type VBELN_VL optional
    returning
      value(DELIVERY_ITEMS) type TT_LIPS .
  methods KEY_PAD_ADD_HOT_SPOT
    importing
      !KEYCODE type INT2
      !COORDS type INT2
      !XPOS type INT2
      !YPOS type INT2
      !XSIZE type INT2
      !YSIZE type INT2 .
  methods KEY_PAD_QUERY_HOT_SPOT
    importing
      !KEY_CODE type INT1
    returning
      value(RETURN) type INT2 .
  methods CLEAR_TABLET .
  methods CLEAR_SIG_WINDOW
    importing
      !LOCATION type INTEGER default 1 .
  methods NUMBER_OF_TABLET_POINTS
    returning
      value(RETURN) type INTEGER .
  methods KEY_PAD_CLEAR_HOT_SPOT_LIST .
  methods SET_LOG_ENABLED .
  methods SET_LOG_FILE_PATH
    importing
      !FILE_PATH type STRING .
  methods CUSTOMER_CERTIFICATION .
  methods CANCEL_ACCEPT_BUTTONS .
  methods CUSTOMER_CERT_IMAGE .
  methods DELIVERY_DETAILS_IMAGE .
  methods SIGNATURE_HEADER_AND_AREA .
  methods GET_DELIVERY
    importing
      !DELIVERY_DOCUMENT type VBELN_VL
    returning
      value(DELIVERY_DETAILS) type TT_LIKP .
  methods DISPLAY_DELIVERY_INFO .
  methods GET_PO_REFERENCE
    returning
      value(PO_NUMBER) type BSTNK .
  methods UPDATE_DELIVERY_HEADER_SIG
    exporting
      !ES_RETURN type BAL_S_MSG
      !EV_SUBRC type SY-SUBRC .
  methods IS_CUSTMER_CERT_REQUIRED
    returning
      value(DISCLAIMER_REQUIRED) type BOOLEAN .
  methods SET_BUTTON_HOTSPOTS
    importing
      !CANCEL type BOOLEAN
      !ACCEPT type BOOLEAN
      !CLEAR type BOOLEAN
      !NEXT type BOOLEAN .
  methods CLEAR_BUTTON .
  methods DISPLAY_DELIVERY_ITEMS
    importing
      !MATERIAL type ARKTX
      !QUANTITY type LFIMG
      !YPOS type INTEGER .
  methods GET_SALES_ORDER
    returning
      value(SALES_ORDER) type VBELN .
  methods NEXT_BUTTON .
  methods WRITE_IMAGE_FILE
    importing
      !FILE_NAME type STRING
    returning
      value(RETURN) type BOOLEAN .
  methods SAVE_SIG_IMAGE
    exporting
      !FILE type STRING
    returning
      value(RETURN) type BOOLEAN .
  methods GET_IMAGE_FILE
    exporting
      !FILE_LENGTH type INTEGER
    returning
      value(DATA_TAB) type ESY_TT_RCGREPFILE .
  methods BUILD_DELIVERY_LIST
    importing
      !NEXT_BTN_CLICKED type FLAG optional
      value(LINE_ITEM) type INTEGER default 0
    exporting
      !PROCESS_COMPLETE type FLAG
    returning
      value(RE_DEL_ITEMS) type TY_DELIVERY_LIST_T .
  methods CLEAR_SCREEN_1 .
  methods CREATE_SCREEN_1
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods DELIVERY_ITEM_SCREEN_FLOW
    importing
      !DELIVERY_DOCUMENT type VBELN .
  methods DEL_ITEMS_LT_5_SCREEN .
  methods SIGNATURE_COMPLETE_SCREEN .
  methods CREATE_SCREEN_2
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods NEXT_FIVE_ITEMS_TO_PROCESS
    importing
      !START type INTEGER
      !END type INTEGER
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_3
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_4
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_5
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_6
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_7
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_8
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_9
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods START_SIGNATURE_PROCESS
    importing
      !DELIVERY_NUMBER type VBELN
      !DELIVERY_ITEMS type TT_LIPS optional
    returning
      value(RE_PROCESS_STATUS) type FLAG .
  methods TABLET_CONNECT_QUERY
    returning
      value(RETURN) type BOOLEAN .
  methods GET_CUSTOMER_NAME
    importing
      !CUSTOMER_NUMBER type KUNNR
    returning
      value(CUSTOMER_NAME) type NAME1 .
  methods DELIVERY_CANCELED_SCREEN .
  methods CREATE_SCREEN_10
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_11
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_12
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods GZIP_SIGNATURE
    importing
      !IV_SIGNATURE type STRING
      !IV_VBELN type VBELN
    exporting
      !ET_BIN_FORMAT type ESY_TT_RCGREPFILE
      !EV_BIN_LEN type I
      !EV_XSTRING type XSTRING
      !ES_RETURN type BAL_S_MSG
      !EV_SUBRC type SY-SUBRC .
  methods SET_IMAGE_PEN_WIDTH
    importing
      !PIXELS type INTEGER .
  methods SET_IMAGE_SIZE
    importing
      !YSIZE type INTEGER
      !XSIZE type INTEGER .
  methods CREATE_SCREEN_13
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_15
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_16
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_18
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods SIG_PROCESS_STATUS
    importing
      !STATUS type BOOLEAN optional
    returning
      value(RETURN_STATUS) type BOOLEAN .
  methods CREATE_SIG_AREA_HOT_SPOT .
  methods SIG_SCREEN_BUTTON_LISTENER .
  PROTECTED SECTION.

    METHODS unregister_cached_w_p
      IMPORTING
        !delivery_document    TYPE vbeln_vl
        !customer             TYPE kunag
      RETURNING
        VALUE(delivery_items) TYPE lips .
private section.

  methods CREATE_SCREEN_14
    returning
      value(PROCESS_COMPLETE) type FLAG .
  methods CREATE_SCREEN_17
    returning
      value(PROCESS_COMPLETE) type FLAG .
ENDCLASS.



CLASS ZCL_TOPAZ_SIGPLUS_GUI_CONTROL IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->BUILD_DELIVERY_LIST
* +-------------------------------------------------------------------------------------------------+
* | [--->] NEXT_BTN_CLICKED               TYPE        FLAG(optional)
* | [--->] LINE_ITEM                      TYPE        INTEGER (default =0)
* | [<---] PROCESS_COMPLETE               TYPE        FLAG
* | [<-()] RE_DEL_ITEMS                   TYPE        TY_DELIVERY_LIST_T
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD build_delivery_list.
    DATA:
      count     TYPE integer,
*      line_item TYPE integer,
      tabix     TYPE int4,
      complete  TYPE flag.

    DATA: lt_delivery_list TYPE STANDARD TABLE OF lips,
          wa_delivery_list TYPE lips.
    "Grab Delivery Items
    DATA(delivery_items) = delivery_items_att. "attribute

    DATA(delivery_item_count) = lines( delivery_items ).


    IF next_btn_clicked IS INITIAL.
      DATA(flag) = abap_false.
    ELSE.
      flag = abap_true.
      tabix = next_del_item.

    ENDIF.

    LOOP AT delivery_items INTO DATA(wa_delivery_items).
      IF flag EQ abap_true.
        IF sy-tabix NE tabix.
          CONTINUE.
        ENDIF.
      ENDIF.
      flag = abap_false.

      wa_delivery_list-arktx = wa_delivery_items-arktx.
      wa_delivery_list-lfimg = wa_delivery_items-lfimg.
      line_item = line_item + 1.
      APPEND wa_delivery_list TO lt_delivery_list.



      IF line_item = 5.
        tabix = line_item + 1.
        EXIT.
      ELSE.
        tabix = 0.

      ENDIF.

      IF delivery_item_count EQ sy-tabix.
*     process_complete = abap_true.
      ENDIF.

      "Call display records sequence.
    ENDLOOP.

    DATA(item_count) = lines( lt_delivery_list ).


    IF item_count < 5.
      complete = abap_true.
      process_complete = complete.
    ENDIF.

    CLEAR line_item.
    CLEAR wa_delivery_items.
    CLEAR wa_delivery_list.

    next_del_item = tabix.
    re_del_items = lt_delivery_list.
    delivery_items_to_process = lt_delivery_list.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CANCEL_ACCEPT_BUTTONS
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD cancel_accept_buttons.

    "Paint "Cancel" and "Accept" Buttons

    "Cancel
    lcd_write_image(
      EXPORTING
*        dest     = 0                " 0 = Foreground, 1 = Background memory in tablet#
*        mode     = 2                " 0 = Clear 1 = Complement 2 = WriteOpaque 3 = Write Transpare
        xpos     = 50               " Location in LCD coords to draw at
        ypos     = 375                " Location in LCD coords to draw at
        xsize    = 132                 " Image Width in LCD pixels
        ysize    = 72                 " Image Height in LCD pixels
*        format   = 0                " Image file format, see WriteImageFile
*        filename =  'C:\Users\marks\Documents\Projects\Border States\bmp images\Cancel_Button.bmp'                " Path and name of BMP image file to load as string
filename = 'C:\Operate\Topaz\Cancel_Button.bmp'
    ).

    "Accept
    lcd_write_image(
      EXPORTING
*        dest     = 0                " 0 = Foreground, 1 = Background memory in tablet#
*        mode     = 2                " 0 = Clear 1 = Complement 2 = WriteOpaque 3 = Write Transpare
        xpos     = 450               " Location in LCD coords to draw at
        ypos     = 375                " Location in LCD coords to draw at
        xsize    = 132                 " Image Width in LCD pixels
        ysize    = 72                 " Image Height in LCD pixels
*        format   = 0                " Image file format, see WriteImageFile
*        filename =  'C:\Users\marks\Documents\Projects\Border States\bmp images\Accept_Button.bmp'                " Path and name of BMP image file to load as string
        filename =  'C:\Operate\Topaz\Accept_Button.bmp'                " Path and name of BMP image file to load as string
    ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CLEAR_BUTTON
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD clear_button.

    lcd_write_image(
      EXPORTING
*        dest     = 0                " 0 = Foreground, 1 = Background memory in tablet#
*        mode     = 2                " 0 = Clear 1 = Complement 2 = WriteOpaque 3 = Write Transpare
        xpos     = 260               " Location in LCD coords to draw at
        ypos     = 375                " Location in LCD coords to draw at
        xsize    = 112                 " Image Width in LCD pixels
        ysize    = 72                 " Image Height in LCD pixels
*        format   = 0                " Image file format, see WriteImageFile
*        filename =  'C:\Users\marks\Documents\Projects\Border States\bmp images\Back_Button.bmp'
*       filename =  'C:\Users\marks\Documents\Projects\Border States\bmp images\Clear_Button.bmp'             " Path and name of BMP image file to load as string
       filename =   'C:\Operate\Topaz\Clear_Button.bmp'             " Path and name of BMP image file to load as string
    ).



  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CLEAR_SCREEN_1
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CLEAR_SCREEN_1.
    init_sig_plus( ).

    set_tablet_state( state = 0 ).
    lcd_capture_mode( mode = 2 ).
    set_lcd_pixel_depth( depth = 8 ).
    refresh_tablet_screen(
      EXPORTING
        mode  = 0                " 0 = Clear 1 = Complement 2 = WriteTransparent 3 = WriteTrans
        xpos  = 0                " Location in LCD coordinates (upper left - 0,0)
        ypos  = 0                " Location in LCD coordinates (upper left - 0,0)
        xsize = 640              " XSize in LCD pixels
        ysize = 480              " YSize in LCD pixels
    ).
    delivery_details_image( ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CLEAR_SIG_WINDOW
* +-------------------------------------------------------------------------------------------------+
* | [--->] LOCATION                       TYPE        INTEGER (default =1)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD clear_sig_window.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CLEAR_TABLET
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD clear_tablet.

    me->call_method( method = 'ClearTablet'  ).
    cl_gui_cfw=>flush(  ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] CLSID                          TYPE        C(optional)
* | [--->] LIFETIME                       TYPE        I(optional)
* | [--->] PARENT                         TYPE REF TO CL_GUI_CONTAINER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD constructor.



    DATA: ctrl_name(80) TYPE c.

    IF NOT cl_gui_object=>activex IS INITIAL.
      ctrl_name = 'SIGPLUS.SigPlusCtrl.1'.
    ENDIF.

    super->constructor(
    EXPORTING
      clsid = ctrl_name
      lifetime = lifetime_default
      shellstyle = shellstyle
      parent = parent
      name = m_name
    EXCEPTIONS
        cntl_error = 1
        cntl_system_error = 2
        create_error = 3
        lifetime_error = 4
        parent_is_splitter = 5
        OTHERS = 6
        ).

    CALL METHOD cl_gui_cfw=>subscribe
      EXPORTING
        ref     = me
        shellid = me->h_control-shellid
      EXCEPTIONS
        OTHERS  = 1.



  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_0
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD CREATE_SCREEN_0.

    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    init_sig_plus( ).
    refresh_tablet_screen(
      EXPORTING
        mode  = 0                " 0 = Clear 1 = Complement 2 = WriteTransparent 3 = WriteTrans
        xpos  = 0                " Location in LCD coordinates (upper left - 0,0)
        ypos  = 0                " Location in LCD coordinates (upper left - 0,0)
        xsize = 640              " XSize in LCD pixels
        ysize = 480              " YSize in LCD pixels
    ).
    set_tablet_state( state = 0 ).
    lcd_capture_mode( mode = 2 ).
    set_lcd_pixel_depth( depth = 8 ).


    delivery_details_image( ).



    next_five_items_to_process(
      EXPORTING
        start            =  0                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
        end              =  5                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
      RECEIVING
        process_complete =  process_complete                " General Flag
    ).






    LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).
      ypos = ypos + 50.
      display_delivery_items(
        EXPORTING
          material = <item>-arktx                 " Material Number
          quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
          ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
      ).


    ENDLOOP.
    CLEAR ypos.






  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_1
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_1.
    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.

    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).


      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).


      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 06                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 10                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).

          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.
*    ELSE.
*      create_screen_2( ).
    ENDIF.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_10
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CREATE_SCREEN_10.

     DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 58                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 62                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_11
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CREATE_SCREEN_11.

         DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 63                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 67                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_12
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CREATE_SCREEN_12.
             DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 68                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 72                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_13
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CREATE_SCREEN_13.

                 DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 73                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 77                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_14
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CREATE_SCREEN_14.


                 DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 78                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 82                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_15
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_15.



                 DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false AND stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 83                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 87                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.




  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_16
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_16.




                 DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false AND stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 88                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 92                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.





  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_17
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_17.
                    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false AND stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 93                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 97                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.






  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_18
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_18.

      DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false AND stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 98                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 102                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.







  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_2
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_2.

    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).


      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 11                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 15                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.


    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.
    ELSE.

    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_3
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_3.
    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,

      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).


      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).


      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).


        next_five_items_to_process(

          EXPORTING
            start = 16                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 20                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).

          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked gt 0 and process_complete = abap_false .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_4
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CREATE_SCREEN_4.
         DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).


      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).


      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).


        NEXT_FIVE_ITEMS_TO_PROCESS(

          EXPORTING
            start = 21                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 25                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_5
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_5.
    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).


      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).


      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).


        next_five_items_to_process(

          EXPORTING
            start = 26                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 30                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_6
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_6.
    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.

    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).


      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).


      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).


        next_five_items_to_process(

          EXPORTING
            start = 31                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 35                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_7
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_7.
    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).


      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).


        next_five_items_to_process(

          EXPORTING
            start = 36                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 40                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).

          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_8
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_8.

    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).


      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).


        next_five_items_to_process(

          EXPORTING
            start = 41                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 45                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).

          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SCREEN_9
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD create_screen_9.

    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0,
      next_btn_clicked   TYPE integer VALUE 0.


    IF process_complete = abap_false and stop_processing = abap_false.
      next_button( ).
      set_tablet_state( state = 1 ).

      set_button_hotspots(
        EXPORTING
          cancel =  abap_false
          accept =  abap_false
          clear   =  abap_false
          next =    abap_true
      ).

      WHILE next_btn_clicked EQ 0.
        next_btn_clicked = key_pad_query_hot_spot( key_code = 4 ).
      ENDWHILE.

      IF next_btn_clicked > 0.
        clear_screen_1( ).

        next_five_items_to_process(

          EXPORTING
            start = 52                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
            end   = 57                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)

          RECEIVING
            process_complete =  process_complete                " General Flag
        ).

        LOOP AT delivery_items_to_process ASSIGNING FIELD-SYMBOL(<item>).


          ypos = ypos + 50.

          display_delivery_items(
            EXPORTING
              material = <item>-ARKTX                 " Material Number
              quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
              ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          ).


        ENDLOOP.
        WAIT UP TO 1 SECONDS.
        CLEAR ypos.
      ENDIF.
    ENDIF.



    IF next_btn_clicked > 0 .

      IF process_complete = abap_true.
        EXIT.
      ENDIF.

    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CREATE_SIG_AREA_HOT_SPOT
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CREATE_SIG_AREA_HOT_SPOT.

        key_pad_add_hot_spot(
      keycode = 5                " Integer value defining the HotSpot
      coords  = 1                 " 0 = Logical tablet coordinates 1 = LCD Coordinates
      xpos    = 27                 " Location (upper left - 0,0)
      ypos    = 150                " Location (upper left - 0,0)
      xsize   = 582                 " XSize in pixels
      ysize   = 210                 " YSize in pixels
    ).


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CUSTOMER_CERTIFICATION
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD customer_certification.
    DATA: font_height TYPE integer VALUE 35.


    set_font(
            EXPORTING
              height         = font_height              " Height of font in pixels
              width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
              weight         = 30              " Font weight as a number between 0 and 900. 0=default, 400=no
              italic         = 0                " If this value is non-zero, the text is italicized.
              underline      = 0                " If this value is non-zero, the text is underlined.
              pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
              facename       = 'ARIAL'          " Font’s name
          ).

    set_text_value(
      EXPORTING
        text   = ' The Customer Signature Certifies the Material'
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
        xpos   = 8              " Location in LCD coords to draw at
        ypos   = 100              " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
    ).

    set_font(
      EXPORTING
        height         = font_height              " Height of font in pixels
        width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
        weight         = 30              " Font weight as a number between 0 and 900. 0=default, 400=no
        italic         = 0                " If this value is non-zero, the text is italicized.
        underline      = 0                " If this value is non-zero, the text is underlined.
        pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
        facename       = 'ARIAL'          " Font’s name
    ).

    set_text_value(
      EXPORTING
        text   = 'described herein are being used in construction'
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
        xpos   = 10              " Location in LCD coords to draw at
        ypos   = 150              " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
    ).

    set_font(
      EXPORTING
        height         = font_height              " Height of font in pixels
        width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
        weight         = 30              " Font weight as a number between 0 and 900. 0=default, 400=no
        italic         = 0                " If this value is non-zero, the text is italicized.
        underline      = 0                " If this value is non-zero, the text is underlined.
        pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
        facename       = 'ARIAL'          " Font’s name
    ).
    set_text_value(
EXPORTING
  text   = 'of the improvments for the referenced project.'
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
  xpos   = 10              " Location in LCD coords to draw at
  ypos   = 200              " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
).



  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CUSTOMER_CERT_IMAGE
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD customer_cert_image.

    "Paint "Customer Certification" header
    lcd_write_image(
      EXPORTING
        dest = 0
        mode = 2
        xpos = 0
        ypos = 0
        xsize = 640    " Image Width in LCD pixels
        ysize = 33    " Image Height in LCD pixels
*        filename = 'C:\Users\marks\Documents\Projects\Border States\bmp images\Customer_Certification.bmp' "Need seperate image const class
        filename =  'C:\Operate\Topaz\Customer_Certification.bmp' "Need seperate image const class

    ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->CUST_CERT_SCREEN_2
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD cust_cert_screen_2.

    DATA: cancel_btn_clicked TYPE integer VALUE 0,
          accept_btn_clicked TYPE integer VALUE 0.


    init_sig_plus( ).
    refresh_tablet_screen(
      EXPORTING
        mode  = 0                " 0 = Clear 1 = Complement 2 = WriteTransparent 3 = WriteTrans
        xpos  = 0                " Location in LCD coordinates (upper left - 0,0)
        ypos  = 0                " Location in LCD coordinates (upper left - 0,0)
        xsize = 640              " XSize in LCD pixels
        ysize = 480              " YSize in LCD pixels
    ).
    set_tablet_state( state = 0 ).
    lcd_capture_mode( mode = 2 ).
    set_lcd_pixel_depth( depth = 8 ).


    "Paint Customer Certification Header Image
    customer_cert_image( ).

    "Paint Customer Certification statement
    customer_certification( ).

    "Display Cancel and Accept buttons
    cancel_accept_buttons( ).
    set_tablet_state( state = 1 ).
    clear_tablet( ).
    key_pad_clear_hot_spot_list( ).
    set_button_hotspots(
       EXPORTING
         cancel =  abap_true
         accept =  abap_true
         clear  =  abap_false
         next   =  abap_false
     ).


    WAIT UP TO 2 SECONDS.



    WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

      cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
      accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

    ENDWHILE.

    IF accept_btn_clicked > 0 .
      signature_screen_3( ).
    ENDIF.

    IF cancel_btn_clicked > 0.
      WAIT UP TO 1 SECONDS.
      delivery_canceled_screen( ).
      MESSAGE 'Customer does not agree to statement' TYPE 'I'.

    ENDIF.


    RETURN.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->DELIVERY_CANCELED_SCREEN
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD delivery_canceled_screen.


    init_sig_plus( ).
    refresh_tablet_screen( ).
    set_tablet_state( state = 0 ).
    lcd_capture_mode( mode = 0 ).

    refresh_tablet_screen( ).

   process_status = ' '. "set class attribute
    set_font(
      EXPORTING
        height         = 50               " Height of font in pixels
        width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
        weight         = 200              " Font weight as a number between 0 and 900. 0=default, 400=no
        italic         = 0                " If this value is non-zero, the text is italicized.
        underline      = 0                " If this value is non-zero, the text is underlined.
        pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
        facename       = 'ARIAL'          " Font’s name
    ).

    set_text_value(
      EXPORTING
         text   = ' '
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
        xpos   = 0              " Location in LCD coords to draw at
        ypos   = 0              " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
    ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->DELIVERY_DETAILS_IMAGE
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD delivery_details_image.

    "Paint "Delivery Details" header
    lcd_write_image(
      EXPORTING
        dest = 0
        mode = 2
        xpos = 0
        ypos = 0
        xsize = 640    " Image Width in LCD pixels
        ysize = 33    " Image Height in LCD pixels
        filename = 'C:\Operate\Topaz\Delivery_Details .bmp' "Need seperate image const class
*        filename = 'C:\Users\marks\Documents\Projects\Border States\Delivery_Details.bmp' "Need seperate image const class

    ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->DELIVERY_ITEM_SCREEN_FLOW
* +-------------------------------------------------------------------------------------------------+
* | [--->] DELIVERY_DOCUMENT              TYPE        VBELN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD DELIVERY_ITEM_SCREEN_FLOW.
    " The purpose of this method is to determin how the delivery items screens are painted.

    DATA: process_complete   TYPE flag VALUE abap_false,
          screen_flag        TYPE flag,
          screen_2_flage     TYPE flag,
          cancel_btn_clicked TYPE integer VALUE 0,
          accept_btn_clicked TYPE integer VALUE 0,
          clear_btn_clicked  TYPE integer VALUE 0.

    "set class attribute
    delivery_number = delivery_document.

    DATA(lt_delivery_list) = build_delivery_list(  ).
    DATA(lt_delivery_items) = delivery_items_att.

    IF process_complete = abap_false.
      "set class attribute
      delivery_items_to_process = lt_delivery_list.


      DATA(item_count) = lines( lt_delivery_items ).




      CASE item_count .

        WHEN  5 OR 4 OR 3 OR 2 OR 1.

          del_items_lt_5_screen( ).
          process_complete = abap_true.



        WHEN OTHERS.
          "handle Deliveries with more than 5 items.
*Screen 1
          DATA(process_finished_in_screen_0) = create_screen_0( ).

          IF process_finished_in_screen_0 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_1) = create_screen_1( ).

            IF stop_processing = abap_true.
              process_complete = abap_true.
              process_finished_in_screen_1 = abap_true.
              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                DATA(disclaimer_required) = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.
                process_complete = abap_true.
              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


                EXIT.
              ENDIF.
            ENDIF.
          ENDIF.

*Screen 2
          IF process_finished_in_screen_1 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_2) = create_screen_2( ).

            IF stop_processing = abap_true.
              process_complete = abap_true.
              process_finished_in_screen_2 = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.



              ENDIF.
            ENDIF.
          ENDIF.

*Screen 3
          IF process_finished_in_screen_2 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_3) = create_screen_3( ).

            IF stop_processing = abap_true.
              process_complete = abap_true.
              process_finished_in_screen_3 = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.

                EXIT.
              ENDIF.
            ENDIF.
          ENDIF.

*Screen 4
          IF process_finished_in_screen_3 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_4) = create_screen_4( ).
*             process_finished_in_screen_5 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.
              process_finished_in_screen_4 = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.
*Screen 5

          IF process_finished_in_screen_4 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_5) = create_screen_5( ).
*            process_finished_in_screen_6 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.
              process_finished_in_screen_5 = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.
*Screen 6
          IF process_finished_in_screen_5 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_6) = create_screen_6( ).
*             process_finished_in_screen_7 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.
              process_finished_in_screen_6 = abap_true.
              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.

                EXIT.
              ENDIF.
            ENDIF.
          ENDIF.


*Screen 7
          IF process_finished_in_screen_6 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_7) = create_screen_7( ).

            IF stop_processing = abap_true.
              process_complete = abap_true.
              process_finished_in_screen_7 = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.


*screen 8
          IF process_finished_in_screen_7 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_8) = create_screen_8( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.

*screen 9
          IF process_finished_in_screen_8 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_9) = create_screen_9( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.



*screen 10
          IF process_finished_in_screen_9 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_10) = create_screen_10( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.

*screen 11
          IF process_finished_in_screen_10 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_11) = create_screen_11( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.

*screen 12
          IF process_finished_in_screen_11 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_12) = create_screen_12( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.

*screen 13
          IF process_finished_in_screen_12 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_13) = create_screen_13( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.

*screen 14
          IF process_finished_in_screen_13 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_14) = create_screen_14( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.


*screen 15
          IF process_finished_in_screen_14 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_15) = create_screen_15( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.


*screen 16
          IF process_finished_in_screen_15 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_16) = create_screen_16( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.


*screen 17
          IF process_finished_in_screen_16 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_17) = create_screen_17( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.


*screen 18 (100th item)
          IF process_finished_in_screen_17 = abap_false AND process_complete = abap_false.
            DATA(process_finished_in_screen_18) = create_screen_18( ).
*            process_finished_in_screen_9 = abap_true.
            IF stop_processing = abap_true.
              process_complete = abap_true.

              "Display Cancel and Accept buttons
              cancel_accept_buttons( ).
              set_tablet_state( state = 1 ).


              set_button_hotspots(
                EXPORTING
                  cancel =  abap_true
                  accept =  abap_true
                  clear  =  abap_false
                  next =    abap_false
              ).

              WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

                cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
                accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

              ENDWHILE.

              IF accept_btn_clicked > 0 .
                disclaimer_required = is_custmer_cert_required( ).
                IF disclaimer_required = abap_true.
                  cust_cert_screen_2( ).
                ELSE.
                  signature_screen_3( ).
                ENDIF.

              ENDIF.

              IF cancel_btn_clicked > 0.
                delivery_canceled_screen( ).
                MESSAGE 'Customer has canceled Delivery' TYPE 'I'.


              ENDIF.
            ENDIF.
          ENDIF.




































*          MESSAGE 'Signature Saved' TYPE 'I'.

      ENDCASE.

    ENDIF.



  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->DEL_ITEMS_LT_5_SCREEN
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD del_items_lt_5_screen.
    DATA:
      cancel_btn_clicked TYPE integer VALUE 0,
      accept_btn_clicked TYPE integer VALUE 0,
      clear_btn_clicked  TYPE integer VALUE 0,
      ypos               TYPE integer VALUE 0.

    DATA(lt_delivery_list) = delivery_items_to_process.


    init_sig_plus( ).
    refresh_tablet_screen(
      EXPORTING
        mode  = 0                " 0 = Clear 1 = Complement 2 = WriteTransparent 3 = WriteTrans
        xpos  = 0                " Location in LCD coordinates (upper left - 0,0)
        ypos  = 0                " Location in LCD coordinates (upper left - 0,0)
        xsize = 640              " XSize in LCD pixels
        ysize = 480              " YSize in LCD pixels
    ).
    set_tablet_state( state = 0 ).
    lcd_capture_mode( mode = 2 ).
    set_lcd_pixel_depth( depth = 8 ).

    "display delivery detail image
    delivery_details_image( ).


    LOOP AT lt_delivery_list ASSIGNING FIELD-SYMBOL(<item>).
      ypos = ypos + 50.
      display_delivery_items(
        EXPORTING
          material = <item>-ARKTX                 " Material Number
          quantity = <item>-lfimg                 " Actual quantity delivered (in sales units)
          ypos     = ypos                " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
      ).


    ENDLOOP.
    "Display Cancel and Accept buttons
    cancel_accept_buttons( ).
    set_tablet_state( state = 1 ).
*      clear_tablet( ).

    set_button_hotspots(
      EXPORTING
        cancel =  abap_true
        accept =  abap_true
        clear  =  abap_false
        next =    abap_false
    ).

    WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0.

      cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
      accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).

    ENDWHILE.


*    cancel_accept_btn_func(
*      IMPORTING
*        cancel_btn_clicked = cancel_btn_clicked                  " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
*        accept_btn_clicked = accept_btn_clicked                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
*    ).



    IF accept_btn_clicked > 0 .
      DATA(disclaimer_required) = is_custmer_cert_required( ).
      IF disclaimer_required = abap_true.
        cust_cert_screen_2( ).
      ELSE.
        signature_screen_3( ).
      ENDIF.
    ENDIF.

    IF cancel_btn_clicked > 0.
      delivery_canceled_screen( ).
      MESSAGE 'Customer has canceled Delivery' TYPE 'I'.

      refresh_tablet_screen( ).
    ENDIF.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->DISPLAY_DELIVERY_INFO
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD display_delivery_info.
    DATA:
      del_number    TYPE vbeln,
      po_text       TYPE string,
      customer      TYPE kunnr,
      delivery_text TYPE string,
      customer_text TYPE string,
      delivery_data TYPE TABLE OF likp,
      po_number     TYPE bstnk,
      customer_name type name1.

    delivery_data = get_delivery( delivery_document = delivery_number  ).
    po_number = get_po_reference( ).

    LOOP AT delivery_data ASSIGNING FIELD-SYMBOL(<delivery>).
      del_number = CONV string( <delivery>-vbeln ).
      customer_name = get_customer_name( customer_number =  <delivery>-kunnr  ).
*

*     material_text = 'Material:' +  conv string( <item>-matnr ) .
      CONCATENATE 'Delivery: ' del_number INTO delivery_text.
      CONCATENATE 'PO:' po_number INTO po_text.
      CONCATENATE 'Customer: ' customer_name INTO customer_text.


      "Delivery Number
      set_font(
        EXPORTING
          height         = 30               " Height of font in pixels
          width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
          weight         = 100              " Font weight as a number between 0 and 900. 0=default, 400=no
          italic         = 0                " If this value is non-zero, the text is italicized.
          underline      = 0                " If this value is non-zero, the text is underlined.
          pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
          facename       = 'ARIAL'          " Font’s name
      ).

      set_text_value(
        EXPORTING
           text   = delivery_text
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
          xpos   = 25             " Location in LCD coords to draw at
          ypos   = 50             " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
      ).

      "PO Number
      set_font(
  EXPORTING
    height         = 30               " Height of font in pixels
    width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
    weight         = 100              " Font weight as a number between 0 and 900. 0=default, 400=no
    italic         = 0                " If this value is non-zero, the text is italicized.
    underline      = 0                " If this value is non-zero, the text is underlined.
    pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
    facename       = 'ARIAL'          " Font’s name
).

      set_text_value(
        EXPORTING
           text   = po_text
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
          xpos   = 25              " Location in LCD coords to draw at
          ypos   = 75              " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
      ).

      " Customer
      set_font(
  EXPORTING
    height         = 30               " Height of font in pixels
    width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
    weight         = 100              " Font weight as a number between 0 and 900. 0=default, 400=no
    italic         = 0                " If this value is non-zero, the text is italicized.
    underline      = 0                " If this value is non-zero, the text is underlined.
    pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
    facename       = 'ARIAL'          " Font’s name
).

      set_text_value(
        EXPORTING
           text   = customer_text
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
          xpos   = 25              " Location in LCD coords to draw at
          ypos   = 100              " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
      ).
    ENDLOOP.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->DISPLAY_DELIVERY_ITEMS
* +-------------------------------------------------------------------------------------------------+
* | [--->] MATERIAL                       TYPE        ARKTX
* | [--->] QUANTITY                       TYPE        LFIMG
* | [--->] YPOS                           TYPE        INTEGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD display_delivery_items.


    DATA: "material      TYPE string,
      "quantity      TYPE string,
      "ypos          TYPE integer VALUE 100,
      material_text TYPE string,
      qty           TYPE string,
      quantity_text TYPE string,
      count         TYPE i VALUE 0.

    TYPES: BEGIN OF del_item_table,
             material TYPE ARKTX,
             quantity TYPE string,
             line     TYPE i,
           END OF del_item_table.

    DATA: del_items    TYPE del_item_table,
          wa_del_items TYPE del_item_table,
          line_count   TYPE i.

    qty = CONV string( quantity ).

    CONCATENATE '' material INTO material_text.
    CONCATENATE 'Quantity:' qty INTO quantity_text.



    " Delivery Items
    set_font(
      EXPORTING
        height         = 20               " Height of font in pixels
        width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
        weight         = 80              " Font weight as a number between 0 and 900. 0=default, 400=no
        italic         = 0                " If this value is non-zero, the text is italicized.
        underline      = 0                " If this value is non-zero, the text is underlined.
        pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
        facename       = 'ARIAL'          " Font’s name
    ).

    set_text_value(
      EXPORTING
         text   = material_text
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
        xpos   = 10              " Location in LCD coords to draw at
        ypos   = ypos              " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
    ).

    " Quantity
    set_font(
      EXPORTING
        height         = 20               " Height of font in pixels
        width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
        weight         = 80              " Font weight as a number between 0 and 900. 0=default, 400=no
        italic         = 0                " If this value is non-zero, the text is italicized.
        underline      = 0                " If this value is non-zero, the text is underlined.
        pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
        facename       = 'ARIAL'          " Font’s name
    ).

    set_text_value(
      EXPORTING
         text   = quantity_text
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
        xpos   = 450              " Location in LCD coords to draw at
        ypos   = ypos               " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
    ).



*    ENDLOOP.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_CUSTOMER_NAME
* +-------------------------------------------------------------------------------------------------+
* | [--->] CUSTOMER_NUMBER                TYPE        KUNNR
* | [<-()] CUSTOMER_NAME                  TYPE        NAME1
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GET_CUSTOMER_NAME.

        Select single name1 from kna1
      where kunnr = @customer_number
      into @customer_name.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_DELIVERY
* +-------------------------------------------------------------------------------------------------+
* | [--->] DELIVERY_DOCUMENT              TYPE        VBELN_VL
* | [<-()] DELIVERY_DETAILS               TYPE        TT_LIKP
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_delivery.

    SELECT * FROM likp
      WHERE vbeln = @delivery_document
      INTO TABLE @delivery_details .

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_DELIVERY_ITEMS
* +-------------------------------------------------------------------------------------------------+
* | [--->] DELIVERY_DOCUMENT              TYPE        VBELN_VL(optional)
* | [<-()] DELIVERY_ITEMS                 TYPE        TT_LIPS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_delivery_items.
*    data: items type STANDARD TABLE OF i_deliverydocumentitem.

    SELECT * FROM lips
      WHERE vbeln = @delivery_document
      AND uepos = '000000'
*      and updkz NE 'D'
      INTO TABLE @delivery_items.



  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_IMAGE_FILE
* +-------------------------------------------------------------------------------------------------+
* | [<---] FILE_LENGTH                    TYPE        INTEGER
* | [<-()] DATA_TAB                       TYPE        ESY_TT_RCGREPFILE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_image_file.
    DATA: file_path TYPE string,
          result    TYPE boolean,
          rc type i.


    DATA: lt_data TYPE esy_tt_rcgrepfile.

    save_sig_image(
      IMPORTING
        file = file_path
   RECEIVING
      return = result              " Boolean Variable (X = True, - = False, Space = Unknown)
    ).


    CALL METHOD cl_gui_frontend_services=>gui_upload
      EXPORTING
        filename                = file_path        " Name of file
        filetype                = 'BIN'            " File Type (ASCII, Binary)
*       has_field_separator     = space            " Columns Separated by Tabs in Case of ASCII Upload
*       header_length           = 0                " Length of Header for Binary Data
*       read_by_line            = 'X'              " File Written Line-By-Line to the Internal Table
*       dat_mode                = space            " Numeric and date fields are in DAT format in WS_DOWNLOAD
*       codepage                =                  " Character Representation for Output
*       ignore_cerr             = abap_true        " Ignore character set conversion errors?
*       replacement             = '#'              " Replacement Character for Non-Convertible Characters
*       virus_scan_profile      =                  " Virus Scan Profile
      IMPORTING
        filelength              = file_length               " File Length
*       header                  =                  " File Header in Case of Binary Upload
      CHANGING
        data_tab                = data_tab "lt_data          " Transfer table for file contents
*       isscanperformed         = space            " File already scanned
      EXCEPTIONS
        file_open_error         = 1                " File does not exist and cannot be opened
        file_read_error         = 2                " Error when reading file
        no_batch                = 3                " Cannot execute front-end function in background
        gui_refuse_filetransfer = 4                " Incorrect front end or error on front end
        invalid_type            = 5                " Incorrect parameter FILETYPE
        no_authority            = 6                " No upload authorization
        unknown_error           = 7                " Unknown error
        bad_data_format         = 8                " Cannot Interpret Data in File
        header_not_allowed      = 9                " Invalid header
        separator_not_allowed   = 10               " Invalid separator
        header_too_long         = 11               " Header information currently restricted to 1023 bytes
        unknown_dp_error        = 12               " Error when calling data provider
        access_denied           = 13               " Access to file denied.
        dp_out_of_memory        = 14               " Not enough memory in data provider
        disk_full               = 15               " Storage medium is full.
        dp_timeout              = 16               " Data provider timeout
        not_supported_by_gui    = 17               " GUI does not support this
        error_no_gui            = 18               " GUI not available
        OTHERS                  = 19.
    IF sy-subrc <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.


    Call Method cl_gui_frontend_services=>file_delete
      EXPORTING
        filename             =  file_path                 " Name of the file to be deleted
      CHANGING
        rc                   = rc                " Return Code
*      EXCEPTIONS
*        file_delete_failed   = 1                " Could not delete file
*        cntl_error           = 2                " Control error
*        error_no_gui         = 3                " Error: No GUI
*        file_not_found       = 4                " File not found
*        access_denied        = 5                " Access denied
*        unknown_error        = 6                " Unknown error
*        not_supported_by_gui = 7                " GUI does not support this
*        wrong_parameter      = 8                " Wrong parameter
*        others               = 9
      .
    IF SY-SUBRC <> 0.
*     MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*       WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_LCD_CAPTURE_MODE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] MODE                           TYPE        INTEGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_lcd_capture_mode.
    me->get_property( EXPORTING property = 'LCDCaptureMode' IMPORTING value = mode ).
    cl_gui_cfw=>flush(  ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_PO_REFERENCE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] PO_NUMBER                      TYPE        BSTNK
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_po_reference.

*    Select vgbel from lips
*      where vbeln = @delivery_number
*      into @data(sales_document).
*      ENDSELECT.

    DATA(sales_document) = get_sales_order( ).

    SELECT bstnk FROM vbak
      WHERE vbeln = @sales_document
      INTO @po_number.
    ENDSELECT.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_SALES_ORDER
* +-------------------------------------------------------------------------------------------------+
* | [<-()] SALES_ORDER                    TYPE        VBELN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_sales_order.

    SELECT vgbel FROM lips
    WHERE vbeln = @delivery_number
    INTO @sales_order.
    ENDSELECT.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_SIG_STRING
* +-------------------------------------------------------------------------------------------------+
* | [<-()] SIG_STRING                     TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_sig_string.
* Gets sig data from the control in Ascii Data (VB script) compatible format. Data is in the form of an Ascii string.
* Remarks: Used to retrieve or place sig data in the control as a property rather than as a method.
* The data format is Memo Field, ASCII, and unicode compatible.

    me->get_property( EXPORTING property = 'SigString' IMPORTING value = sig_string ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GET_TABLET_STATE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] STATE                          TYPE        INT2
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_tablet_state.
* Returns the current capture state of the control, 1 if accepting data and 0 if not.

    me->get_property( EXPORTING property = 'TabletState' IMPORTING value = state ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->GZIP_SIGNATURE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_SIGNATURE                   TYPE        STRING
* | [--->] IV_VBELN                       TYPE        VBELN
* | [<---] ET_BIN_FORMAT                  TYPE        ESY_TT_RCGREPFILE
* | [<---] EV_BIN_LEN                     TYPE        I
* | [<---] EV_XSTRING                     TYPE        XSTRING
* | [<---] ES_RETURN                      TYPE        BAL_S_MSG
* | [<---] EV_SUBRC                       TYPE        SY-SUBRC
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method GZIP_SIGNATURE.

      DATA: lv_xstring    TYPE xstring.

*M1 START
  DATA: lv_width           TYPE i,
        lv_height          TYPE i,
        lv_handle          TYPE i,
        lo_image_processor TYPE REF TO cl_fxs_image_processor.
*M1 END

  CLEAR ev_subrc.

  CALL FUNCTION 'SSFC_BASE64_DECODE'
    EXPORTING
      b64data                  = iv_signature
    IMPORTING
      bindata                  = lv_xstring
    EXCEPTIONS
      ssf_krn_error            = 1
      ssf_krn_noop             = 2
      ssf_krn_nomemory         = 3
      ssf_krn_opinv            = 4
      ssf_krn_input_data_error = 5
      ssf_krn_invalid_par      = 6
      ssf_krn_invalid_parlen   = 7
      OTHERS                   = 8.
  IF sy-subrc <> 0.
    ev_subrc = 4.

    es_return-msgty = 'E'.
    es_return-msgid = 'J0'.
    es_return-msgno = '000'.
    es_return-msgv1 = 'Error to process BASE64 Decode'.
    es_return-msgv2 = 'Document:'.
    es_return-msgv3 = iv_vbeln.

  ELSE.
    ev_xstring = lv_xstring.

*M1 START
*Begin M2
*    lv_width = 992.
*    lv_height = 329.
     lv_width = 900.
     lv_height = 240.
*End M2

    CREATE OBJECT lo_image_processor TYPE cl_fxs_image_processor.

    TRY.
        CALL METHOD lo_image_processor->add_image
          EXPORTING
            iv_data   = lv_xstring
*           iv_image_name = lv_file_name
          RECEIVING
            rv_handle = lv_handle.

        CALL METHOD lo_image_processor->resize
          EXPORTING
            iv_handle = lv_handle
            iv_xres   = lv_width
            iv_yres   = lv_height.

        CALL METHOD lo_image_processor->get_image
          EXPORTING
            iv_handle  = lv_handle
          RECEIVING
            rv_xstring = lv_xstring.

      CATCH cx_fxs_image_unsupported .
        lv_xstring = ev_xstring.
      CATCH cx_sy_range_out_of_bounds .
        lv_xstring = ev_xstring.
    ENDTRY.
*M1 END

    CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
      EXPORTING
        buffer        = lv_xstring
      IMPORTING
        output_length = ev_bin_len
      TABLES
        binary_tab    = et_bin_format.

    IF sy-subrc NE 0.
      ev_subrc = 4.
      es_return-msgty = 'E'.
      es_return-msgid = 'J0'.
      es_return-msgno = '000'.
      es_return-msgv1 = 'Error to Convert Signature to Binary'.
      es_return-msgv2 = 'Document:'.
      es_return-msgv3 = iv_vbeln.

    ENDIF.


  ENDIF.

  IF ev_subrc IS INITIAL.
    es_return-msgty = 'S'.
    es_return-msgid = 'J0'.
    es_return-msgno = '000'.
    es_return-msgv1 = 'Signature uncompressed Succesfully'.
    es_return-msgv2 = 'Document:'.
    es_return-msgv3 = iv_vbeln.

  ENDIF.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->INIT_SIG_PLUS
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD init_sig_plus.
*Used to properly instantiate SigPlus. Must call when SigPlus is instantiated dynamically.
*No need to call when using a design-time instance of SigPlus.


    me->call_method( method = 'InitSigPlus' ).

    refresh_tablet_screen(
      EXPORTING
        mode  = 0                " 0 = Clear 1 = Complement 2 = WriteTransparent 3 = WriteTrans
        xpos  = 0                " Location in LCD coordinates (upper left - 0,0)
        ypos  = 0                " Location in LCD coordinates (upper left - 0,0)
        xsize = 640              " XSize in LCD pixels
        ysize = 480              " YSize in LCD pixels
    ).

*    set_font( ).
*    set_text_value(
*      EXPORTING
*        text   = 'Instantiated'
*        dest   = 0
*        mode   = 2
*        xpos   = 100
*        ypos   = 100
*        xsize  = 600
*        ysize  = 600
*        format = 0
*    ).

    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->IS_CUSTMER_CERT_REQUIRED
* +-------------------------------------------------------------------------------------------------+
* | [<-()] DISCLAIMER_REQUIRED            TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD is_custmer_cert_required.
"This method uses logic to idenfity customers that need to see the customer certifcation statement on screen 2.

*  USING
*    p_vbeln TYPE likp-vbeln
*  CHANGING
*    p_required TYPE kna1-katr3.
    TYPES:
      BEGIN OF t_disclaimer,
        vbeln TYPE vbfa-vbeln,
        posnn TYPE vbfa-posnn,
        katr3 TYPE kna1-katr3,
      END OF t_disclaimer,

      tt_disclaimer TYPE STANDARD TABLE OF t_disclaimer.


    DATA: i_disclaimer   TYPE tt_disclaimer,
          wa_disclaimer  TYPE t_disclaimer,
          disclaimer_req TYPE boolean.

    SELECT vbfa~vbeln vbfa~posnn kna1~katr3
      INTO TABLE i_disclaimer[]
      FROM vbfa
      INNER JOIN vbpa ON vbpa~vbeln = vbfa~vbelv "get payer from sales order
      INNER JOIN kna1 ON kna1~kunnr = vbpa~kunnr "get customer master info from payer
      WHERE vbfa~vbeln = delivery_number "Delivery
      AND vbfa~vbtyp_n = 'J' "Delivery
      AND vbfa~vbtyp_v = 'C' "Order
      AND vbfa~plmin = '+'   "only directly related sales orders
      AND vbpa~parvw = 'RG'. "payer

    LOOP AT i_disclaimer INTO wa_disclaimer.
      IF wa_disclaimer-katr3 =  'Y'.
        disclaimer_required = abap_true.

      ELSE.
        disclaimer_required = abap_false.
      ENDIF.
    ENDLOOP.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->KEY_PAD_ADD_HOT_SPOT
* +-------------------------------------------------------------------------------------------------+
* | [--->] KEYCODE                        TYPE        INT2
* | [--->] COORDS                         TYPE        INT2
* | [--->] XPOS                           TYPE        INT2
* | [--->] YPOS                           TYPE        INT2
* | [--->] XSIZE                          TYPE        INT2
* | [--->] YSIZE                          TYPE        INT2
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD key_pad_add_hot_spot.

*    me->call_method( method = 'KeyPadAddHotSpot'
*                                      p1 = keycode
*                                      p2 = coords
*                                      p3 = xpos
*                                      p4 = ypos
*                                      p5 = xsize
*                                      p6 = ysize
*                                      p_count = 6 ).

    me->call_method( method = 'KeyPadAddHotSpot' p1 = keycode p2 = coords p3 = xpos p4 = ypos p5 = xsize p6 = ysize p_count = 6 ) .

*wait UP TO 60 SECONDS.


*        me->call_method( method = 'KeyPadAddHotSpot'
*                                      p1 = 0
*                                      p2 = 1
*                                      p3 = 0
*                                      p4 = 0
*                                      p5 = 640
*                                      p6 = 480
*                                      p_count = 6 ).
    cl_gui_cfw=>flush(  ).


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->KEY_PAD_CLEAR_HOT_SPOT_LIST
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD key_pad_clear_hot_spot_list.

    me->call_method( method = 'KeyPadClearHotSpotList' ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->KEY_PAD_QUERY_HOT_SPOT
* +-------------------------------------------------------------------------------------------------+
* | [--->] KEY_CODE                       TYPE        INT1
* | [<-()] RETURN                         TYPE        INT2
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD key_pad_query_hot_spot.
    DATA: result TYPE int1.



    me->call_method( EXPORTING method = 'KeyPadQueryHotSpot'
                                      p1 = key_code
                                      p_count = 1
                                      IMPORTING
                                      result = return
                                   ).

    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->LCD_CAPTURE_MODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] MODE                           TYPE        INTEGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD lcd_capture_mode.
*Function: This property sets the current LCD Mode for the tablet, the tablet is put into the mode as well.

*Mode 0 – No LCD Tablet. No LCD commands are sent to the tablet
*Mode 1 - Capture Default. CTRL-D is sent to the tablet, which clears the tablet and sets
*capture mode to be active with Autoerase in the tablet.
*Mode 2 - Capture Ink CTRL-T is sent to the tablet, putting the tablet in persistent ink
*capture mode where the tablet does not automatically clear the display.
*Mode 3 - Capture Ink Inverted: CTRL-I is sent to the tablet, where signature ink is
*displayed inverted against a suitabl

    me->set_property( EXPORTING property = 'LCDCaptureMode' value = mode ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->LCD_WRITE_BITMAP
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURN                         TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD lcd_write_bitmap.


    lcd_capture_mode( mode = 2 ).
    set_lcd_pixel_depth( depth = 8 ).

    me->call_method( method = 'LCDWriteBitmap'     p1 = 0
                                                   p2 = 2
                                                   p3 = 0
                                                   p4 = 0
                                                   p5 = 640
                                                   p6 = 426
                                                   p7 = ''
                                              p_count = 7 ).
    cl_gui_cfw=>flush(  ).




  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->LCD_WRITE_IMAGE
* +-------------------------------------------------------------------------------------------------+
* | [--->] DEST                           TYPE        INTEGER (default =0)
* | [--->] MODE                           TYPE        INTEGER (default =2)
* | [--->] XPOS                           TYPE        INTEGER (default =0)
* | [--->] YPOS                           TYPE        INTEGER (default =0)
* | [--->] XSIZE                          TYPE        INTEGER
* | [--->] YSIZE                          TYPE        INTEGER
* | [--->] FORMAT                         TYPE        INTEGER (default =0)
* | [--->] FILENAME                       TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD lcd_write_image.

*    write_img_file( ). This is only needed to save images created on the machine that need to be saved to a location.
*    set_tablet_state( state = 1 ).
*    lcd_capture_mode( mode = 2 ).
*    set_lcd_pixel_depth( depth = 8 ).
*    .bmp files must have a Bit Depth of 24 or less


    me->call_method( method = 'LCDWriteFile' p1 = dest
                                         p2 = mode
                                         p3 = xpos
                                         p4 = ypos
                                         p5 = xsize   "these need to match the image
                                         p6 = ysize   "these need to match the image
                                         p7 = format
                                         p8 = filename
                                         p_count = 8 ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->NEXT_BUTTON
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD next_button.




    " NEXT
    lcd_write_image(
      EXPORTING
*        dest     = 0                " 0 = Foreground, 1 = Background memory in tablet#
*        mode     = 2                " 0 = Clear 1 = Complement 2 = WriteOpaque 3 = Write Transpare
        xpos     = 450               " Location in LCD coords to draw at
        ypos     = 375                " Location in LCD coords to draw at
        xsize    = 130                 " Image Width in LCD pixels
        ysize    = 72                 " Image Height in LCD pixels
*        format   = 0                " Image file format, see WriteImageFile
        filename =  'C:\Operate\Topaz\Next-24.bmp'                " Path and name of BMP image file to load as string
    ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->NEXT_FIVE_ITEMS_TO_PROCESS
* +-------------------------------------------------------------------------------------------------+
* | [--->] START                          TYPE        INTEGER
* | [--->] END                            TYPE        INTEGER
* | [<-()] PROCESS_COMPLETE               TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD next_five_items_to_process.

    DATA: lt_delivery_list TYPE STANDARD TABLE OF lips,
          wa_delivery_list TYPE lips.

    DATA(delivery_items) = delivery_items_att. "attribute
    DATA(item_count) = lines( delivery_items ).

    LOOP AT delivery_items INTO DATA(wa_delivery_items).
      DATA(row) = syst-tabix.
      IF row BETWEEN start AND end.

        wa_delivery_list-arktx = wa_delivery_items-arktx.
        wa_delivery_list-lfimg = wa_delivery_items-lfimg.
*      line_item = line_item + 1.
        APPEND wa_delivery_list TO lt_delivery_list.
      ENDIF.
    ENDLOOP.

    IF item_count LE start OR item_count LT end.
      process_complete = abap_true.
      stop_processing = abap_true.
    ENDIF.


    delivery_items_to_process = lt_delivery_list.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->NUMBER_OF_TABLET_POINTS
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURN                         TYPE        INTEGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD NUMBER_OF_TABLET_POINTS.

    me->call_method( EXPORTING method = 'NumberOfTabletPoints'
                           IMPORTING
                             result = return
                             ).

    cl_gui_cfw=>flush(  ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->REFRESH_TABLET_SCREEN
* +-------------------------------------------------------------------------------------------------+
* | [--->] MODE                           TYPE        INTEGER (default =0)
* | [--->] XPOS                           TYPE        INTEGER (default =0)
* | [--->] YPOS                           TYPE        INTEGER (default =0)
* | [--->] XSIZE                          TYPE        INTEGER (default =640)
* | [--->] YSIZE                          TYPE        INTEGER (default =480)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD refresh_tablet_screen.
*    The tablet is sent a refresh command with 4 possible modes.

    me->call_method( method = 'LCDRefresh' p1 = mode p2 = xpos p3 = ypos p4 = xsize p5 = ysize p_count = 5 ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SAVE_SIG_IMAGE
* +-------------------------------------------------------------------------------------------------+
* | [<---] FILE                           TYPE        STRING
* | [<-()] RETURN                         TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD save_sig_image.

*    DATA: file_pathway     TYPE string VALUE 'C:\Users\marks\Documents\Projects\Border States\Signatures\',
    DATA: file_pathway     TYPE string VALUE 'C:\Operate\',
          file_description TYPE string,
          file_name        TYPE string,
          file_format      TYPE string VALUE '.bmp',
          full_file_path   TYPE string.

    file_description = CONV string( delivery_number ).

    CONCATENATE file_pathway file_description INTO file_name.
    CONCATENATE file_name file_format INTO full_file_path.


    return =  write_image_file( file_name = full_file_path ).
    file = full_file_path.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_BUTTON_HOTSPOTS
* +-------------------------------------------------------------------------------------------------+
* | [--->] CANCEL                         TYPE        BOOLEAN
* | [--->] ACCEPT                         TYPE        BOOLEAN
* | [--->] CLEAR                          TYPE        BOOLEAN
* | [--->] NEXT                           TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_button_hotspots.


    IF cancel = abap_true.
      "Cancel button
      lcd_capture_mode( mode = 2 ).
      key_pad_add_hot_spot(
      EXPORTING
        keycode = 1                 " Integer value defining the HotSpot
        coords  = 1                 " 0 = Logical tablet coordinates 1 = LCD Coordinates
        xpos    = 45                " Location (upper left - 0,0)
        ypos    = 370                " Location (upper left - 0,0)
        xsize   = 135                " XSize in pixels
        ysize   = 75                " YSize in pixels
    ).
    ENDIF.
    IF accept = abap_true.
      "Accept button
      lcd_capture_mode( mode = 2 ).
      key_pad_add_hot_spot(
       EXPORTING
         keycode = 2                 " Integer value defining the HotSpot
         coords  = 1                 " 0 = Logical tablet coordinates 1 = LCD Coordinates
         xpos    = 445                 " Location (upper left - 0,0)
         ypos    = 370                 " Location (upper left - 0,0)
         xsize   = 135                " XSize in pixels
         ysize   = 75                 " YSize in pixels
     ).

    ENDIF.
    IF clear = abap_true.
      "Back button
      lcd_capture_mode( mode = 2 ).
      key_pad_add_hot_spot(
       EXPORTING
         keycode = 3                 " Integer value defining the HotSpot
         coords  = 1                 " 0 = Logical tablet coordinates 1 = LCD Coordinates
         xpos    = 270                 " Location (upper left - 0,0)
         ypos    = 370                 " Location (upper left - 0,0)
         xsize   = 115                " XSize in pixels
         ysize   = 72                 " YSize in pixels
     ).
    ENDIF.
    IF next = abap_true.
      "Accept button
      lcd_capture_mode( mode = 2 ).
      key_pad_add_hot_spot(
       EXPORTING
         keycode = 4                 " Integer value defining the HotSpot
         coords  = 1                 " 0 = Logical tablet coordinates 1 = LCD Coordinates
         xpos    = 445                 " Location (upper left - 0,0)
         ypos    = 370                 " Location (upper left - 0,0)
         xsize   = 135                " XSize in pixels
         ysize   = 75                 " YSize in pixels
     ).
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_FONT
* +-------------------------------------------------------------------------------------------------+
* | [--->] HEIGHT                         TYPE        INTEGER (default =50)
* | [--->] WIDTH                          TYPE        INTEGER (default =0)
* | [--->] WEIGHT                         TYPE        INTEGER (default =100)
* | [--->] ITALIC                         TYPE        INTEGER (default =0)
* | [--->] UNDERLINE                      TYPE        INTEGER (default =0)
* | [--->] PITCHANDFAMILY                 TYPE        INTEGER (default =0)
* | [--->] FACENAME                       TYPE        STRING (default ='ARIAL')
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_font.

* Function: Sets the size, type, and properties of font used when calling the LCDWriteString method.
* The arguments are all defined in the LOGFONT data structure
*(see CreateFont function of Windows API) in Windows for logical fonts.

*Arguments:
*Height Height of font in pixels
*Width Width of font in pixels (If 0, the font mapper uses a default width that matches the height.)
*Weight: Font weight as a number between 0 and 900. 0=default, 400=normal, and 700=bold.
*Italic: If this value is non-zero, the text is italicized.
*Underline: If this value is non-zero, the text is underlined.
*PitchAndFamily: Specifies the pitch (fixed or variable width) and font family used if the font you
*request is unavailable. If you specify a font that's likely to be, then this argument can be left as 0.
*FaceName: Font’s name—for example, "Times New Roman", "Courier New", “Arial”


    me->call_method( method = 'LCDSetFont'
                         p1 = height
                         p2 = width
                         p3 = weight
                         p4 = italic
                         p5 = underline
                         p6 = pitchandfamily
                         p7 = facename
                         p_count = 7 ).

    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_IMAGE_PEN_WIDTH
* +-------------------------------------------------------------------------------------------------+
* | [--->] PIXELS                         TYPE        INTEGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_image_pen_width.

     me->set_property( EXPORTING property = 'ImagePenWidth' value = pixels
                                     ).

    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_IMAGE_SIZE
* +-------------------------------------------------------------------------------------------------+
* | [--->] YSIZE                          TYPE        INTEGER
* | [--->] XSIZE                          TYPE        INTEGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SET_IMAGE_SIZE.

           me->set_property( EXPORTING property = 'ImageXSize' value = xsize
                                 ).
       me->set_property( EXPORTING property = 'ImageYSize' value = ysize
                                 ).

    cl_gui_cfw=>flush(  ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_LCD_PIXEL_DEPTH
* +-------------------------------------------------------------------------------------------------+
* | [--->] DEPTH                          TYPE        INTEGER
* | [<-()] RETURN                         TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_lcd_pixel_depth.

*Color image use only with T-LBK57GC and T-LBK43LC devices.
*Used to specify color or black and white images when passing an image to paint to the
*LCD using the LCDWriteFile() or LCDWriteBitmap() functions. Call SetLCDPixelDepth()
*appropriately prior to painting to the LCD.
*Depth = 0 - Tells SigPlus to expect a black and white image for painting.
*Depth = 8 - Tells SigPlus to expect a color image for painting.


    me->call_method( method = 'SetLCDPixelDepth' p1 = depth  p_count = 1 ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_LCD_WINDOW
* +-------------------------------------------------------------------------------------------------+
* | [--->] XSTART                         TYPE        INTEGER(optional)
* | [--->] YSTART                         TYPE        INTEGER(optional)
* | [--->] XSIZE                          TYPE        INTEGER(optional)
* | [--->] YSIZE                          TYPE        INTEGER(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_lcd_window.

    me->call_method( method = 'LCDSetWindow' p1 = xstart p2 = ystart p3 =  xsize p4 = ysize p_count = 4 ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_LOG_ENABLED
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_log_enabled.

    me->call_method( method = 'SetLogEnable' p1 = abap_true p_count = 1 ).

    cl_gui_cfw=>flush(  ).


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_LOG_FILE_PATH
* +-------------------------------------------------------------------------------------------------+
* | [--->] FILE_PATH                      TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_log_file_path.
    me->call_method( method = 'SetLogFilePath' p1 = file_path  p_count = 1 ) .

    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_SIG_WINDOW
* +-------------------------------------------------------------------------------------------------+
* | [--->] COORDS                         TYPE        INTEGER
* | [--->] XPOS                           TYPE        INTEGER
* | [--->] YPOS                           TYPE        INTEGER
* | [--->] XSIZE                          TYPE        INTEGER
* | [--->] YSIZE                          TYPE        INTEGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_sig_window.

*Function: This function sets a window in the logical tablet space that restricts the
*operation of some functions to the specified window. The functions behave as follows:
*JustifyMode will only operate on points inside of this window.
*ExportSigFile and WriteImageFile will only operate on points inside the window.
*SigString only operates on points inside of the window.
*ClearTablet will only clear in the window.
*

*Remarks: This behavior is enabled by setting the start and stop values to non-zero. The window
*defaults to (0,0,0,0). The window can be enabled at one spot, re-enabled at another, etc., without
*disabling in between, and then disabled when the various parts of the tablet data have been
*separated and stored. To determine the logical values in the control for the installed tablet, see the
*TabletLogicalXSize and TabletLogicalYSize properties.



    set_lcd_window( ).
    me->call_method( method = 'SetSigWindow' p1 = 1 p2 = 0 p3 =  0 p4 = 1 p5 = 1 p_count = 5 ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_TABLET_STATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] STATE                          TYPE        INT1
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_tablet_state.

*Set the capture state of the control. When the control is active, pen data is captured and
*added to the current signature.
*1 Active - Attaches the control to the COM port and starts accepting data.
*0 Inactive - Detaches from the port and stops gathering data. Default state is 0.

    me->set_property( EXPORTING property = 'TabletState' value = state ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SET_TEXT_VALUE
* +-------------------------------------------------------------------------------------------------+
* | [--->] TEXT                           TYPE        STRING
* | [--->] DEST                           TYPE        INTEGER (default =0)
* | [--->] MODE                           TYPE        INTEGER (default =2)
* | [--->] XPOS                           TYPE        INTEGER (default =100)
* | [--->] YPOS                           TYPE        INTEGER (default =100)
* | [--->] XSIZE                          TYPE        INTEGER (default =600)
* | [--->] YSIZE                          TYPE        INTEGER (default =600)
* | [--->] FORMAT                         TYPE        INTEGER (default =0)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD set_text_value.

*Used to write the image data to the LCD Display. The data is written at the location
*specified by the combination of Dest, XPos, and YPos. The Mode determines how the data is written.

* See remarks below on the format argument.
*Mode 0 - Clear: The Display is cleared at the specified location.
*Mode 1 - Complement: The Display is complemented at the specified location.
*Mode 2 - WriteOpaque: The contents of the background memory in the tablet are
*transferred to the LCD display, overwriting the contents of the LCD display.
*Mode 3 - WriteTransparent: The contents of the background memory in the tablet are
*combined with and transferred to the visible LCD memory.

*Arguments: Integers:
*Dest: 0 = Foreground, 1 = Background memory in tablet
*Mode 0, 1, 2, 3 as defined above
*XPos Location in LCD coords to draw at
*YPos Same
*XSize Width in LCD pixels
*YSize Height in LCD pixels
*Format Not currently implemented, pass a 0
*String: Text to display on the LCD



*    set_font(
*      EXPORTING
*        height         = 50
*        width          = 0
*        weight         = 100
*        italic         = 0
*        underline      = 0
*        pitchandfamily = 0
*        facename       = 'ARIAL'
*    ).
*    clear_tablet_screen( ).
    me->call_method( method = 'LCDWriteString' p1 = dest
                                               p2 = mode
                                               p3 = xpos
                                               p4 = ypos
                                               p5 = xsize
                                               p6 = ysize
                                               p7 = format
                                               p8 = Text
                                               p_count = 8 ).
*    me->call_method( method = 'LCDWriteString' p1 = 0 p2 = 2 p3 = 100 p4 = 100 p5 = 600 p6 = 600 p7 = 0 p8 = Text  p_count = 8 ).
    cl_gui_cfw=>flush(  ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SIGNATURE_COMPLETE_SCREEN
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SIGNATURE_COMPLETE_SCREEN.


    init_sig_plus( ).
    refresh_tablet_screen( ).
    set_tablet_state( state = 0 ).
    lcd_capture_mode( mode = 0 ).

    refresh_tablet_screen( ).

    process_status = 'X'. "set class attribute

    set_font(
      EXPORTING
        height         = 50               " Height of font in pixels
        width          = 0                " Width of font in pixels (If 0, the font mapper uses a defaul
        weight         = 200              " Font weight as a number between 0 and 900. 0=default, 400=no
        italic         = 0                " If this value is non-zero, the text is italicized.
        underline      = 0                " If this value is non-zero, the text is underlined.
        pitchandfamily = 0                " Specifies the pitch (fixed or variable width) and font famil
        facename       = 'ARIAL'          " Font’s name
    ).

    set_text_value(
      EXPORTING
         text   = ' '
*         dest   = 0                " 0 = Foreground, 1 = Background memory in tablet
*         mode   = 2                " 0 = Clear 1 = Complement, 2 = WriteOpaque, 3= WriteTranspare
        xpos   = 130              " Location in LCD coords to draw at
        ypos   = 240              " Location in LCD coords to draw at
*         xsize  = 600              " Width in LCD pixels
*         ysize  = 600              " Height in LCD pixels
*         format = 0                " Not currently implemented, pass a 0
    ).

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SIGNATURE_HEADER_AND_AREA
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD signature_header_and_area.


    "Paint "Signature" header
    lcd_write_image(
      EXPORTING
        dest = 0
        mode = 2
        xpos = 0
        ypos = 0
        xsize = 640    " Image Width in LCD pixels
        ysize = 33    " Image Height in LCD pixels
*        filename = 'C:\Users\marks\Documents\Projects\Border States\bmp images\Signature-2.bmp' "Need seperate image const class
        filename = 'C:\Operate\Topaz\Signature-2.bmp' "Need seperate image const class

    ).


    "Paint "Signature Area" header
    lcd_write_image(
      EXPORTING
        dest = 0
        mode = 2
        xpos = 27
        ypos = 150
        xsize = 582    " Image Width in LCD pixels
        ysize = 210    " Image Height in LCD pixels
*        filename = 'C:\Users\marks\Documents\Projects\Border States\bmp images\Signature_Area.bmp'
        filename = 'C:\Operate\Topaz\Signature_Area.bmp'

    ).


    set_lcd_window(
      EXPORTING
        xstart = 27                  " LOCATION IN LCD COORDINATES (UPPER LEFT - 0,0)
        ystart = 150                 " LOCATION IN LCD COORDINATES (UPPER LEFT - 0,0)
        xsize  = 582                 " XSIZE IN LCD PIXELS
        ysize  = 210                 " YSIZE IN LCD PIXELS
    ).
*
*    set_sig_window(
*      EXPORTING
*        coords = 1                 " 0 = Logical tablet coordinates, 1 = LCD Coordinates
*        xpos   = 27                 " Location in logical tablet coordinates (upper left - 0,0)
*        ypos   = 150                 " Location in logical tablet coordinates (upper left - 0,0)
*        xsize  = 582                 " XSize in logical tablet pixels
*        ysize  = 211                 " YSize in logical tablet pixels
*    ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SIGNATURE_SCREEN_3
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD signature_screen_3.

    init_sig_plus( ). "remove this before going to production
    refresh_tablet_screen(
      EXPORTING
        mode  = 0                " 0 = Clear 1 = Complement 2 = WriteTransparent 3 = WriteTrans
        xpos  = 0                " Location in LCD coordinates (upper left - 0,0)
        ypos  = 0                " Location in LCD coordinates (upper left - 0,0)
        xsize = 640              " XSize in LCD pixels
        ysize = 480              " YSize in LCD pixels
    ).
    set_tablet_state( state = 0 ).
    lcd_capture_mode( mode = 2 ).
    set_lcd_pixel_depth( depth = 8 ).
    set_image_pen_width( pixels = 10 ).
    signature_header_and_area( ).
    "display delivery number, po number and customer
    display_delivery_info( ).
    set_tablet_state( state = 1 ).
    cancel_accept_buttons( ).
    clear_button( ).

    set_button_hotspots(
      EXPORTING
        cancel =  abap_true
        accept =  abap_true
        clear  =  abap_true
        next = abap_false
    ).

     sig_screen_button_listener( ).





  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SIG_PROCESS_STATUS
* +-------------------------------------------------------------------------------------------------+
* | [--->] STATUS                         TYPE        BOOLEAN(optional)
* | [<-()] RETURN_STATUS                  TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method SIG_PROCESS_STATUS.

    return_status = status.


  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->SIG_SCREEN_BUTTON_LISTENER
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD sig_screen_button_listener.

    DATA: initial_sig_value  TYPE string VALUE 0,
          cancel_btn_clicked TYPE integer VALUE 0,
          accept_btn_clicked TYPE integer VALUE 0,
          clear_btn_clicked  TYPE integer VALUE 0,
          signature_present  TYPE integer VALUE 0.

    create_sig_area_hot_spot( ).


"Wait for button to be clicked
    WHILE cancel_btn_clicked EQ 0 AND accept_btn_clicked EQ 0 AND clear_btn_clicked EQ 0.

      cancel_btn_clicked = key_pad_query_hot_spot( key_code = 1 ).
      accept_btn_clicked = key_pad_query_hot_spot( key_code = 2 ).
      clear_btn_clicked = key_pad_query_hot_spot( key_code = 3 ).

    ENDWHILE.


    IF clear_btn_clicked > 0.
      signature_screen_3( ).
    ENDIF.

    IF cancel_btn_clicked > 0 .
      delivery_canceled_screen( ).
      MESSAGE 'Customer has canceled Delivery' TYPE 'I'.
      RETURN.

    ENDIF.


    IF accept_btn_clicked > 0 .

      signature_present = key_pad_query_hot_spot( key_code = 5 ).
      IF signature_present > 0.

     set_image_size(
        EXPORTING
          ysize =   200            " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
          xsize =   700           " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
      ).
"Update the delivery document header text and create BDS document with signature file
      update_delivery_header_sig( ).
      signature_complete_screen( ).

      MESSAGE 'Signature Saved' TYPE 'I'.
      RETURN.
      ELSE.
        signature_screen_3( ).
      ENDIF.
    ENDIF.

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->START_SIGNATURE_PROCESS
* +-------------------------------------------------------------------------------------------------+
* | [--->] DELIVERY_NUMBER                TYPE        VBELN
* | [--->] DELIVERY_ITEMS                 TYPE        TT_LIPS(optional)
* | [<-()] RE_PROCESS_STATUS              TYPE        FLAG
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD start_signature_process.
    " The purpose of this method is to kick off the entire signature process. 1. It sets the Delivery Items Attribute so it can be used throught the class.
    " 2.then it calls the Screen Flow method that determins how the screens are created for delivery items based on the number of items.
    " 3. Process status is used to determin if the signature was capture succesfully.
   delivery_items_att = delivery_items.
   Delivery_item_screen_FLOW( delivery_document = delivery_number ).
   re_process_status = process_status. "assigning class attribute to return variable


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->TABLET_CONNECT_QUERY
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURN                         TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method TABLET_CONNECT_QUERY.

        me->call_method( EXPORTING method = 'TabletConnectQuery'

                                      IMPORTING
                                      result = return
                                   ).

    cl_gui_cfw=>flush(  ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->UNREGISTER_CACHED_W_P
* +-------------------------------------------------------------------------------------------------+
* | [--->] DELIVERY_DOCUMENT              TYPE        VBELN_VL
* | [--->] CUSTOMER                       TYPE        KUNAG
* | [<-()] DELIVERY_ITEMS                 TYPE        LIPS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD unregister_cached_w_p.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->UPDATE_DELIVERY_HEADER_SIG
* +-------------------------------------------------------------------------------------------------+
* | [<---] ES_RETURN                      TYPE        BAL_S_MSG
* | [<---] EV_SUBRC                       TYPE        SY-SUBRC
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD update_delivery_header_sig.

* BDS handling
    CONSTANTS:
      bds_classname TYPE sbdst_classname VALUE 'DEVC_STXD_BITMAP',
      bds_classtype TYPE sbdst_classtype VALUE 'OT',          " others
      bds_mimetype  TYPE bds_mimetp      VALUE 'application/octet-stream',
      temp2(5)      TYPE c VALUE ' ''',
      temp1(5)      TYPE c VALUE '''',
      autoheight    TYPE stxbitmaps-autoheight VALUE 'X', "reserve
      bmcomp        TYPE stxbitmaps-bmcomp VALUE 'X', "compress
      object        TYPE stxbitmaps-tdobject VALUE 'GRAPHICS',
      id            TYPE stxbitmaps-tdid VALUE 'BMAP',
      btype         TYPE stxbitmaps-tdbtype VALUE 'BMON',
      title         TYPE bapisignat-prop_value VALUE 'Signature'.

* for uploading the signature
    DATA:
      filename   TYPE rlgrap-filename,      "path & name of bmp
      name       TYPE stxbitmaps-tdname,    "saved bmp name
      resident   TYPE stxbitmaps-resident,
      resolution TYPE stxbitmaps-resolution,
      lt_flines  TYPE STANDARD TABLE OF tline,
      ls_flines  TYPE tline,
      name_text  TYPE thead-tdname,
      object_key TYPE sbdst_object_key.

    DATA:
      docid         TYPE stxbitmaps-docid,
      width_tw      TYPE stxbitmaps-widthtw,
      height_tw     TYPE stxbitmaps-heighttw,
      width_pix     TYPE stxbitmaps-widthpix,
      height_pix    TYPE stxbitmaps-heightpix,
      color         TYPE c LENGTH 1,
      bds_bytecount TYPE i.

    DATA:
      lo_bds_object     TYPE REF TO cl_bds_document_set,
      lt_bds_content    TYPE sbdst_content,
      lt_bds_components TYPE sbdst_components,
      wa_bds_components TYPE LINE OF sbdst_components,
      lt_bds_signature  TYPE sbdst_signature,
      wa_bds_signature  TYPE LINE OF sbdst_signature,
      lt_bds_properties TYPE sbdst_properties,
      wa_bds_properties TYPE LINE OF sbdst_properties,
      wa_stxbitmaps     TYPE stxbitmaps.

    DATA: lt_bin_data TYPE esy_tt_rcgrepfile,
          lv_bin_len  TYPE i,
          lv_return   TYPE sy-subrc,
          ls_msg      TYPE bal_s_msg,
          iv_bin_len  TYPE i,
          it_bin_sig  TYPE esy_tt_rcgrepfile.

    TYPES: BEGIN OF ty_data,
             field1 TYPE string,
             field2 TYPE i,
           END OF ty_data.


    DATA: lt_data TYPE esy_tt_rcgrepfile,
          xstring TYPE xstring.

*M1 START
    DATA: lv_width           TYPE i,
          lv_height          TYPE i,
          lv_handle          TYPE i,
          lo_image_processor TYPE REF TO cl_fxs_image_processor.




    get_image_file(
      IMPORTING
        file_length = iv_bin_len                 " Whole Number with +/- Sign (-2.147.483.648 .. 2.147.483.647)
      RECEIVING
        data_tab    = it_bin_sig
    ).


    CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
      EXPORTING
        input_length = iv_bin_len
*       FIRST_LINE   = 0
*       LAST_LINE    = 0
      IMPORTING
        buffer       = xstring
      TABLES
        binary_tab   = it_bin_sig
* EXCEPTIONS
*       FAILED       = 1
*       OTHERS       = 2
      .
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.


     lv_width = 900.
     lv_height = 240.

    CREATE OBJECT lo_image_processor TYPE cl_fxs_image_processor.

    TRY.
        CALL METHOD lo_image_processor->add_image
          EXPORTING
            iv_data   = xstring
*           iv_image_name = lv_file_name
          RECEIVING
            rv_handle = lv_handle.

        CALL METHOD lo_image_processor->resize
          EXPORTING
            iv_handle = lv_handle
            iv_xres   = lv_width
            iv_yres   = lv_height.

        CALL METHOD lo_image_processor->get_image
          EXPORTING
            iv_handle  = lv_handle
          RECEIVING
            rv_xstring = xstring.

      CATCH cx_fxs_image_unsupported INTO DATA(error_message) .
*        xstring = ev_xstring.
      CATCH cx_sy_range_out_of_bounds .
*        xstring = ev_xstring.
    ENDTRY.
*M1 END

    CALL FUNCTION 'SCMS_XSTRING_TO_BINARY'
      EXPORTING
        buffer        = xstring
      IMPORTING
        output_length = iv_bin_len
      TABLES
        binary_tab    = lt_bin_data.




    CALL FUNCTION 'Z_CC_CREATE_SIGNATURE_TEXT'
  EXPORTING
    it_bin_sig       = lt_bin_data
    iv_bin_len       = iv_bin_len
    iv_vbeln         = delivery_number
 IMPORTING
   ES_RETURN        = es_return
*   EV_SUBRC         = ev_subrc
.


  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->WRITE_IMAGE_FILE
* +-------------------------------------------------------------------------------------------------+
* | [--->] FILE_NAME                      TYPE        STRING
* | [<-()] RETURN                         TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD write_image_file.

    me->call_method( EXPORTING method = 'WriteImageFile'
                                      p1 = file_name
                                      p_count = 1
                                      IMPORTING
                                      result = return
                                   ).

    cl_gui_cfw=>flush(  ).

  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_TOPAZ_SIGPLUS_GUI_CONTROL->WRITE_IMG_FILE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURN                         TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD write_img_file.

*The control will write out a signature file in the current Image file format. The default is .BMP.
*FileName is a string, containing the path and filename to write to

    me->call_method( method = 'WriteImageFile'
                         p1 = ' WriteImageFile is for saving the contents (the signature) of the SigPlus control out to file as an image'
                    p_count = 1 ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.
ENDCLASS.
