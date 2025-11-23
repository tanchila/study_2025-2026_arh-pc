%include 'in_out.asm'
section .data
	msg2 db "Наименьшее число: ",0h
	A	dd	26
	B	dd	12
	C	dd	68
section .bss
	min	resb 10
section	.text
	global _start
_start:
; ---------- Записываем 'A' в переменную 'max'
	mov ecx,[A] ; 'ecx = A'
	mov [min],ecx ; 'min = A'
; ---------- Сравниваем 'A' и 'С' (как символы)
	cmp ecx,[C] ; Сравниваем 'A' и 'С'
	jg check_B ; если 'A>C', то переход на метку 'check_B',
	jmp _checkB2
; ---------- Преобразование 'max(A,C)' из символа в число
check_B:
	mov eax,[B]
	call atoi ; Вызов подпрограммы перевода символа в число
	mov [min],eax ; запись преобразованного числа в `max`
; ---------- Сравниваем 'max(A,C)' и 'B' (как числа)
	mov ecx,[C] ; 'C=min'
	cmp ecx,[min] ; Сравниваем 'max(A,C)' и 'B'
	jg fin ; если 'min(A,C)>B', то переход на 'fin',
	mov [min],ecx
; ---------- Вывод результата
_checkB2:
	mov eax,[B]
	mov [min],eax
	cmp ecx,[min] ; Сравниваем 'max(A,C)' и 'B'
	jg fin ; если 'min(A,C)>B', то переход на 'fin',
	mov [min],ecx
fin:
	mov eax,msg2
	call sprint ; Вывод сообщения 'Наименьшее число: '
	mov eax,[min]
	call iprintLF ; Вывод 'min(A,B,C)'
	call quit 
