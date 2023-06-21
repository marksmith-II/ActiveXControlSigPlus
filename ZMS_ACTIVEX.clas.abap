class ZMS_ACTIVEX definition
  public
  inheriting from CL_GUI_CONTROL
  final
  create public .

public section.

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
  methods SET_LCD_WINDOW .
  methods LCD_CAPTURE_MODE
    importing
      !MODE type INTEGER .
  methods LCD_WRITE_IMAGE .
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
protected section.

  methods UNREGISTER_CACHED_W_P .
private section.
ENDCLASS.



CLASS ZMS_ACTIVEX IMPLEMENTATION.


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


  method GET_TABLET_STATE.
* Returns the current capture state of the control, 1 if accepting data and 0 if not.

    me->get_property( exporting property = 'TabletState' importing value = state ).
    cl_gui_cfw=>flush(  ).
  endmethod.


  method SET_TABLET_STATE.

*Set the capture state of the control. When the control is active, pen data is captured and
*added to the current signature.
*1 Active - Attaches the control to the COM port and starts accepting data.
*0 Inactive - Detaches from the port and stops gathering data. Default state is 0.

    me->set_property( exporting property = 'TabletState' value = state ).
    cl_gui_cfw=>flush(  ).
  endmethod.


  method UNREGISTER_CACHED_W_P.
  endmethod.


  method GET_LCD_CAPTURE_MODE.
        me->get_property( exporting property = 'LCDCaptureMode' importing value = mode ).
    cl_gui_cfw=>flush(  ).

  endmethod.


  method GET_SIG_STRING.
* Gets sig data from the control in Ascii Data (VB script) compatible format. Data is in the form of an Ascii string.
* Remarks: Used to retrieve or place sig data in the control as a property rather than as a method.
* The data format is Memo Field, ASCII, and unicode compatible.

    me->get_property( exporting property = 'SigString' importing value = sig_string ).
    cl_gui_cfw=>flush(  ).
  endmethod.


  METHOD init_sig_plus.
*Used to properly instantiate SigPlus. Must call when SigPlus is instantiated dynamically.
*No need to call when using a design-time instance of SigPlus.


    me->call_method( method = 'InitSigPlus' ).
    refresh_tablet_screen( ).
*    set_text_value( text = 'Instantiated'  ).
    set_text_value(
      EXPORTING
        text   = 'Instantiated'
        dest   = 0
        mode   = 2
        xpos   = 100
        ypos   = 100
        xsize  = 600
        ysize  = 600
        format = 0
    ).

    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


  method LCD_CAPTURE_MODE.

        me->set_property( exporting property = 'LCDCaptureMode' value = mode ).
    cl_gui_cfw=>flush(  ).
  endmethod.


  method LCD_WRITE_BITMAP.


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




  endmethod.


  method SET_FONT.

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



    me->call_method( method = 'LCDSetFont' p1 = 50 p2 = 0 p3 = 100 p4 = 0 p5 = 0 p6 = 0 p7 = 'Arial' p_count = 7 ).
* me->call_method( method = 'LCDSetFont' p1 = 200 p2 = 0 p_count = 2 ).
    cl_gui_cfw=>flush(  ).
  endmethod.


  method SET_LCD_PIXEL_DEPTH.

            me->call_method( method = 'SetLCDPixelDepth' p1 = depth  p_count = 1 ).
       cl_gui_cfw=>flush(  ).
  endmethod.


  method SET_LCD_WINDOW.

    me->call_method( method = 'LCDSetWindow' p1 = 0 p2 = 0 p3 =  1 p4 = 1  p_count = 4 ).
    cl_gui_cfw=>flush(  ).
  endmethod.


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


  method SET_TEXT_VALUE.

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



    set_font(
      EXPORTING
        height         = 50
        width          = 0
        weight         = 100
        italic         = 0
        underline      = 0
        pitchandfamily = 0
        facename       = 'ARIAL'
    ).
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

  endmethod.


  method WRITE_IMG_FILE.

        me->call_method( method = 'WriteImageFile'
                             p1 = ' WriteImageFile is for saving the contents (the signature) of the SigPlus control out to file as an image'
                        p_count = 1 ).
    cl_gui_cfw=>flush(  ).
  endmethod.


  METHOD lcd_write_image.

*    write_img_file( ). This is only needed to save images created on the machine that need to be saved to a location.
    set_tablet_state( state = 1 ).
    lcd_capture_mode( mode = 2 ).
    set_lcd_pixel_depth( depth = 8 ).


        me->call_method( method = 'LCDWriteFile' p1 = 0
                                             p2 = 2
                                             p3 = 0
                                             p4 = 350
                                             p5 = 640   "these need to match the image
                                             p6 = 117   "these need to match the image
                                             p7 = 0
                                             p8 = 'C:\Users\marks\Documents\Projects\Border States\sigBox.bmp'
                                             p_count = 8 ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.


  METHOD REFRESH_TABLET_SCREEN.
*    The tablet is sent a refresh command with 4 possible modes.

    me->call_method( method = 'LCDRefresh' p1 = 0 p2 =  0 p3 =  0 p4 =  640 p5 = 480 p_count = 5 ).
    cl_gui_cfw=>flush(  ).
  ENDMETHOD.
ENDCLASS.