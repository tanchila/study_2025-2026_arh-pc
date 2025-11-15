%include 'in_out.asm'	
section .data
	msg:	DB 'Выражение для вычисления: 18*(x+1)/6     Введите x: ',0
	div:	DB 'Результат вычисления равен: ',0
section .bss
	x:	RESB 80

section .text
global _start
_start:
    ; Задаем значение переменной x
	mov	eax, msg 
	call	sprintLF
	mov	ecx, x
	mov	edx, 80
	call	sread
	mov	eax, x
	call	atoi
    ; Вычисляем x + 1
	add	eax, 1

    ; Вычисляем 18 * (x + 1)
	mov	ebx, 18
	mul	ebx ; eax = eax * ebx (результат в eax)

    ; Вычисляем 18 * (x + 1) / 6
	mov	ebx, 6
	div	ebx ; eax = eax / ebx (частное в eax)

    ; Сохраняем результат в переменной result
	mov	edi, eax
	mov	eax, div
	call	sprint
	mov	eax, edi
	call	iprintLF
	call	quit
	

