; Адрес регистра переменной X
VALXL EQU 10h
VALXH EQU 11h
; Адрес регистра переменной Z
VALZL EQU 35h
VALZH EQU 36h

org 0
ajmp 30h
org 30h

mov VALXL,#16
mov VALXH,#4

mov VALZL,#100

; Умножаем младший байт на 6
mov A,VALXL
mov B,#6
mul AB

; Cохраняем результат с учетом переполнения
addc A,VALZL
mov VALZL,A
mov A,#0
addc A,#0
add A,B
mov VALZH,A

; Умножаем старший байт на 100
mov A,VALXH
mov B,#6
mul AB

add A,VALZH
mov VALZH,A

; Инвертируем полученное значение
mov A,#0
subb A,VALZL
mov VALZL,A

mov A,#0
subb A,VALZH
mov VALZH,A

END