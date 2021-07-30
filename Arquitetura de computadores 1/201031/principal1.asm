
global _start

extern sofun, sofun2, compare

global msg1, msg2, sen1, sen2, tamanho1:data

section .data
msg1 db  "Enter a password:", 10
tam1 equ $-msg1

msg2 db "Repeat password:", 10
tam2 equ $-msg2

msg3 db "Diffetent password: try again", 10
tam3 equ $-msg3

SEN_MAX equ 100

section .bss                           	 ; Inicio da segmento de dados nao inicializados
sen1    resb    SEN_MAX        	; Buffer para receber nome
tamanho1	resd	1
sen2    resb    SEN_MAX
tamanho2    resd   1


section .text
_start:

mov eax, tam1
call sofun  

mov     eax, 3          ; Funcao do sistema (system call); 3 = sys_read
mov     ebx, 0          ; Para sys_read, ebx = handle de leitura; 0 = stdin
mov     ecx, sen1       ; Para sys_read, ecx = endereco do buffer para a leitura
mov     edx, SEN_MAX   ; Para sys_read, edx = tamanho maximo do buffer           
int     0x80            ; Chamar o Linux

mov     [tamanho1], eax ; Guarda o tamanho do que foi efetivamente lido

mov eax, tam2


call sofun2

mov     eax, 3          ; Funcao do sistema (system call); 3 = sys_read
mov     ebx, 0          ; Para sys_read, ebx = handle de leitura; 0 = stdin
mov     ecx, sen2       ; Para sys_read, ecx = endereco do buffer para a leitura
mov     edx, SEN_MAX   ; Para sys_read, edx = tamanho maximo do buffer           
int     0x80            ; Chamar o Linux

mov     [tamanho2], eax ; Guarda o tamanho do que foi efectivamente lido


call	compare

cmp	eax, 0
je	denovo

fim:    
mov rdi, 0
mov rax, 60
syscall


denovo:

mov edx, tam3
mov ecx, msg3 
mov ebx, 1
mov eax, 4

int 0x80

jmp fim

