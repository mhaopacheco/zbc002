*&---------------------------------------------------------------------*
*&  Include           ZMMC_LOAD_MOVS_TOP
*&---------------------------------------------------------------------*
REPORT zmmc_load_movs.


**********************************************************************
* SELECTION-SCREEN
**********************************************************************
  SELECTION-SCREEN BEGIN OF BLOCK a1 WITH FRAME TITLE TEXT-001 .
    PARAMETERS: p_file  LIKE rlgrap-filename  OBLIGATORY  DEFAULT 'C:\data.txt',
                p_test  TYPE etrue  AS CHECKBOX  DEFAULT 'X'.
  SELECTION-SCREEN END OF BLOCK a1.


**********************************************************************
  " Type's ***********************************************************
    TYPES : BEGIN OF ty_file,
              data  TYPE C,
            END OF ty_file.

  " Data's ************************************************************
  DATA: gt_data           TYPE TABLE OF ty_file.
