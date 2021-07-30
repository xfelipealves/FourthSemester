section .data
msg db "Alo, mundo.", LF
tam equ $-msg 
LF equ 10

section .text
	global _start 
_start:	
; Imprimindo a string (operacao de saída)


push 4
push 1
push msg
push tam
	
call imprime

pop rax
pop rax
pop rax
pop rax

	
fim:

mov rbx,0		
mov rax,1		
int 0x80

imprime:

push rbp
mov rbp,rsp
mov rdx, [rbp + 16]
mov rcx, [rbp + 24]
mov rbx, [rbp + 32]
mov rax, [rbp + 40]
int 0x80
pop rbp
ret

