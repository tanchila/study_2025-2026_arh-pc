%include 'in_out.asm'

section .data
    msg_x db 'Введите x: ', 0h
    msg_a db 'Введите a: ', 0h
    msg_result db 'Результат: ', 0h
    msg_case1 db ' (a < 8, f(x) = a + 8)', 0h
    msg_case2 db ' (a ≥ 8, f(x) = a*x)', 0h

section .bss
    x resb 10
    a resb 10
    result resb 10

section .text
global _start

_start:
    ; ---------- Ввод значения x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    ; ---------- Ввод значения a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    ; ---------- Проверка условия a < 8
    mov ebx, [a]
    cmp ebx, 8
    jge case2  ; если a ≥ 8, переходим к case2

case1:  ; a < 8, f(x) = a + 8
    add ebx, 8
    mov [result], ebx
    
    mov eax, msg_result
    call sprint
    mov eax, [result]
    call iprintLF
    
    mov eax, msg_case1
    call sprintLF
    jmp end_program

case2:  ; a ≥ 8, f(x) = a * x
    mov eax, [a]
    mov ebx, [x]
    imul eax, ebx  ; eax = a * x
    mov [result], eax
    
    mov eax, msg_result
    call sprint
    mov eax, [result]
    call iprintLF
    
    mov eax, msg_case2
    call sprintLF

end_program:
    call quit
