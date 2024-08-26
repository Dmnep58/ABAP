*&---------------------------------------------------------------------*
*& Report ZDPM_subroutine
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdpm_subroutine.


START-OF-SELECTION.

" 1. calling a subroutine of program zdpm_practice into this program.
perform sum(ZDPM_PRACTICE1) using 1 2 if FOUND.


" 2. dynamic calling a subroutine from other program.
perform sum in PROGRAM ZDPM_PRACTICE1 USING 1 2 if FOUND.