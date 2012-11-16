
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
;SimplicityBasic.mbas,25 :: 		end sub
L_end_InitSensors:
	RETURN
; end of _InitSensors

_ReadSensors:

;SimplicityBasic.mbas,30 :: 		sub procedure ReadSensors
;SimplicityBasic.mbas,31 :: 		s1 = 1
	MOVLW      1
	MOVWF      _s1+0
	CLRF       _s1+1
;SimplicityBasic.mbas,32 :: 		s2 = 1
	MOVLW      1
	MOVWF      _s2+0
	CLRF       _s2+1
;SimplicityBasic.mbas,33 :: 		s3 = 1
	MOVLW      1
	MOVWF      _s3+0
	CLRF       _s3+1
;SimplicityBasic.mbas,34 :: 		s4 = 1
	MOVLW      1
	MOVWF      _s4+0
	CLRF       _s4+1
;SimplicityBasic.mbas,35 :: 		s5 = 1
	MOVLW      1
	MOVWF      _s5+0
	CLRF       _s5+1
;SimplicityBasic.mbas,36 :: 		s6 = 1
	MOVLW      1
	MOVWF      _s6+0
	CLRF       _s6+1
;SimplicityBasic.mbas,37 :: 		s7 = 1
	MOVLW      1
	MOVWF      _s7+0
	CLRF       _s7+1
;SimplicityBasic.mbas,42 :: 		while PORTB.RB7 <> 0
L__ReadSensors5:
	BTFSS      PORTB+0, 7
	GOTO       L__ReadSensors6
;SimplicityBasic.mbas,43 :: 		s1 = s1 + 1
	INCF       _s1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s1+1, 1
;SimplicityBasic.mbas,44 :: 		if s1 >= 500 then break end if
	MOVLW      128
	XORWF      _s1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors83
	MOVLW      244
	SUBWF      _s1+0, 0
L__ReadSensors83:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors10
	GOTO       L__ReadSensors6
L__ReadSensors10:
;SimplicityBasic.mbas,45 :: 		wend
	GOTO       L__ReadSensors5
L__ReadSensors6:
;SimplicityBasic.mbas,50 :: 		while PORTB.RB6 <> 0
L__ReadSensors13:
	BTFSS      PORTB+0, 6
	GOTO       L__ReadSensors14
;SimplicityBasic.mbas,51 :: 		s2 = s2 + 1
	INCF       _s2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s2+1, 1
;SimplicityBasic.mbas,52 :: 		if s2 >= 500 then break end if
	MOVLW      128
	XORWF      _s2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors84
	MOVLW      244
	SUBWF      _s2+0, 0
L__ReadSensors84:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors18
	GOTO       L__ReadSensors14
L__ReadSensors18:
;SimplicityBasic.mbas,53 :: 		wend
	GOTO       L__ReadSensors13
L__ReadSensors14:
;SimplicityBasic.mbas,58 :: 		while PORTB.RB5 <> 0
L__ReadSensors21:
	BTFSS      PORTB+0, 5
	GOTO       L__ReadSensors22
;SimplicityBasic.mbas,59 :: 		s3 = s3 + 1
	INCF       _s3+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s3+1, 1
;SimplicityBasic.mbas,60 :: 		if s3 >= 500 then break end if
	MOVLW      128
	XORWF      _s3+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors85
	MOVLW      244
	SUBWF      _s3+0, 0
L__ReadSensors85:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors26
	GOTO       L__ReadSensors22
L__ReadSensors26:
;SimplicityBasic.mbas,61 :: 		wend
	GOTO       L__ReadSensors21
L__ReadSensors22:
;SimplicityBasic.mbas,66 :: 		while PORTB.RB4 <> 0
L__ReadSensors29:
	BTFSS      PORTB+0, 4
	GOTO       L__ReadSensors30
;SimplicityBasic.mbas,67 :: 		s4 = s4 + 1
	INCF       _s4+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s4+1, 1
;SimplicityBasic.mbas,68 :: 		if s4 >= 500 then break end if
	MOVLW      128
	XORWF      _s4+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors86
	MOVLW      244
	SUBWF      _s4+0, 0
L__ReadSensors86:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors34
	GOTO       L__ReadSensors30
L__ReadSensors34:
;SimplicityBasic.mbas,69 :: 		wend
	GOTO       L__ReadSensors29
L__ReadSensors30:
;SimplicityBasic.mbas,74 :: 		while PORTB.RB3 <> 0
L__ReadSensors37:
	BTFSS      PORTB+0, 3
	GOTO       L__ReadSensors38
;SimplicityBasic.mbas,75 :: 		s5 = s5 + 1
	INCF       _s5+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s5+1, 1
;SimplicityBasic.mbas,76 :: 		if s5 >= 500 then break end if
	MOVLW      128
	XORWF      _s5+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors87
	MOVLW      244
	SUBWF      _s5+0, 0
L__ReadSensors87:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors42
	GOTO       L__ReadSensors38
L__ReadSensors42:
;SimplicityBasic.mbas,77 :: 		wend
	GOTO       L__ReadSensors37
L__ReadSensors38:
;SimplicityBasic.mbas,82 :: 		while PORTB.RB2 <> 0
L__ReadSensors45:
	BTFSS      PORTB+0, 2
	GOTO       L__ReadSensors46
;SimplicityBasic.mbas,83 :: 		s6 = s6 + 1
	INCF       _s6+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s6+1, 1
;SimplicityBasic.mbas,84 :: 		if s6 >= 500 then break end if
	MOVLW      128
	XORWF      _s6+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors88
	MOVLW      244
	SUBWF      _s6+0, 0
L__ReadSensors88:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors50
	GOTO       L__ReadSensors46
L__ReadSensors50:
;SimplicityBasic.mbas,85 :: 		wend
	GOTO       L__ReadSensors45
L__ReadSensors46:
;SimplicityBasic.mbas,90 :: 		while PORTB.RB1 <> 0
L__ReadSensors53:
	BTFSS      PORTB+0, 1
	GOTO       L__ReadSensors54
;SimplicityBasic.mbas,91 :: 		s7 = s7 + 1
	INCF       _s7+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s7+1, 1
;SimplicityBasic.mbas,92 :: 		if s7 >= 500 then break end if
	MOVLW      128
	XORWF      _s7+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors89
	MOVLW      244
	SUBWF      _s7+0, 0
L__ReadSensors89:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors58
	GOTO       L__ReadSensors54
L__ReadSensors58:
;SimplicityBasic.mbas,93 :: 		wend
	GOTO       L__ReadSensors53
L__ReadSensors54:
;SimplicityBasic.mbas,94 :: 		end sub
L_end_ReadSensors:
	RETURN
; end of _ReadSensors

_ReadAverage:

;SimplicityBasic.mbas,101 :: 		Dim l_count as Integer
;SimplicityBasic.mbas,102 :: 		l_count = 0
	CLRF       ReadAverage_l_count+0
	CLRF       ReadAverage_l_count+1
;SimplicityBasic.mbas,104 :: 		InitSensors()
	CALL       _InitSensors+0
;SimplicityBasic.mbas,105 :: 		for l_count = 0 to 9
	CLRF       ReadAverage_l_count+0
	CLRF       ReadAverage_l_count+1
L__ReadAverage62:
;SimplicityBasic.mbas,106 :: 		ReadSensors()
	CALL       _ReadSensors+0
;SimplicityBasic.mbas,107 :: 		s_array[1] = s_array[1] + s1
	MOVF       _s1+0, 0
	ADDWF      _s_array+2, 1
	MOVF       _s1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+3, 1
;SimplicityBasic.mbas,108 :: 		s_array[2] = s_array[2] + s2
	MOVF       _s2+0, 0
	ADDWF      _s_array+4, 1
	MOVF       _s2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+5, 1
;SimplicityBasic.mbas,109 :: 		s_array[3] = s_array[3] + s3
	MOVF       _s3+0, 0
	ADDWF      _s_array+6, 1
	MOVF       _s3+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+7, 1
;SimplicityBasic.mbas,110 :: 		s_array[4] = s_array[4] + s4
	MOVF       _s4+0, 0
	ADDWF      _s_array+8, 1
	MOVF       _s4+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+9, 1
;SimplicityBasic.mbas,111 :: 		s_array[5] = s_array[5] + s5
	MOVF       _s5+0, 0
	ADDWF      _s_array+10, 1
	MOVF       _s5+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+11, 1
;SimplicityBasic.mbas,112 :: 		s_array[6] = s_array[6] + s6
	MOVF       _s6+0, 0
	ADDWF      _s_array+12, 1
	MOVF       _s6+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+13, 1
;SimplicityBasic.mbas,113 :: 		s_array[7] = s_array[7] + s7
	MOVF       _s7+0, 0
	ADDWF      _s_array+14, 1
	MOVF       _s7+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+15, 1
;SimplicityBasic.mbas,114 :: 		next l_count
	MOVLW      0
	XORWF      ReadAverage_l_count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadAverage91
	MOVLW      9
	XORWF      ReadAverage_l_count+0, 0
L__ReadAverage91:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadAverage65
	INCF       ReadAverage_l_count+0, 1
	BTFSC      STATUS+0, 2
	INCF       ReadAverage_l_count+1, 1
	GOTO       L__ReadAverage62
L__ReadAverage65:
;SimplicityBasic.mbas,116 :: 		for l_count = 0 to 6
	CLRF       ReadAverage_l_count+0
	CLRF       ReadAverage_l_count+1
L__ReadAverage67:
;SimplicityBasic.mbas,117 :: 		s_array[l_count] = s_array[l_count] / 10
	MOVF       ReadAverage_l_count+0, 0
	MOVWF      R0+0
	MOVF       ReadAverage_l_count+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _s_array+0
	MOVWF      FLOC__ReadAverage+0
	MOVF       R0+0, 0
	ADDLW      _s_array+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_S+0
	MOVF       FLOC__ReadAverage+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;SimplicityBasic.mbas,118 :: 		next l_count
	MOVLW      0
	XORWF      ReadAverage_l_count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadAverage92
	MOVLW      6
	XORWF      ReadAverage_l_count+0, 0
L__ReadAverage92:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadAverage70
	INCF       ReadAverage_l_count+0, 1
	BTFSC      STATUS+0, 2
	INCF       ReadAverage_l_count+1, 1
	GOTO       L__ReadAverage67
L__ReadAverage70:
;SimplicityBasic.mbas,120 :: 		end sub
L_end_ReadAverage:
	RETURN
; end of _ReadAverage

_main:

;SimplicityBasic.mbas,126 :: 		main:
;SimplicityBasic.mbas,127 :: 		ADCON1  = 6
	MOVLW      6
	MOVWF      ADCON1+0
;SimplicityBasic.mbas,128 :: 		PORTA   = 0
	CLRF       PORTA+0
;SimplicityBasic.mbas,129 :: 		TRISA   = 0
	CLRF       TRISA+0
;SimplicityBasic.mbas,130 :: 		PORTC   = 0
	CLRF       PORTC+0
;SimplicityBasic.mbas,131 :: 		TRISC   = 0
	CLRF       TRISC+0
;SimplicityBasic.mbas,132 :: 		PWM1_Init(50000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;SimplicityBasic.mbas,133 :: 		PWM2_Init(50000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;SimplicityBasic.mbas,134 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;SimplicityBasic.mbas,135 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;SimplicityBasic.mbas,138 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;SimplicityBasic.mbas,139 :: 		PORTA.RA1 = 1
	BSF        PORTA+0, 1
;SimplicityBasic.mbas,142 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;SimplicityBasic.mbas,143 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;SimplicityBasic.mbas,146 :: 		StopMotors()
	CALL       _StopMotors+0
;SimplicityBasic.mbas,151 :: 		while 1
L__main73:
;SimplicityBasic.mbas,152 :: 		InitSensors()
	CALL       _InitSensors+0
;SimplicityBasic.mbas,153 :: 		ReadSensors()
	CALL       _ReadSensors+0
;SimplicityBasic.mbas,155 :: 		if s3 and s4 < 200 then
	MOVF       _s4+0, 0
	ANDWF      _s3+0, 0
	MOVWF      R1+0
	MOVF       _s3+1, 0
	ANDWF      _s4+1, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main94
	MOVLW      200
	SUBWF      R1+0, 0
L__main94:
	BTFSC      STATUS+0, 0
	GOTO       L__main78
;SimplicityBasic.mbas,157 :: 		PWM1_Set_Duty(255)
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
L__main78:
;SimplicityBasic.mbas,163 :: 		wend
	GOTO       L__main73
L_end_main:
	GOTO       $+0
; end of _main
