%include	'in_out.asm'
SECTION	.data
result_msg:	DB	'Результат: ',0  
SECTION	.text
GLOBAL	_start
_start:
	mov	ebx,3      
	mov	eax,2      
	add	ebx,eax    
	mov	eax,ebx    
	mov	ecx,4      
	mul	ecx       
	add	eax,5      
	mov	edi,eax   
	
	mov	eax,result_msg
	call	sprint
	mov	eax,edi
	call	iprintLF
	call	quit
