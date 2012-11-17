
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
;SimplicityBasic.mbas,42 :: 		while PORTB.RB7 <> 0
L__ReadSensors5:
	BTFSS      PORTB+0, 7
	GOTO       L__ReadSensors6
;SimplicityBasic.mbas,43 :: 		sensor[1] = sensor[1] + 1
	INCF       _sensor+2, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+3, 1
;SimplicityBasic.mbas,44 :: 		if sensor[1] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors87
	MOVLW      30
	SUBWF      _sensor+2, 0
L__ReadSensors87:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors10
	GOTO       L__ReadSensors6
L__ReadSensors10:
;SimplicityBasic.mbas,45 :: 		wend
	GOTO       L__ReadSensors5
L__ReadSensors6:
;SimplicityBasic.mbas,47 :: 		while PORTB.RB6 <> 0
L__ReadSensors13:
	BTFSS      PORTB+0, 6
	GOTO       L__ReadSensors14
;SimplicityBasic.mbas,48 :: 		sensor[2] = sensor[2] + 1
	INCF       _sensor+4, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+5, 1
;SimplicityBasic.mbas,49 :: 		if sensor[2] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+5, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors88
	MOVLW      30
	SUBWF      _sensor+4, 0
L__ReadSensors88:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors18
	GOTO       L__ReadSensors14
L__ReadSensors18:
;SimplicityBasic.mbas,50 :: 		wend
	GOTO       L__ReadSensors13
L__ReadSensors14:
;SimplicityBasic.mbas,52 :: 		while PORTB.RB5 <> 0
L__ReadSensors21:
	BTFSS      PORTB+0, 5
	GOTO       L__ReadSensors22
;SimplicityBasic.mbas,53 :: 		sensor[3] = sensor[3] + 1
	INCF       _sensor+6, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+7, 1
;SimplicityBasic.mbas,54 :: 		if sensor[3] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+7, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors89
	MOVLW      30
	SUBWF      _sensor+6, 0
L__ReadSensors89:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors26
	GOTO       L__ReadSensors22
L__ReadSensors26:
;SimplicityBasic.mbas,55 :: 		wend
	GOTO       L__ReadSensors21
L__ReadSensors22:
;SimplicityBasic.mbas,57 :: 		while PORTB.RB4 <> 0
L__ReadSensors29:
	BTFSS      PORTB+0, 4
	GOTO       L__ReadSensors30
;SimplicityBasic.mbas,58 :: 		sensor[4] = sensor[4] + 1
	INCF       _sensor+8, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+9, 1
;SimplicityBasic.mbas,59 :: 		if sensor[4] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+9, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors90
	MOVLW      30
	SUBWF      _sensor+8, 0
L__ReadSensors90:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors34
	GOTO       L__ReadSensors30
L__ReadSensors34:
;SimplicityBasic.mbas,60 :: 		wend
	GOTO       L__ReadSensors29
L__ReadSensors30:
;SimplicityBasic.mbas,62 :: 		while PORTB.RB3 <> 0
L__ReadSensors37:
	BTFSS      PORTB+0, 3
	GOTO       L__ReadSensors38
;SimplicityBasic.mbas,63 :: 		sensor[5] = sensor[5] + 1
	INCF       _sensor+10, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+11, 1
;SimplicityBasic.mbas,64 :: 		if sensor[5] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+11, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors91
	MOVLW      30
	SUBWF      _sensor+10, 0
L__ReadSensors91:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors42
	GOTO       L__ReadSensors38
L__ReadSensors42:
;SimplicityBasic.mbas,65 :: 		wend
	GOTO       L__ReadSensors37
L__ReadSensors38:
;SimplicityBasic.mbas,67 :: 		while PORTB.RB2 <> 0
L__ReadSensors45:
	BTFSS      PORTB+0, 2
	GOTO       L__ReadSensors46
;SimplicityBasic.mbas,68 :: 		sensor[6] = sensor[6] + 1
	INCF       _sensor+12, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+13, 1
;SimplicityBasic.mbas,69 :: 		if sensor[6] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+13, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors92
	MOVLW      30
	SUBWF      _sensor+12, 0
L__ReadSensors92:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors50
	GOTO       L__ReadSensors46
L__ReadSensors50:
;SimplicityBasic.mbas,70 :: 		wend
	GOTO       L__ReadSensors45
L__ReadSensors46:
;SimplicityBasic.mbas,72 :: 		while PORTB.RB1 <> 0
L__ReadSensors53:
	BTFSS      PORTB+0, 1
	GOTO       L__ReadSensors54
;SimplicityBasic.mbas,73 :: 		sensor[7] = sensor[7] + 1
	INCF       _sensor+14, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+15, 1
;SimplicityBasic.mbas,74 :: 		if sensor[7] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+15, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors93
	MOVLW      30
	SUBWF      _sensor+14, 0
L__ReadSensors93:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors58
	GOTO       L__ReadSensors54
L__ReadSensors58:
;SimplicityBasic.mbas,75 :: 		wend
	GOTO       L__ReadSensors53
L__ReadSensors54:
;SimplicityBasic.mbas,77 :: 		end sub
L_end_ReadSensors:
	RETURN
; end of _ReadSensors

_main:

;SimplicityBasic.mbas,83 :: 		main:
;SimplicityBasic.mbas,84 :: 		ADCON1  = 6
	MOVLW      6
	MOVWF      ADCON1+0
;SimplicityBasic.mbas,85 :: 		PORTA   = 0
	CLRF       PORTA+0
;SimplicityBasic.mbas,86 :: 		TRISA   = 0
	CLRF       TRISA+0
;SimplicityBasic.mbas,87 :: 		PORTC   = 0
	CLRF       PORTC+0
;SimplicityBasic.mbas,88 :: 		TRISC   = 0
	CLRF       TRISC+0
;SimplicityBasic.mbas,89 :: 		PWM1_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;SimplicityBasic.mbas,90 :: 		PWM2_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;SimplicityBasic.mbas,91 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;SimplicityBasic.mbas,92 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;SimplicityBasic.mbas,95 :: 		OPTION_REG.NOT_RBPU = 1
	BSF        OPTION_REG+0, 7
;SimplicityBasic.mbas,98 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;SimplicityBasic.mbas,99 :: 		PORTA.RA1 = 1
	BSF        PORTA+0, 1
;SimplicityBasic.mbas,102 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;SimplicityBasic.mbas,103 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;SimplicityBasic.mbas,106 :: 		StopMotors()
	CALL       _StopMotors+0
;SimplicityBasic.mbas,111 :: 		while 1
L__main62:
;SimplicityBasic.mbas,113 :: 		InitSensors()
	CALL       _InitSensors+0
;SimplicityBasic.mbas,114 :: 		ReadSensors()
	CALL       _ReadSensors+0
;SimplicityBasic.mbas,117 :: 		sensor[2] and
	MOVF       _sensor+4, 0
	ANDWF      _sensor+2, 0
	MOVWF      R0+0
	MOVF       _sensor+3, 0
	ANDWF      _sensor+5, 0
	MOVWF      R0+1
;SimplicityBasic.mbas,118 :: 		sensor[3] and
	MOVF       _sensor+6, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+7, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,119 :: 		sensor[4] and
	MOVF       _sensor+8, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+9, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,120 :: 		sensor[5] and
	MOVF       _sensor+10, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+11, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,121 :: 		sensor[6] > 24 then
	MOVF       _sensor+12, 0
	ANDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	ANDWF      _sensor+13, 0
	MOVWF      R2+1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main95
	MOVF       R2+0, 0
	SUBLW      24
L__main95:
	BTFSC      STATUS+0, 0
	GOTO       L__main67
;SimplicityBasic.mbas,122 :: 		StopMotors()
	CALL       _StopMotors+0
L__main67:
;SimplicityBasic.mbas,126 :: 		sensor[2] and
	MOVF       _sensor+4, 0
	ANDWF      _sensor+2, 0
	MOVWF      R0+0
	MOVF       _sensor+3, 0
	ANDWF      _sensor+5, 0
	MOVWF      R0+1
;SimplicityBasic.mbas,127 :: 		sensor[3] and
	MOVF       _sensor+6, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+7, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,128 :: 		sensor[4] and
	MOVF       _sensor+8, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+9, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,129 :: 		sensor[5] and
	MOVF       _sensor+10, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+11, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,130 :: 		sensor[6] < 22 then
	MOVF       _sensor+12, 0
	ANDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	ANDWF      _sensor+13, 0
	MOVWF      R2+1
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main96
	MOVLW      22
	SUBWF      R2+0, 0
L__main96:
	BTFSC      STATUS+0, 0
	GOTO       L__main70
;SimplicityBasic.mbas,131 :: 		PWM1_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,132 :: 		PWM2_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main70:
;SimplicityBasic.mbas,135 :: 		if sensor[7] < 22 then
	MOVLW      128
	XORWF      _sensor+15, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main97
	MOVLW      22
	SUBWF      _sensor+14, 0
L__main97:
	BTFSC      STATUS+0, 0
	GOTO       L__main73
;SimplicityBasic.mbas,136 :: 		PWM1_Set_Duty(80)
	MOVLW      80
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,137 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main73:
;SimplicityBasic.mbas,140 :: 		if sensor[5] or sensor[6] < 22 then
	MOVF       _sensor+12, 0
	IORWF      _sensor+10, 0
	MOVWF      R1+0
	MOVF       _sensor+11, 0
	IORWF      _sensor+13, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main98
	MOVLW      22
	SUBWF      R1+0, 0
L__main98:
	BTFSC      STATUS+0, 0
	GOTO       L__main76
;SimplicityBasic.mbas,141 :: 		PWM1_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,142 :: 		PWM2_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main76:
;SimplicityBasic.mbas,145 :: 		if sensor[3] or sensor[4] < 22 then
	MOVF       _sensor+8, 0
	IORWF      _sensor+6, 0
	MOVWF      R1+0
	MOVF       _sensor+7, 0
	IORWF      _sensor+9, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main99
	MOVLW      22
	SUBWF      R1+0, 0
L__main99:
	BTFSC      STATUS+0, 0
	GOTO       L__main79
;SimplicityBasic.mbas,146 :: 		PWM1_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,147 :: 		PWM2_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main79:
;SimplicityBasic.mbas,150 :: 		if sensor[1] or sensor[2] < 22 then
	MOVF       _sensor+4, 0
	IORWF      _sensor+2, 0
	MOVWF      R1+0
	MOVF       _sensor+3, 0
	IORWF      _sensor+5, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main100
	MOVLW      22
	SUBWF      R1+0, 0
L__main100:
	BTFSC      STATUS+0, 0
	GOTO       L__main82
;SimplicityBasic.mbas,151 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,152 :: 		PWM2_Set_Duty(80)
	MOVLW      80
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main82:
;SimplicityBasic.mbas,156 :: 		wend
	GOTO       L__main62
L_end_main:
	GOTO       $+0
; end of _main
