; Description
; Port 0-2: 7 - segments indicator
; Port 3: button1, button2, ADC (Analog-to-digital converter)
; Button1 - x*2, Button2 - send x to output.
; ADC - 6 bit (0 - 63), port p3.[2 - 8]

number equ 10
num0 equ 11
num1 equ 12
area equ 13

org 0
ajmp 30
org 30

; set 7 segment combinations
;	 GFEDCBA  | N
mov 13, 00111111b ; 0
mov 14, 00000111b ; 1
mov 15, 01011011b ; 2
mov 16, 01001111b ; 3
mov 16, 01100110b ; 4
mov 17, 01101101b ; 5
mov 18, 01111101b ; 6
mov 19, 00000111b ; 7
mov 20, 01111111b ; 8
mov 21, 01011111b ; 9

; set test dat
mov P2,#0
setb P2.2
setb P2.3
setb P2.7

; Start main loop
MAIN:
	mov A,P2
	rrc A
	rrc A
	da A

	
jmp main
end