
global sofun, sofun2, compare:func

extern msg1, msg2, sen1, sen2, tamanho1


section .text
sofun:

mov edx, eax
mov ecx, msg1 
mov ebx, 1
mov eax, 4

int 0x80
ret

sofun2:

mov edx, eax
mov ecx, msg2 
mov ebx, 1
mov eax, 4

int 0x80
ret

compare:


mov	esi, 0

inic:

mov	al, [sen1+esi]
mov	bl, [sen2+esi]
cmp	al, bl
jnz	diferente
inc	esi
cmp	esi, dword [tamanho1]
jna 	inic
mov	eax, 1
ret

diferente:

mov	eax, 0
ret

