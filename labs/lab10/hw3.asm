%include 'in_out.asm'
SECTION .data
    filename db 'name.txt', 0h
    prompt db 'Как Вас зовут? ', 0h
    message db 'Меня зовут ', 0h
SECTION .bss
    name resb 255
SECTION .text
    global _start
_start:
    mov eax, prompt
    call sprint
    mov ecx, name
    mov edx, 255
    call sread
    mov ecx, 0o644     
    mov ebx, filename
    mov eax, 8          
    int 0x80
    mov esi, eax       
    mov eax, message    
    call slen          
    mov edx, eax        
    mov ecx, message
    mov ebx, esi        
    mov eax, 4         
    int 0x80
    mov eax, name
    call slen           
    mov edx, eax     
    mov ecx, name       
    mov ebx, esi       
    mov eax, 4        
    int 0x80
    mov ebx, esi        
    mov eax, 6         
    int 0x80
    mov eax, 0h
    call quit
