#include <p16F876a.inc>
#include "SimpMotors.inc"

  __CONFIG ( _BODEN_OFF & _PWRTE_OFF & _CP_OFF & _WDT_OFF & _HS_OSC & _LVP_OFF )
	errorlevel -302		; Ignore warning when using bank1 registers
	org 0x0             ; Program entry point

start

    BSF STATUS,RP0      ; Bank 1
    MOVLW 0x1           ; Set sensor ports for input
    MOVWF TRISB
    BCF STATUS,RP0      ; Bank 0
    SetUpMotors
    GOTO MainLoop

;-------------------------------------------------------------------------------
; This is our main loop reading sensors and staying on the line, for full info
; on the way I set this up refer to the readme.
;-------------------------------------------------------------------------------
MainLoop
   ; BTFSS PORTB,0h     ; Sensor Line 1
   SetLSpeed 120
   GOTO $
   END


