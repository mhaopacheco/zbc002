*&---------------------------------------------------------------------*
*&  Include           ZMMC_LOAD_MOVS_F01
*&---------------------------------------------------------------------*

FORM get_filename  USING pfile.
  DATA: lst_file TYPE file_table OCCURS 0,
        rc       TYPE i,
        txt_g00  TYPE string.

  txt_g00 = TEXT-g00.

  CALL METHOD cl_gui_frontend_services=>file_open_dialog
    EXPORTING
      window_title            = txt_g00
      default_extension       = '.'
    CHANGING
      file_table              = lst_file
      rc                      = rc
    EXCEPTIONS
      file_open_dialog_failed = 1
      cntl_error              = 2
      OTHERS                  = 5.

  CHECK sy-subrc = 0.
  READ TABLE lst_file INDEX 1 INTO p_file .

ENDFORM.

**********************************************************************
FORM carga_archivo.

  DATA name_file                TYPE string.
  name_file = p_file .

  CALL METHOD cl_gui_frontend_services=>gui_upload
    EXPORTING
      filename            = name_file
      filetype            = 'ASC'
      has_field_separator = 'X'
    CHANGING
      data_tab            = gt_data[]
    EXCEPTIONS
      file_open_error     = 1
      file_read_error     = 2
      bad_data_format     = 3
      OTHERS              = 5.

  IF sy-subrc <> 0.
    CASE sy-subrc.
      WHEN : '1'.
        WRITE :/ 'Error al abrir el archivo:', p_file.
      WHEN : '2'.
        WRITE :/ 'Error al leer el archivo:', p_file.
      WHEN : '3'.
        WRITE :/ 'Error de formato en el archivo:', p_file.
      WHEN OTHERS.
        MESSAGE e301(bd) WITH p_file.
    ENDCASE.
  ENDIF.
ENDFORM.
