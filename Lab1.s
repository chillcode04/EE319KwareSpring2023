;****************** main.s ***************
; Program initially written by: Yerraballi and Valvano
; Author: Place your name here
; Date Created: 1/15/2018 
; Last Modified: 12/30/2022 
; Brief description of the program: Solution to Lab1
; The objective of this system is to implement a parity system
; Hardware connections: 
;  One output is positive logic, 1 turns on the LED, 0 turns off the LED
;  Three inputs are positive logic, meaning switch not pressed is 0, pressed is 1
GPIO_PORTD_DATA_R  EQU 0x400073FC
GPIO_PORTD_DIR_R   EQU 0x40007400
GPIO_PORTD_DEN_R   EQU 0x4000751C
GPIO_PORTE_DATA_R  EQU 0x400243FC
GPIO_PORTE_DIR_R   EQU 0x40024400
GPIO_PORTE_DEN_R   EQU 0x4002451C
SYSCTL_RCGCGPIO_R  EQU 0x400FE608
       PRESERVE8 
       AREA   Data, ALIGN=2
; Declare global variables here if needed
; with the SPACE assembly directive
       ALIGN 4
       AREA    |.text|, CODE, READONLY, ALIGN=2
       THUMB
       EXPORT EID
EID    DCB "HUY210",0  ;replace ABC123 with your EID
       EXPORT RunGrader
	   ALIGN 4
RunGrader DCD 1 ; change to nonzero when ready for grading
           
      EXPORT  Lab1
; Port E: Key2, Key1, Key0 input switches on PE2,PE1,PE0 	output LED on PE4
Lab1	
   LDR R0,=SYSCTL_RCGCGPIO_R
   LDR R1,[R0]     ;previous
   ORR R1,R1,#0x10 ;bit 4 is clock for E
   STR R1,[R0]     ;turn on clock for E
   NOP ;wait
   NOP ;wait
   
   LDR R0,=GPIO_PORTE_DIR_R
   MOV R1,#0x10 ;PE4 output, PE0,PE1,PE2 input
   STR R1,[R0]
   LDR R0,=GPIO_PORTE_DEN_R
   MOV R1,#0x17 ;enable PE1,PE0,PE2,PE4
   STR R1,[R0]
   LDR  R0,=GPIO_PORTE_DATA_R
loop
	LDR R1,[R0]
	AND R5, R1, #7; select PE0,PE1,PE2
	MOV R2, #0
	MOV R3, #4
R3_LSR
	AND R4, R5, R3
	CMP R4, #0
	ADDNE R2, R2, #1
	LSR R3, R3, #1
	CMP R3, #0
	BEQ State_odd; R3 == 0
	B R3_LSR

State_odd
	AND R2, R2, #1
	CMP R2, #0
	BEQ turn_on
	
	;turn_off
	BIC R1, R1, #0x10  ; Set PE4 low
        STR R1, [R0]    ; Store back to data register
	B   loop
	
turn_on
       ORR R1, R1, #0x10  ; Set PE4 high
       STR R1, [R0]    ; Store back to data register
       B loop          ; Repeat the loop

    
    ALIGN        ; make sure the end of this section is aligned
    END          ; end of file
               
