*&---------------------------------------------------------------------*
*&  Include           ZMMC_LOAD_MOVS_E01
*&---------------------------------------------------------------------*

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.
  PERFORM get_filename  USING p_file.

START-OF-SELECTION .

  PERFORM carga_archivo.
*  PERFORM execute_load.
*  PERFORM show_alv.
