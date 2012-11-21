
_InitMain:

;SimplicityBasic.mbas,10 :: 		sub procedure InitMain
;SimplicityBasic.mbas,14 :: 		ADCON1  = 6
	MOVLW      6
	MOVWF      ADCON1+0
;SimplicityBasic.mbas,15 :: 		PORTA   = 0
	CLRF       PORTA+0
;SimplicityBasic.mbas,16 :: 		TRISA   = 0
	CLRF       TRISA+0
;SimplicityBasic.mbas,17 :: 		PORTC   = 0
	CLRF       PORTC+0
;SimplicityBasic.mbas,18 :: 		TRISC   = 0
	CLRF       TRISC+0
;SimplicityBasic.mbas,19 :: 		TRISC.RC4 = 1
	BSF        TRISC+0, 4
;SimplicityBasic.mbas,20 :: 		PWM1_Init(150000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      32
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;SimplicityBasic.mbas,21 :: 		PWM2_Init(150000)
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      32
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;SimplicityBasic.mbas,22 :: 		PWM1_Start()
	CALL       _PWM1_Start+0
;SimplicityBasic.mbas,23 :: 		PWM2_Start()
	CALL       _PWM2_Start+0
;SimplicityBasic.mbas,26 :: 		OPTION_REG.NOT_RBPU = 1
	BSF        OPTION_REG+0, 7
;SimplicityBasic.mbas,31 :: 		OPTION_REG.T0CS = 0
	BCF        OPTION_REG+0, 5
;SimplicityBasic.mbas,32 :: 		OPTION_REG.T0SE = 0
	BCF        OPTION_REG+0, 4
;SimplicityBasic.mbas,33 :: 		OPTION_REG.PSA = 0
	BCF        OPTION_REG+0, 3
;SimplicityBasic.mbas,34 :: 		OPTION_REG.PS0 = 0
	BCF        OPTION_REG+0, 0
;SimplicityBasic.mbas,35 :: 		OPTION_REG.PS1 = 0
	BCF        OPTION_REG+0, 1
;SimplicityBasic.mbas,36 :: 		OPTION_REG.PS2 = 1
	BSF        OPTION_REG+0, 2
;SimplicityBasic.mbas,41 :: 		PORTA.RA0 = 0
	BCF        PORTA+0, 0
;SimplicityBasic.mbas,42 :: 		PORTA.RA1 = 1
	BSF        PORTA+0, 1
;SimplicityBasic.mbas,43 :: 		PORTA.RA2 = 0
	BCF        PORTA+0, 2
;SimplicityBasic.mbas,44 :: 		PORTA.RA3 = 1
	BSF        PORTA+0, 3
;SimplicityBasic.mbas,47 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,48 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;SimplicityBasic.mbas,51 :: 		Sound_Init(PORTC,3)
	MOVLW      PORTC+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      3
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;SimplicityBasic.mbas,53 :: 		sensor[1] = 0
	CLRF       _sensor+2
	CLRF       _sensor+3
;SimplicityBasic.mbas,54 :: 		sensor[2] = 0
	CLRF       _sensor+4
	CLRF       _sensor+5
;SimplicityBasic.mbas,55 :: 		sensor[3] = 0
	CLRF       _sensor+6
	CLRF       _sensor+7
;SimplicityBasic.mbas,56 :: 		sensor[4] = 0
	CLRF       _sensor+8
	CLRF       _sensor+9
;SimplicityBasic.mbas,57 :: 		sensor[5] = 0
	CLRF       _sensor+10
	CLRF       _sensor+11
;SimplicityBasic.mbas,58 :: 		sensor[6] = 0
	CLRF       _sensor+12
	CLRF       _sensor+13
;SimplicityBasic.mbas,59 :: 		sensor[7] = 0
	CLRF       _sensor+14
	CLRF       _sensor+15
;SimplicityBasic.mbas,61 :: 		end sub
L_end_InitMain:
	RETURN
; end of _InitMain

_StopMotors:

;SimplicityBasic.mbas,66 :: 		sub procedure StopMotors
;SimplicityBasic.mbas,67 :: 		PWM1_Set_Duty(0)
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,68 :: 		PWM2_Set_Duty(0)
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;SimplicityBasic.mbas,69 :: 		end sub
L_end_StopMotors:
	RETURN
; end of _StopMotors

_InitSensors:

;SimplicityBasic.mbas,76 :: 		sub procedure InitSensors
;SimplicityBasic.mbas,77 :: 		sensor[1] = 0
	CLRF       _sensor+2
	CLRF       _sensor+3
;SimplicityBasic.mbas,78 :: 		sensor[2] = 0
	CLRF       _sensor+4
	CLRF       _sensor+5
;SimplicityBasic.mbas,79 :: 		sensor[3] = 0
	CLRF       _sensor+6
	CLRF       _sensor+7
;SimplicityBasic.mbas,80 :: 		sensor[4] = 0
	CLRF       _sensor+8
	CLRF       _sensor+9
;SimplicityBasic.mbas,81 :: 		sensor[5] = 0
	CLRF       _sensor+10
	CLRF       _sensor+11
;SimplicityBasic.mbas,82 :: 		sensor[6] = 0
	CLRF       _sensor+12
	CLRF       _sensor+13
;SimplicityBasic.mbas,83 :: 		sensor[7] = 0
	CLRF       _sensor+14
	CLRF       _sensor+15
;SimplicityBasic.mbas,85 :: 		TRISB = 0x00
	CLRF       TRISB+0
;SimplicityBasic.mbas,86 :: 		PORTB = 0xFF
	MOVLW      255
	MOVWF      PORTB+0
;SimplicityBasic.mbas,88 :: 		delay_us(10)
	MOVLW      16
	MOVWF      R13+0
L__InitSensors3:
	DECFSZ     R13+0, 1
	GOTO       L__InitSensors3
	NOP
;SimplicityBasic.mbas,90 :: 		TRISB = 0xFF
	MOVLW      255
	MOVWF      TRISB+0
;SimplicityBasic.mbas,93 :: 		sensor[1] = PORTB.RB7
	MOVLW      0
	BTFSC      PORTB+0, 7
	MOVLW      1
	MOVWF      _sensor+2
	CLRF       _sensor+3
;SimplicityBasic.mbas,94 :: 		sensor[2] = PORTB.RB6
	MOVLW      0
	BTFSC      PORTB+0, 6
	MOVLW      1
	MOVWF      _sensor+4
	CLRF       _sensor+5
;SimplicityBasic.mbas,95 :: 		sensor[3] = PORTB.RB5
	MOVLW      0
	BTFSC      PORTB+0, 5
	MOVLW      1
	MOVWF      _sensor+6
	CLRF       _sensor+7
;SimplicityBasic.mbas,96 :: 		sensor[4] = PORTB.RB4
	MOVLW      0
	BTFSC      PORTB+0, 4
	MOVLW      1
	MOVWF      _sensor+8
	CLRF       _sensor+9
;SimplicityBasic.mbas,97 :: 		sensor[5] = PORTB.RB3
	MOVLW      0
	BTFSC      PORTB+0, 3
	MOVLW      1
	MOVWF      _sensor+10
	CLRF       _sensor+11
;SimplicityBasic.mbas,98 :: 		sensor[6] = PORTB.RB2
	MOVLW      0
	BTFSC      PORTB+0, 2
	MOVLW      1
	MOVWF      _sensor+12
	CLRF       _sensor+13
;SimplicityBasic.mbas,99 :: 		sensor[7] = PORTB.RB1
	MOVLW      0
	BTFSC      PORTB+0, 1
	MOVLW      1
	MOVWF      _sensor+14
	CLRF       _sensor+15
;SimplicityBasic.mbas,100 :: 		end sub
L_end_InitSensors:
	RETURN
; end of _InitSensors

_ReadSensors:

;SimplicityBasic.mbas,111 :: 		Dim s_count as Byte
;SimplicityBasic.mbas,113 :: 		InitSensors()
	CALL       _InitSensors+0
;SimplicityBasic.mbas,115 :: 		while PORTB.RB7 <> 0
L__ReadSensors6:
	BTFSS      PORTB+0, 7
	GOTO       L__ReadSensors7
;SimplicityBasic.mbas,116 :: 		sensor[1] = sensor[1] + 1
	INCF       _sensor+2, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+3, 1
;SimplicityBasic.mbas,117 :: 		if sensor[1] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+3, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors99
	MOVLW      30
	SUBWF      _sensor+2, 0
L__ReadSensors99:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors11
	GOTO       L__ReadSensors7
L__ReadSensors11:
;SimplicityBasic.mbas,118 :: 		wend
	GOTO       L__ReadSensors6
L__ReadSensors7:
;SimplicityBasic.mbas,120 :: 		while PORTB.RB6 <> 0
L__ReadSensors14:
	BTFSS      PORTB+0, 6
	GOTO       L__ReadSensors15
;SimplicityBasic.mbas,121 :: 		sensor[2] = sensor[2] + 1
	INCF       _sensor+4, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+5, 1
;SimplicityBasic.mbas,122 :: 		if sensor[2] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+5, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors100
	MOVLW      30
	SUBWF      _sensor+4, 0
L__ReadSensors100:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors19
	GOTO       L__ReadSensors15
L__ReadSensors19:
;SimplicityBasic.mbas,123 :: 		wend
	GOTO       L__ReadSensors14
L__ReadSensors15:
;SimplicityBasic.mbas,125 :: 		while PORTB.RB5 <> 0
L__ReadSensors22:
	BTFSS      PORTB+0, 5
	GOTO       L__ReadSensors23
;SimplicityBasic.mbas,126 :: 		sensor[3] = sensor[3] + 1
	INCF       _sensor+6, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+7, 1
;SimplicityBasic.mbas,127 :: 		if sensor[3] >= 25 then break end if
	MOVLW      128
	XORWF      _sensor+7, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors101
	MOVLW      25
	SUBWF      _sensor+6, 0
L__ReadSensors101:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors27
	GOTO       L__ReadSensors23
L__ReadSensors27:
;SimplicityBasic.mbas,128 :: 		wend
	GOTO       L__ReadSensors22
L__ReadSensors23:
;SimplicityBasic.mbas,130 :: 		while PORTB.RB4 <> 0
L__ReadSensors30:
	BTFSS      PORTB+0, 4
	GOTO       L__ReadSensors31
;SimplicityBasic.mbas,131 :: 		sensor[4] = sensor[4] + 1
	INCF       _sensor+8, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+9, 1
;SimplicityBasic.mbas,132 :: 		if sensor[4] >= 25 then break end if
	MOVLW      128
	XORWF      _sensor+9, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors102
	MOVLW      25
	SUBWF      _sensor+8, 0
L__ReadSensors102:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors35
	GOTO       L__ReadSensors31
L__ReadSensors35:
;SimplicityBasic.mbas,133 :: 		wend
	GOTO       L__ReadSensors30
L__ReadSensors31:
;SimplicityBasic.mbas,135 :: 		while PORTB.RB3 <> 0
L__ReadSensors38:
	BTFSS      PORTB+0, 3
	GOTO       L__ReadSensors39
;SimplicityBasic.mbas,136 :: 		sensor[5] = sensor[5] + 1
	INCF       _sensor+10, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+11, 1
;SimplicityBasic.mbas,137 :: 		if sensor[5] >= 25 then break end if
	MOVLW      128
	XORWF      _sensor+11, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors103
	MOVLW      25
	SUBWF      _sensor+10, 0
L__ReadSensors103:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors43
	GOTO       L__ReadSensors39
L__ReadSensors43:
;SimplicityBasic.mbas,138 :: 		wend
	GOTO       L__ReadSensors38
L__ReadSensors39:
;SimplicityBasic.mbas,140 :: 		while PORTB.RB2 <> 0
L__ReadSensors46:
	BTFSS      PORTB+0, 2
	GOTO       L__ReadSensors47
;SimplicityBasic.mbas,141 :: 		sensor[6] = sensor[6] + 1
	INCF       _sensor+12, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+13, 1
;SimplicityBasic.mbas,142 :: 		if sensor[6] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+13, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors104
	MOVLW      30
	SUBWF      _sensor+12, 0
L__ReadSensors104:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors51
	GOTO       L__ReadSensors47
L__ReadSensors51:
;SimplicityBasic.mbas,143 :: 		wend
	GOTO       L__ReadSensors46
L__ReadSensors47:
;SimplicityBasic.mbas,145 :: 		while PORTB.RB1 <> 0
L__ReadSensors54:
	BTFSS      PORTB+0, 1
	GOTO       L__ReadSensors55
;SimplicityBasic.mbas,146 :: 		sensor[7] = sensor[7] + 1
	INCF       _sensor+14, 1
	BTFSC      STATUS+0, 2
	INCF       _sensor+15, 1
;SimplicityBasic.mbas,147 :: 		if sensor[7] >= 30 then break end if
	MOVLW      128
	XORWF      _sensor+15, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ReadSensors105
	MOVLW      30
	SUBWF      _sensor+14, 0
L__ReadSensors105:
	BTFSS      STATUS+0, 0
	GOTO       L__ReadSensors59
	GOTO       L__ReadSensors55
L__ReadSensors59:
;SimplicityBasic.mbas,148 :: 		wend
	GOTO       L__ReadSensors54
L__ReadSensors55:
;SimplicityBasic.mbas,151 :: 		end sub
L_end_ReadSensors:
	RETURN
; end of _ReadSensors

_Countdown:

;SimplicityBasic.mbas,157 :: 		sub procedure Countdown
;SimplicityBasic.mbas,158 :: 		Sound_Play(800,250)
	MOVLW      32
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;SimplicityBasic.mbas,159 :: 		delay_ms(1000)
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L__Countdown62:
	DECFSZ     R13+0, 1
	GOTO       L__Countdown62
	DECFSZ     R12+0, 1
	GOTO       L__Countdown62
	DECFSZ     R11+0, 1
	GOTO       L__Countdown62
	NOP
;SimplicityBasic.mbas,160 :: 		Sound_Play(800,250)
	MOVLW      32
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;SimplicityBasic.mbas,161 :: 		delay_ms(1000)
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L__Countdown63:
	DECFSZ     R13+0, 1
	GOTO       L__Countdown63
	DECFSZ     R12+0, 1
	GOTO       L__Countdown63
	DECFSZ     R11+0, 1
	GOTO       L__Countdown63
	NOP
;SimplicityBasic.mbas,162 :: 		Sound_Play(800,250)
	MOVLW      32
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;SimplicityBasic.mbas,163 :: 		delay_ms(1000)
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L__Countdown64:
	DECFSZ     R13+0, 1
	GOTO       L__Countdown64
	DECFSZ     R12+0, 1
	GOTO       L__Countdown64
	DECFSZ     R11+0, 1
	GOTO       L__Countdown64
	NOP
;SimplicityBasic.mbas,164 :: 		Sound_Play(800,250)
	MOVLW      32
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;SimplicityBasic.mbas,165 :: 		delay_ms(500)
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L__Countdown65:
	DECFSZ     R13+0, 1
	GOTO       L__Countdown65
	DECFSZ     R12+0, 1
	GOTO       L__Countdown65
	DECFSZ     R11+0, 1
	GOTO       L__Countdown65
	NOP
;SimplicityBasic.mbas,166 :: 		Sound_Play(900,500)
	MOVLW      132
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      244
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;SimplicityBasic.mbas,167 :: 		end sub
L_end_Countdown:
	RETURN
; end of _Countdown

_main:

;SimplicityBasic.mbas,173 :: 		main:
;SimplicityBasic.mbas,175 :: 		InitMain()
	CALL       _InitMain+0
;SimplicityBasic.mbas,178 :: 		WaitForPress:
L__main_waitforpress:
;SimplicityBasic.mbas,180 :: 		if PORTC.RC4 = 0 then
	BTFSC      PORTC+0, 4
	GOTO       L__main69
;SimplicityBasic.mbas,181 :: 		GOTO BeginMain
	GOTO       L__main_beginmain
;SimplicityBasic.mbas,182 :: 		else
L__main69:
;SimplicityBasic.mbas,183 :: 		GOTO WaitForPress
	GOTO       L__main_waitforpress
;SimplicityBasic.mbas,189 :: 		BeginMain:
L__main_beginmain:
;SimplicityBasic.mbas,194 :: 		while 1
L__main73:
;SimplicityBasic.mbas,195 :: 		ReadSensors()
	CALL       _ReadSensors+0
;SimplicityBasic.mbas,198 :: 		sensor[2] and
	MOVF       _sensor+4, 0
	ANDWF      _sensor+2, 0
	MOVWF      R0+0
	MOVF       _sensor+3, 0
	ANDWF      _sensor+5, 0
	MOVWF      R0+1
;SimplicityBasic.mbas,199 :: 		sensor[3] and
	MOVF       _sensor+6, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+7, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,200 :: 		sensor[4] and
	MOVF       _sensor+8, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+9, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,201 :: 		sensor[5] and
	MOVF       _sensor+10, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+11, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,202 :: 		sensor[6] > 3 then
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
	GOTO       L__main108
	MOVF       R2+0, 0
	SUBLW      3
L__main108:
	BTFSC      STATUS+0, 0
	GOTO       L__main78
;SimplicityBasic.mbas,203 :: 		StopMotors()
	CALL       _StopMotors+0
L__main78:
;SimplicityBasic.mbas,207 :: 		sensor[2] and
	MOVF       _sensor+4, 0
	ANDWF      _sensor+2, 0
	MOVWF      R0+0
	MOVF       _sensor+3, 0
	ANDWF      _sensor+5, 0
	MOVWF      R0+1
;SimplicityBasic.mbas,208 :: 		sensor[3] and
	MOVF       _sensor+6, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+7, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,209 :: 		sensor[4] and
	MOVF       _sensor+8, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+9, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,210 :: 		sensor[5] and
	MOVF       _sensor+10, 0
	ANDWF      R0+0, 1
	MOVF       _sensor+11, 0
	ANDWF      R0+1, 1
;SimplicityBasic.mbas,211 :: 		sensor[6] <= 2 then
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
	GOTO       L__main109
	MOVF       R2+0, 0
	SUBLW      2
L__main109:
	BTFSS      STATUS+0, 0
	GOTO       L__main81
;SimplicityBasic.mbas,212 :: 		PWM1_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,213 :: 		PWM2_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main81:
;SimplicityBasic.mbas,216 :: 		if sensor[7] <= 2 then
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _sensor+15, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main110
	MOVF       _sensor+14, 0
	SUBLW      2
L__main110:
	BTFSS      STATUS+0, 0
	GOTO       L__main84
;SimplicityBasic.mbas,217 :: 		PWM1_Set_Duty(80)
	MOVLW      80
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,218 :: 		PWM2_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main84:
;SimplicityBasic.mbas,221 :: 		if sensor[5] or sensor[6] <= 2 then
	MOVF       _sensor+12, 0
	IORWF      _sensor+10, 0
	MOVWF      R1+0
	MOVF       _sensor+11, 0
	IORWF      _sensor+13, 0
	MOVWF      R1+1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main111
	MOVF       R1+0, 0
	SUBLW      2
L__main111:
	BTFSS      STATUS+0, 0
	GOTO       L__main87
;SimplicityBasic.mbas,222 :: 		PWM1_Set_Duty(100)
	MOVLW      100
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,223 :: 		PWM2_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main87:
;SimplicityBasic.mbas,226 :: 		if sensor[3] or sensor[4] <= 2 then
	MOVF       _sensor+8, 0
	IORWF      _sensor+6, 0
	MOVWF      R1+0
	MOVF       _sensor+7, 0
	IORWF      _sensor+9, 0
	MOVWF      R1+1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main112
	MOVF       R1+0, 0
	SUBLW      2
L__main112:
	BTFSS      STATUS+0, 0
	GOTO       L__main90
;SimplicityBasic.mbas,227 :: 		PWM1_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,228 :: 		PWM2_Set_Duty(160)
	MOVLW      160
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main90:
;SimplicityBasic.mbas,231 :: 		if sensor[1] or sensor[2] <= 2 then
	MOVF       _sensor+4, 0
	IORWF      _sensor+2, 0
	MOVWF      R1+0
	MOVF       _sensor+3, 0
	IORWF      _sensor+5, 0
	MOVWF      R1+1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main113
	MOVF       R1+0, 0
	SUBLW      2
L__main113:
	BTFSS      STATUS+0, 0
	GOTO       L__main93
;SimplicityBasic.mbas,232 :: 		PWM1_Set_Duty(200)
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;SimplicityBasic.mbas,233 :: 		PWM2_Set_Duty(80)
	MOVLW      80
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
L__main93:
;SimplicityBasic.mbas,237 :: 		wend
	GOTO       L__main73
L_end_main:
	GOTO       $+0
; end of _main
