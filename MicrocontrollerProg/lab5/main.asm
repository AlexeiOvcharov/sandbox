; Description
; Port 0-3: 7 - segments indicator
; Port 3: button1, button2, ADC (Analog-to-digital converter)
; Button1 - x*2, Button2 - send x to output.
; ADC - 6 bit (0 - 63), port p3.[2 - 8]

number equ 10
num0 equ 11
num1 equ 12
area equ 13
x equ 23

org 0
ajmp 30
org 30

; set 7 segment combinations
;	  GFEDCBA  | N
mov 13, #00111111b ; 0
mov 14, #00000111b ; 1
mov 15, #01011011b ; 2
mov 16, #01001111b ; 3
mov 17, #01100110b ; 4
mov 18, #01101101b ; 5
mov 19, #01111101b ; 6
mov 20, #00000111b ; 7
mov 21, #01111111b ; 8
mov 22, #01011111b ; 9

mov R2, #0
mov x, #54

; Start main loop
MAIN:
	; write number to R3
	mov A, #11111100b ; mask for number of bits
	anl A, P3
	rrc A
	rrc A
	mov R3, A

	; check click the button
	mov A, P3
	cpl A
	anl A, R2

	jb ACC.0, MATH
	jb ACC.1, INPUT

	; check data changed
	mov A, P3
	xrl A, R2

	jb ACC.2, VIEW_DATA
	jb ACC.3, VIEW_DATA
	jb ACC.4, VIEW_DATA
	jb ACC.5, VIEW_DATA
	jb ACC.6, VIEW_DATA
	jb ACC.7, VIEW_DATA

	; save current state
	mov R2, P3
jmp MAIN

VIEW_DATA:
	mov A, R3

	mov B, #100
	div AB

	; work with extended num
	mov R0, #area
	add A, R0
	mov R0, A
	mov P2, @R0

	mov A, B
	mov B, #10
	div AB

	; work with hight num
	mov R0, #area
	add A, R0
	mov R0, A
	mov P1, @R0

	; work with low num
	mov R0, #area
	mov A, B
	add A, R0
	mov R0, A
	mov P0, @R0

	mov R2, P3
	jmp MAIN

INPUT:
	mov A, R3
	mov x, A

	jmp MAIN

MATH:
	mov A, x
	mov B, #2
	mul AB

	mov R3, A
	jmp VIEW_DATA
end
