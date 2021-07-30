section .data	; diretiva section inicia o programa
msg db LF, "Ola, munndo!", LF,
tam equ $-msg
msg1 db "alo, mundo cruel!", LF, LF
tam1 equ $-msg1
LF equ 10
section .text  	; diretiva que inicia as instruções
 global _start
_start:
mov edx, tam 
mov ecx, msg 
call imprime

mov edx, tam1 
mov ecx, msg1 
call imprime 
jmp fim

imprime:
mov ebx, 1
mov eax, 4
int 0x80
ret

fim:
mov ebx, 0
mov eax, 1
int 0x80

