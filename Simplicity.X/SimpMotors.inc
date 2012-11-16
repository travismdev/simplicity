;-------------------------------------------------------------------------------
; Motors.inc - Control 2 brushed DC motors with this macro library for the
; PIC16F8XXA range of microcontrollers.
; Written by: Travis Montoya
;
; Pinout is using a L293D, Enable pins are connected as follows:
; M1 = CCP1 = RC2
; M2 = CCP2 = RC1
; Control lines for Motor 1 and Motor 2 are as follows:
; M1 = 1A = RA0
;    = 2A = RA3
; M2 = 3A = RA1
;    = 4A = RA2
;-------------------------------------------------------------------------------


SetUpMotors MACRO
    BCF STATUS,RP0
    BCF STATUS,RP1 ; Bank 0
    CLRF PORTA     ; Clear output latches
    BSF STATUS,RP0 ; Bank 1
    MOVLW 0x06     ; Turn off A2D
    MOVWF ADCON1   ;
    MOVLW 0x0
    MOVWF TRISA
    MOVLW 0x0
    MOVWF TRISC
    BCF STATUS,RP0 ; Bank 0

;-------------------------------------------------------------------------------
; Here we actually set up the PWM now for CCP1 and CCP2
;-------------------------------------------------------------------------------

   MOVF     CCP1CON,W	;set CCP1 as PWM
    	ANDLW    0xF0
    	IORLW    0x0C
    	MOVWF    CCP1CON

    	MOVF     CCP2CON,W	;set CCP2 as PWM
    	ANDLW    0xF0
    	IORLW    0x0C
    	MOVWF    CCP2CON

    	MOVLW    126		;set highest PWM value
    	BANKSEL  PR2		;over this (127) is permanently on
    	MOVWF    PR2
    	BANKSEL  TMR2

    	MOVF     T2CON,W	;set prescaler to 16
    	ANDLW    0xF8		;PWM at 2500HZ
    	IORLW    0x02
    	MOVWF    T2CON

    	MOVF     T2CON,W	;set postscaler to 1
    	ANDLW    0x07
    	IORLW    0x00
    	MOVWF    T2CON

    	CLRF	CCPR1L		;set PWM to zero
    	CLRF	CCPR2L
    BSF T2CON,TMR2ON  ; Enable timer (Start PWM)
    RETURN
    ENDM

SetLSpeed MACRO mLSpeed
    MOVWF mLSpeed

    ; We default forward
    BSF PORTA,0x0
    BCF PORTA,0x3

    BTFSC mLSpeed,7
    CALL SetLReverse

SpinMotor
    ANDLW 0x7F
    MOVWF CCPR1L
    RETURN

SetLReverse
    ; Reverse?
    BCF PORTA,0x3
    BSF PORTA,0x0
    RETURN
    ENDM



