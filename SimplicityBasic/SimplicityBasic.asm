
_StopMotors:

;SimplicityBasic.mbas,9 :: 		sub procedure StopMotors
;SimplicityBasic.mbas,10 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,11 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;SimplicityBasic.mbas,12 :: 		end sub
L_end_StopMotors:
	RETURN
; end of _StopMotors

_InitSensors:

;SimplicityBasic.mbas,18 :: 		sub procedure InitSensors
;SimplicityBasic.mbas,19 :: 		TRISB = 0x00
	CLRF       TRISB+0
;SimplicityBasic.mbas,20 :: 		PORTB = 0xFF
	MOVLW      255
	MOVWF      PORTB+0
;SimplicityBasic.mbas,22 :: 		delay_us(10)
	MOVLW      16
	MOVWF      R13+0
L__InitSensors2:
	DECFSZ     R13+0, 1
	GOTO       L__InitSensors2
	NOP
;SimplicityBasic.mbas,24 :: 		TRISB = 0xFF
	MOVLW      255
	MOVWF      TRISB+0
;SimplicityBasic.mbas,27 :: 		sensor[1] = PORTB.RB7
	MOVLW      0
	BTFSC      PORTB+0, 7
	MOVLW      1
	MOVWF      _sensor+2
	CLRF       _sensor+3
;SimplicityBasic.mbas,28 :: 		sensor[2] = PORTB.RB6
	MOVLW      0
	BTFSC      PORTB+0, 6
	MOVLW      1
	MOVWF      _sensor+4
	CLRF       _sensor+5
;SimplicityBasic.mbas,29 :: 		sensor[3] = PORTB.RB5
	MOVLW      0
	BTFSC      PORTB+0, 5
	MOVLW      1
	MOVWF      _sensor+6
	CLRF       _sensor+7
;SimplicityBasic.mbas,30 :: 		sensor[4] = PORTB.RB4
	MOVLW      0
	BTFSC      PORTB+0, 4
	MOVLW      1
	MOVWF      _sensor+8
	CLRF       _sensor+9
;SimplicityBasic.mbas,31 :: 		sensor[5] = PORTB.RB3
	MOVLW      0
	BTFSC      PORTB+0, 3
	MOVLW      1
	MOVWF      _sensor+10
	CLRF       _sensor+11
;SimplicityBasic.mbas,32 :: 		sensor[6] = PORTB.RB2
	MOVLW      0
	BTFSC      PORTB+0, 2
	MOVLW      1
	MOVWF      _sensor+12
	CLRF       _sensor+13
;SimplicityBasic.mbas,33 :: 		sensor[7] = PORTB.RB1
	MOVLW      0
	BTFSC      PORTB+0, 1
	MOVLW      1
	MOVWF      _sensor+14
	CLRF       _sensor+15
;SimplicityBasic.mbas,34 :: 		end sub
L_end_InitSensors:
	RETURN
; end of _InitSensors

_ReadSensors:

;SimplicityBasic.mbas,40 :: 		Dim s_count as Byte
;SimplicityBasic.mbas,42 :: 		for s_count = 0 to 6
	CLRF       R3+0
L__ReadSensors5:
;SimplicityBasic.mbas,43 :: 		if sensor[s_count] <> 0  then
	MOVF       R3+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sensor+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors47
	MOVLW      0
	XORWF      R1+0, 0
L__ReadSensors47:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadSensors10
;SimplicityBasic.mbas,44 :: 		while sensor[s_count] <> 0
L__ReadSensors13:
	MOVF       R3+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sensor+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors48
	MOVLW      0
	XORWF      R1+0, 0
L__ReadSensors48:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadSensors14
;SimplicityBasic.mbas,45 :: 		sensor[s_count] = sensor[s_count] + 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sensor+0
	MOVWF      R2+0
	MOVF       R0+0, 0
	ADDLW      _sensor+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	INCF       FSR, 1
	ADDWF      INDF+0, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;SimplicityBasic.mbas,46 :: 		if sensor[s_count] >= 800 then
	MOVF       R3+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _sensor+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors49
	MOVLW      32
	SUBWF      R1+0, 0
L__ReadSensors49:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors18
;SimplicityBasic.mbas,47 :: 		break
	GOTO       L__ReadSensors14
L__ReadSensors18:
;SimplicityBasic.mbas,49 :: 		wend
	GOTO       L__ReadSensors13
L__ReadSensors14:
L__ReadSensors10:
;SimplicityBasic.mbas,51 :: 		next s_count
	MOVF       R3+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__ReadSensors8
	INCF       R3+0, 1
	GOTO       L__ReadSensors5
L__ReadSensors8:
;SimplicityBasic.mbas,53 :: 		end sub
L_end_ReadSensors:
	RETURN
; end of _ReadSensors

_main:

;SimplicityBasic.mbas,59 :: 		main:
;SimplicityBasic.mbas,60 :: 		ADCON1  = 6
	MOVLW      6
	MOVWF      ADCON1+0
;SimplicityBasic.mbas,61 :: 		PORTA   = 0
	CLRF       PORTA+0
;SimplicityBasic.mbas,62 :: 		TRISA   = 0
	CLRF       TRISA+0
;SimplicityBasic.mbas,63 :: 		PORTC   = 0
	CLRF       PORTC+0
;SimplicityBasic.mbas,64 :: 		TRISC   = 0
	CLRF       TRISC+0
;SimplicityBasic.mbas,65 :: 		PWM1_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;SimplicityBasic.mbas,66 :: 		PWM2_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;SimplicityBasic.mbas,67 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;SimplicityBasic.mbas,68 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;SimplicityBasic.mbas,71 :: 		OPTION_REG.NOT_RBPU = 1
	BSF        OPTION_REG+0, 7
;SimplicityBasic.mbas,74 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;SimplicityBasic.mbas,75 :: 		PORTA.RA1 = 1
	BSF        PORTA+0, 1
;SimplicityBasic.mbas,78 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;SimplicityBasic.mbas,79 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;SimplicityBasic.mbas,82 :: 		StopMotors()
	CALL       _StopMotors+0
;SimplicityBasic.mbas,87 :: 		while 1
L__main22:
;SimplicityBasic.mbas,88 :: 		InitSensors()
	CALL       _InitSensors+0
;SimplicityBasic.mbas,89 :: 		ReadSensors()
	CALL       _ReadSensors+0
;SimplicityBasic.mbas,91 :: 		if sensor[1] < 100 then
	MOVLW      128
	XORWF      _sensor+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      100
	SUBWF      _sensor+2, 0
L__main51:
	BTFSC      STATUS+0, 0
	GOTO       L__main27
;SimplicityBasic.mbas,92 :: 		PWM1_Set_Duty(180)
	MOVLW      180
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,93 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main27:
;SimplicityBasic.mbas,96 :: 		if sensor[2] < 100 then
	MOVLW      128
	XORWF      _sensor+5, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVLW      100
	SUBWF      _sensor+4, 0
L__main52:
	BTFSC      STATUS+0, 0
	GOTO       L__main30
;SimplicityBasic.mbas,97 :: 		PWM1_Set_Duty(190)
	MOVLW      190
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,98 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main30:
;SimplicityBasic.mbas,101 :: 		if sensor[3] < 100 then
	MOVLW      128
	XORWF      _sensor+7, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      100
	SUBWF      _sensor+6, 0
L__main53:
	BTFSC      STATUS+0, 0
	GOTO       L__main33
;SimplicityBasic.mbas,102 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,103 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main33:
;SimplicityBasic.mbas,106 :: 		if sensor[4] < 100 then
	MOVLW      128
	XORWF      _sensor+9, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVLW      100
	SUBWF      _sensor+8, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L__main36
;SimplicityBasic.mbas,107 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,108 :: 		PWM2_Set_Duty(190)
	MOVLW      190
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main36:
;SimplicityBasic.mbas,111 :: 		if sensor[5] < 100 then
	MOVLW      128
	XORWF      _sensor+11, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      100
	SUBWF      _sensor+10, 0
L__main55:
	BTFSC      STATUS+0, 0
	GOTO       L__main39
;SimplicityBasic.mbas,112 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,113 :: 		PWM2_Set_Duty(180)
	MOVLW      180
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main39:
;SimplicityBasic.mbas,116 :: 		if sensor[6] or sensor[7] < 100 then
	MOVF       _sensor+14, 0
	IORWF      _sensor+12, 0
	MOVWF      R1+0
	MOVF       _sensor+13, 0
	IORWF      _sensor+15, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      100
	SUBWF      R1+0, 0
L__main56:
	BTFSC      STATUS+0, 0
	GOTO       L__main42
;SimplicityBasic.mbas,117 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,118 :: 		PWM1_Set_Duty(170)
	MOVLW      170
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
L__main42:
;SimplicityBasic.mbas,121 :: 		wend
	GOTO       L__main22
L_end_main:
	GOTO       $+0
; end of _main
