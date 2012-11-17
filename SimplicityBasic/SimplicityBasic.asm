
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
;SimplicityBasic.mbas,42 :: 		if PORTB.RB7 <> 0  then
	BTFSS      PORTB+0, 7
	GOTO       L__ReadSensors5
;SimplicityBasic.mbas,43 :: 		while PORTB.RB7 <> 0
L__ReadSensors8:
	BTFSS      PORTB+0, 7
	GOTO       L__ReadSensors9
;SimplicityBasic.mbas,44 :: 		s1 = s1 + 1
	INCF       _s1+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s1+1, 1
;SimplicityBasic.mbas,45 :: 		if s1 >= 800 then break end if
	MOVLW      128
	XORWF      _s1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors119
	MOVLW      32
	SUBWF      _s1+0, 0
L__ReadSensors119:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors13
	GOTO       L__ReadSensors9
L__ReadSensors13:
;SimplicityBasic.mbas,46 :: 		wend
	GOTO       L__ReadSensors8
L__ReadSensors9:
L__ReadSensors5:
;SimplicityBasic.mbas,52 :: 		if PORTB.RB6 <> 0  then
	BTFSS      PORTB+0, 6
	GOTO       L__ReadSensors16
;SimplicityBasic.mbas,53 :: 		while PORTB.RB6 <> 0
L__ReadSensors19:
	BTFSS      PORTB+0, 6
	GOTO       L__ReadSensors20
;SimplicityBasic.mbas,54 :: 		s2 = s2 + 1
	INCF       _s2+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s2+1, 1
;SimplicityBasic.mbas,55 :: 		if s2 >= 800 then break end if
	MOVLW      128
	XORWF      _s2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors120
	MOVLW      32
	SUBWF      _s2+0, 0
L__ReadSensors120:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors24
	GOTO       L__ReadSensors20
L__ReadSensors24:
;SimplicityBasic.mbas,56 :: 		wend
	GOTO       L__ReadSensors19
L__ReadSensors20:
L__ReadSensors16:
;SimplicityBasic.mbas,62 :: 		if PORTB.RB5 <> 0 then
	BTFSS      PORTB+0, 5
	GOTO       L__ReadSensors27
;SimplicityBasic.mbas,63 :: 		while PORTB.RB5 <> 0
L__ReadSensors30:
	BTFSS      PORTB+0, 5
	GOTO       L__ReadSensors31
;SimplicityBasic.mbas,64 :: 		s3 = s3 + 1
	INCF       _s3+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s3+1, 1
;SimplicityBasic.mbas,65 :: 		if s3 >= 1000 then break end if
	MOVLW      128
	XORWF      _s3+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors121
	MOVLW      232
	SUBWF      _s3+0, 0
L__ReadSensors121:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors35
	GOTO       L__ReadSensors31
L__ReadSensors35:
;SimplicityBasic.mbas,66 :: 		wend
	GOTO       L__ReadSensors30
L__ReadSensors31:
L__ReadSensors27:
;SimplicityBasic.mbas,72 :: 		if PORTB.RB4 <> 0 then
	BTFSS      PORTB+0, 4
	GOTO       L__ReadSensors38
;SimplicityBasic.mbas,73 :: 		while PORTB.RB4 <> 0
L__ReadSensors41:
	BTFSS      PORTB+0, 4
	GOTO       L__ReadSensors42
;SimplicityBasic.mbas,74 :: 		s4 = s4 + 1
	INCF       _s4+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s4+1, 1
;SimplicityBasic.mbas,75 :: 		if s4 >= 1000 then break end if
	MOVLW      128
	XORWF      _s4+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors122
	MOVLW      232
	SUBWF      _s4+0, 0
L__ReadSensors122:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors46
	GOTO       L__ReadSensors42
L__ReadSensors46:
;SimplicityBasic.mbas,76 :: 		wend
	GOTO       L__ReadSensors41
L__ReadSensors42:
L__ReadSensors38:
;SimplicityBasic.mbas,82 :: 		if PORTB.RB3 <> 0 then
	BTFSS      PORTB+0, 3
	GOTO       L__ReadSensors49
;SimplicityBasic.mbas,83 :: 		while PORTB.RB3 <> 0
L__ReadSensors52:
	BTFSS      PORTB+0, 3
	GOTO       L__ReadSensors53
;SimplicityBasic.mbas,84 :: 		s5 = s5 + 1
	INCF       _s5+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s5+1, 1
;SimplicityBasic.mbas,85 :: 		if s5 >= 1000 then break end if
	MOVLW      128
	XORWF      _s5+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors123
	MOVLW      232
	SUBWF      _s5+0, 0
L__ReadSensors123:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors57
	GOTO       L__ReadSensors53
L__ReadSensors57:
;SimplicityBasic.mbas,86 :: 		wend
	GOTO       L__ReadSensors52
L__ReadSensors53:
L__ReadSensors49:
;SimplicityBasic.mbas,93 :: 		if PORTB.RB2 <> 0 then
	BTFSS      PORTB+0, 2
	GOTO       L__ReadSensors60
;SimplicityBasic.mbas,94 :: 		while PORTB.RB2 <> 0
L__ReadSensors63:
	BTFSS      PORTB+0, 2
	GOTO       L__ReadSensors64
;SimplicityBasic.mbas,95 :: 		s6 = s6 + 1
	INCF       _s6+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s6+1, 1
;SimplicityBasic.mbas,96 :: 		if s6 >= 1000 then break end if
	MOVLW      128
	XORWF      _s6+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors124
	MOVLW      232
	SUBWF      _s6+0, 0
L__ReadSensors124:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors68
	GOTO       L__ReadSensors64
L__ReadSensors68:
;SimplicityBasic.mbas,97 :: 		wend
	GOTO       L__ReadSensors63
L__ReadSensors64:
L__ReadSensors60:
;SimplicityBasic.mbas,103 :: 		if PORTB.RB1 <> 0 then
	BTFSS      PORTB+0, 1
	GOTO       L__ReadSensors71
;SimplicityBasic.mbas,104 :: 		while PORTB.RB1 <> 0
L__ReadSensors74:
	BTFSS      PORTB+0, 1
	GOTO       L__ReadSensors75
;SimplicityBasic.mbas,105 :: 		s7 = s7 + 1
	INCF       _s7+0, 1
	BTFSC      STATUS+0, 2
	INCF       _s7+1, 1
;SimplicityBasic.mbas,106 :: 		if s7 >= 1000 then break end if
	MOVLW      128
	XORWF      _s7+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors125
	MOVLW      232
	SUBWF      _s7+0, 0
L__ReadSensors125:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors79
	GOTO       L__ReadSensors75
L__ReadSensors79:
;SimplicityBasic.mbas,107 :: 		wend
	GOTO       L__ReadSensors74
L__ReadSensors75:
L__ReadSensors71:
;SimplicityBasic.mbas,109 :: 		end sub
L_end_ReadSensors:
	RETURN
; end of _ReadSensors

_ReadAverage:

;SimplicityBasic.mbas,116 :: 		Dim l_count as Integer
;SimplicityBasic.mbas,117 :: 		l_count = 0
	CLRF       ReadAverage_l_count+0
	CLRF       ReadAverage_l_count+1
;SimplicityBasic.mbas,119 :: 		InitSensors()
	CALL       _InitSensors+0
;SimplicityBasic.mbas,120 :: 		for l_count = 0 to 9
	CLRF       ReadAverage_l_count+0
	CLRF       ReadAverage_l_count+1
L__ReadAverage83:
;SimplicityBasic.mbas,121 :: 		ReadSensors()
	CALL       _ReadSensors+0
;SimplicityBasic.mbas,122 :: 		s_array[1] = s_array[1] + s1
	MOVF       _s1+0, 0
	ADDWF      _s_array+2, 1
	MOVF       _s1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+3, 1
;SimplicityBasic.mbas,123 :: 		s_array[2] = s_array[2] + s2
	MOVF       _s2+0, 0
	ADDWF      _s_array+4, 1
	MOVF       _s2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+5, 1
;SimplicityBasic.mbas,124 :: 		s_array[3] = s_array[3] + s3
	MOVF       _s3+0, 0
	ADDWF      _s_array+6, 1
	MOVF       _s3+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+7, 1
;SimplicityBasic.mbas,125 :: 		s_array[4] = s_array[4] + s4
	MOVF       _s4+0, 0
	ADDWF      _s_array+8, 1
	MOVF       _s4+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+9, 1
;SimplicityBasic.mbas,126 :: 		s_array[5] = s_array[5] + s5
	MOVF       _s5+0, 0
	ADDWF      _s_array+10, 1
	MOVF       _s5+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+11, 1
;SimplicityBasic.mbas,127 :: 		s_array[6] = s_array[6] + s6
	MOVF       _s6+0, 0
	ADDWF      _s_array+12, 1
	MOVF       _s6+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+13, 1
;SimplicityBasic.mbas,128 :: 		s_array[7] = s_array[7] + s7
	MOVF       _s7+0, 0
	ADDWF      _s_array+14, 1
	MOVF       _s7+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _s_array+15, 1
;SimplicityBasic.mbas,129 :: 		next l_count
	MOVLW      0
	XORWF      ReadAverage_l_count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadAverage127
	MOVLW      9
	XORWF      ReadAverage_l_count+0, 0
L__ReadAverage127:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadAverage86
	INCF       ReadAverage_l_count+0, 1
	BTFSC      STATUS+0, 2
	INCF       ReadAverage_l_count+1, 1
	GOTO       L__ReadAverage83
L__ReadAverage86:
;SimplicityBasic.mbas,131 :: 		for l_count = 0 to 6
	CLRF       ReadAverage_l_count+0
	CLRF       ReadAverage_l_count+1
L__ReadAverage88:
;SimplicityBasic.mbas,132 :: 		s_array[l_count] = s_array[l_count] / 10
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
;SimplicityBasic.mbas,133 :: 		next l_count
	MOVLW      0
	XORWF      ReadAverage_l_count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadAverage128
	MOVLW      6
	XORWF      ReadAverage_l_count+0, 0
L__ReadAverage128:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadAverage91
	INCF       ReadAverage_l_count+0, 1
	BTFSC      STATUS+0, 2
	INCF       ReadAverage_l_count+1, 1
	GOTO       L__ReadAverage88
L__ReadAverage91:
;SimplicityBasic.mbas,135 :: 		end sub
L_end_ReadAverage:
	RETURN
; end of _ReadAverage

_main:

;SimplicityBasic.mbas,141 :: 		main:
;SimplicityBasic.mbas,142 :: 		ADCON1  = 6
	MOVLW      6
	MOVWF      ADCON1+0
;SimplicityBasic.mbas,143 :: 		PORTA   = 0
	CLRF       PORTA+0
;SimplicityBasic.mbas,144 :: 		TRISA   = 0
	CLRF       TRISA+0
;SimplicityBasic.mbas,145 :: 		PORTC   = 0
	CLRF       PORTC+0
;SimplicityBasic.mbas,146 :: 		TRISC   = 0
	CLRF       TRISC+0
;SimplicityBasic.mbas,147 :: 		PWM1_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;SimplicityBasic.mbas,148 :: 		PWM2_Init(5000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;SimplicityBasic.mbas,149 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;SimplicityBasic.mbas,150 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;SimplicityBasic.mbas,153 :: 		OPTION_REG.NOT_RBPU = 1
	BSF        OPTION_REG+0, 7
;SimplicityBasic.mbas,156 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;SimplicityBasic.mbas,157 :: 		PORTA.RA1 = 1
	BSF        PORTA+0, 1
;SimplicityBasic.mbas,160 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;SimplicityBasic.mbas,161 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;SimplicityBasic.mbas,164 :: 		StopMotors()
	CALL       _StopMotors+0
;SimplicityBasic.mbas,169 :: 		while 1
L__main94:
;SimplicityBasic.mbas,170 :: 		InitSensors()
	CALL       _InitSensors+0
;SimplicityBasic.mbas,171 :: 		ReadSensors()
	CALL       _ReadSensors+0
;SimplicityBasic.mbas,173 :: 		if s1 < 100 then
	MOVLW      128
	XORWF      _s1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main130
	MOVLW      100
	SUBWF      _s1+0, 0
L__main130:
	BTFSC      STATUS+0, 0
	GOTO       L__main99
;SimplicityBasic.mbas,174 :: 		PWM1_Set_Duty(180)
	MOVLW      180
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,175 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main99:
;SimplicityBasic.mbas,178 :: 		if s2 < 100 then
	MOVLW      128
	XORWF      _s2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main131
	MOVLW      100
	SUBWF      _s2+0, 0
L__main131:
	BTFSC      STATUS+0, 0
	GOTO       L__main102
;SimplicityBasic.mbas,179 :: 		PWM1_Set_Duty(190)
	MOVLW      190
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,180 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main102:
;SimplicityBasic.mbas,183 :: 		if s3 < 100 then
	MOVLW      128
	XORWF      _s3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main132
	MOVLW      100
	SUBWF      _s3+0, 0
L__main132:
	BTFSC      STATUS+0, 0
	GOTO       L__main105
;SimplicityBasic.mbas,184 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,185 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main105:
;SimplicityBasic.mbas,188 :: 		if s4 < 100 then
	MOVLW      128
	XORWF      _s4+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main133
	MOVLW      100
	SUBWF      _s4+0, 0
L__main133:
	BTFSC      STATUS+0, 0
	GOTO       L__main108
;SimplicityBasic.mbas,189 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,190 :: 		PWM2_Set_Duty(190)
	MOVLW      190
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main108:
;SimplicityBasic.mbas,193 :: 		if s5 < 100 then
	MOVLW      128
	XORWF      _s5+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main134
	MOVLW      100
	SUBWF      _s5+0, 0
L__main134:
	BTFSC      STATUS+0, 0
	GOTO       L__main111
;SimplicityBasic.mbas,194 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,195 :: 		PWM2_Set_Duty(180)
	MOVLW      180
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main111:
;SimplicityBasic.mbas,198 :: 		if s6 or s7 < 100 then
	MOVF       _s7+0, 0
	IORWF      _s6+0, 0
	MOVWF      R1+0
	MOVF       _s6+1, 0
	IORWF      _s7+1, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main135
	MOVLW      100
	SUBWF      R1+0, 0
L__main135:
	BTFSC      STATUS+0, 0
	GOTO       L__main114
;SimplicityBasic.mbas,199 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,200 :: 		PWM1_Set_Duty(170)
	MOVLW      170
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
L__main114:
;SimplicityBasic.mbas,203 :: 		wend
	GOTO       L__main94
L_end_main:
	GOTO       $+0
; end of _main
