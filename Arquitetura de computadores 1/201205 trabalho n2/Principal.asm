global _start

extern print_str, pula_linha, read_str1, read_str2

global linha, n1_max, n1, n2_max, n2:data

; ---------------- LISTA DE EQUIVALENCIAS -------------------
LF equ 0x0A		; Salta linha
n1_max equ 20		; Limite para entrada de caracteres
n2_max equ 20
; ----------------- DADOS INICIALIZADOS ---------------------
segment .data
mensini db LF,"Este programa recebe dois numeros, realiza a soma deles e converte para um valor em registrador"
        db LF, LF
tam_ini equ $-mensini		; Calcula o tamanho da string
pedido1 db LF, "Digite o primeiro numero: "
pedido1_tam equ $-pedido1
pedido2 db LF, "Digite o segundo numero: "
pedido2_tam equ $-pedido2
mens_conv db LF, "O valor do reg eh: "
tam_conv equ $-mens_conv
linha db LF		; Pular uma linha
; --------------- DADOS NAO INICIALIZADOS -------------------
segment .bss
n1 resb n1_max		; Recebe as strings (buffer)
n2 resb n2_max  ; Eh usado tambem para os algarismos
				
num1 resd 1		; Recebe o numero 1 formatado
num2 resd 1		; Recebe o numero 1 formatado
qde1 resd 1		; Quantidade de algarismos dos numeros
qde2 resd 1		; Utilizada nos dois 
numf resb 7		; Recebe a string da soma (formatada)
qde3 resd 1		; Quantidade de algarismos da soma
vt resd 1			; Variavel de teste
; ----------------------- CODIGOS ---------------------------
segment .text
_start:					; Entrada do programa
; Mostra a mensagem inicial
	mov edx, tam_ini		; Carrega o tamanho da str inicial
	mov ecx, mensini		; Aponta para a str inicial
	call print_str		; Procedimento que exibe a str
; Entra com o primeiro numero
pedir1:
	mov edx, pedido1_tam	; Carrega o tamanho da primeira str
	mov ecx, pedido1		; Aponta para a primeira str
	call print_str		; Procedimento que exibe a str
	call read_str1		; Le o primeiro numero
	dec eax			
; A entrada nao pode ser vazia, ou seja, conter soh o <Enter>
	jz pedir1			; Se for, pede para ler de novo
; Segundo teste
	cmp eax, 6			; Limite de caracteres
	ja pedir1			; Se for maior, digitar novamente
; Passando desse ponto significa que o numero de caracteres
; eh valido
	mov [qde1], eax		; Salva a quantidade de caracteres
; Validar os caracteres (tem que ser de algarismos)
	mov [vt], dword 0	; Inicializa uma variavel de teste
	call valida		; Procedimento que testa caracteres
	cmp [vt], dword 0	; Se voltar zerada nao houve erro
	jne pedir1			; Caso contrario, digitar novamente
; O procedimento valida chama o formatador 
; O numero formatado retorna em EAX.
	mov [num1], eax		; Salva o primeiro numero
	
pedir2:
	mov edx, pedido2_tam	; Carrega o tamanho da primeira str
	mov ecx, pedido2		; Aponta para a primeira str
	call print_str		; Procedimento que exibe a str
	call read_str2		; Le o primeiro numero
	dec eax			
; A entrada nao pode ser vazia, ou seja, conter soh o <Enter>
	jz pedir2			; Se for, pede para ler de novo
; Segundo teste
	cmp eax, 6			; Limite de caracteres
	ja pedir2			; Se for maior, digitar novamente
; Passando desse ponto significa que o numero de caracteres
; eh valido
	mov [qde2], eax		; Salva a quantidade de caracteres
; Validar os caracteres (tem que ser de algarismos)
	mov [vt], dword 0	; Inicializa uma variavel de teste
	call valida2		; Procedimento que testa caracteres
	cmp [vt], dword 0	; Se voltar zerada nao houve erro
	jne pedir2			; Caso contrario, digitar novamente
; O procedimento valida chama o formatador 
; O numero formatado retorna em EAX.a
	mov [num2], eax		; Salva o primeiro numero
;--------------------------------------------
	add eax, [num1]
	call format_num
; Mensagem da conv
	mov edx, tam_conv
	mov ecx, mens_conv
	call print_str
;mostrar conteudo memoria num1
	
	mov edx, [qde3]
	mov ecx, numf
	call print_str
call pula_linha
call pula_linha
fim:
	mov eax, 1			; Servico exit
	int 0x80			; Encerra o programa
; ----------------- AREA DOS PROCEDIMENTOS ------------------

valida:
; Varre a string supostamente numerica e testa cada caracter
	mov esi, 0			; Inicializa ESI 
					; (indice de varredura)
					; A base eh o ponteiro, n1
val_car1:				; Inicio do loop
	mov al, [n1 + esi]	; Busca o caracter atual
	sub al, 48			; Tenta converter caracter em 
					; algarismo
	cmp al, 9			; Se for algarismo vai de 0 a 9
	ja erro			; Se for acima de 9 nao eh
					; algarismo, acusa o erro para
					; comecar de novo
	mov [n1 + esi], al	; Coloca o algarismo na posicao
					; ESI (antigo caractere)
 					; do mesmo buffer (n1)
 	inc esi			; Aponta para o proximo caratere
	cmp esi, [qde1]		; Verifica se jah terminou a 
					; varredura
	jne val_car1		; Se ainda nao, volta para o inicio 
					; do laco de repeticao
; Ao sair vetor de caracteres virou vetor de algarismos
; Nao teve erro
	call format_num1		; Procedimento chamando 
					; procedimento
; Retorna um numero formatado em EAX
	jmp sai_valida		; Contorna o bloco de atualizacao
					; da vt (porque nao teve erro)
erro:
	mov [vt], dword 1
sai_valida:
	ret
; -----------------------------------------------------------
valida2:
; Varre a string supostamente numerica e testa cada caracter
	mov esi, 0			; Inicializa ESI 
					; (indice de varredura)
					; A base eh o ponteiro, n1
val_car2:				; Inicio do loop
	mov al, [n2 + esi]	; Busca o caracter atual
	sub al, 48			; Tenta converter caracter em 
					; algarismo
	cmp al, 9			; Se for algarismo vai de 0 a 9
	ja erro2			; Se for acima de 9 nao eh
					; algarismo, acusa o erro para
					; comecar de novo
	mov [n2 + esi], al	; Coloca o algarismo na posicao
					; ESI (antigo caractere)
 					; do mesmo buffer (n1)
 	inc esi			; Aponta para o proximo caratere
	cmp esi, [qde2]		; Verifica se jah terminou a 
					; varredura
	jne val_car2		; Se ainda nao, volta para o inicio 
					; do laco de repeticao
; Ao sair vetor de caracteres virou vetor de algarismos
; Nao teve erro
	call format_num2		; Procedimento chamando 
					; procedimento
; Retorna um numero formatado em EAX
	jmp sai_valida2		; Contorna o bloco de atualizacao
					; da vt (porque nao teve erro)
erro2:
	mov [vt], dword 1
sai_valida2:
	ret
; -----------------------------------------------------------
format_num1:
; Formata um numero a partir dos algarismos no buffer n1
; Retorna o numero formatado em EAX
	mov esi, 0			; Inicializa o indice
	mov eax, 0			; Inicializa o acumulador
	mov ebx, 10		; Base decimal, multiplicador
ini_loop1:
 	mul ebx			; EAX * EBX = EDX:EAX. 
					; O resultado fica em EAX (cabe)
	mov edx, 0			; DL vai ser usado para receber o 
					; proximo algarismo
	mov dl, [n1 + esi]	; DL recebe o algarismo atual
	add eax, edx		; O acumulador recebe o valor 
					; anterior mais o algarismo atual
; Algoritimo da formatacao: multiplica por 10 
; e soma com o proximo
	inc esi			; Aponta para o proximo digito
	cmp esi, [qde1]		; Verifica se jah chegou ao 
	je sai_fornum		; final do buffer
	jmp ini_loop1		; Se ainda nao, proximo digito
sai_fornum:
; Numero formatado em EAX
	ret
	
;---------------------------
format_num2:
; Formata um numero a partir dos algarismos no buffer n1
; Retorna o numero formatado em EAX
	mov esi, 0			; Inicializa o indice
	mov eax, 0			; Inicializa o acumulador
	mov ebx, 10		; Base decimal, multiplicador
ini_loop2:
 	mul ebx			; EAX * EBX = EDX:EAX. 
					; O resultado fica em EAX (cabe)
	mov edx, 0			; DL vai ser usado para receber o 
					; proximo algarismo
	mov dl, [n2 + esi]	; DL recebe o algarismo atual
	add eax, edx		; O acumulador recebe o valor 
					; anterior mais o algarismo atual
; Algoritimo da formatacao: multiplica por 10 
; e soma com o proximo
	inc esi			; Aponta para o proximo digito
	cmp esi, [qde2]		; Verifica se jah chegou ao 
	je sai_fornum2		; final do buffer
	jmp ini_loop2		; Se ainda nao, proximo digito
sai_fornum2:
; Numero formatado em EAX
	ret
	
;---------------------------
format_num:
; Constroi uma string com o numero em EAX
; Algoritmo: divide sucessivamento por 10
; Tomam-se os restos na ordem inversa
; Converte-se em caracteres
	mov ebx, 10		; Divisor, base destino
	mov esi, 0			; Inicializa o contador de restos
ida:					; Inicio da formatacao
	mov edx, 0			; Interfere na divisao
	div ebx			; Divide o numero por 10
					; O quociente fica em EAX
					; e resto em EDX
	push rdx			; Armazena na pilha o valor de DL
					; Corresponde a um algarismo
	inc esi			; Aponta para a proxima posicao 
	cmp eax, 0			; Quando o quociente eh 0
	je sai			; Termina a "ida" 
					; (ESI - 1) restos foram empilhados 
; Se ainda nao terminou
	jmp ida			; Retorna ao inicio do laco
sai:
	mov edi, 0			; Indice do buffer da soma
        	
	mov [qde3], esi		; Salva a quantidade
				; Vai ser usada como tamanho da 
					; string ao exibir a soma
volta:
	pop rax			; Recuperando os restos 
					; na ordem inversa
	add al, 48			; Formatando caracter atual
	mov [numf + edi], al	; Colocando no buffer
	inc edi			; Aponta para a proxima posicao
	
	dec esi			; Desconta o ESI
	jnz volta			; Ateh zerar
	ret
;------------------------------------------------------------