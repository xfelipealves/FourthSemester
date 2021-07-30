

; ---------------- LISTA DE EQUIVALENCIAS -------------------
LF equ 0x0A		; Salta linha
n1_max equ 20		; Limite para entrada de caracteres


; ----------------- DADOS INICIALIZADOS ---------------------
segment .data

mensini db LF,"Este programa recebe um numero e converte para um valor em registrador"
        db LF, LF
tam_ini equ $-mensini		; Calcula o tamanho da string

pedido1 db LF, "Digite o numero: "
pedido1_tam equ $-pedido1


mens_conv db LF, "examine o conteudo do depurador "
tam_conv equ $-mens_conv

linha db LF		; Pular uma linha

; --------------- DADOS NAO INICIALIZADOS -------------------
segment .bss
n1 resb n1_max		; Recebe as strings (buffer)
				; Eh usado tambem para os algarismos
num1 resd 1		; Recebe o numero 1 formatado

qde1 resd 1		; Quantidade de algarismos dos numeros
				; Utilizada nos dois 

numf resb 7		; Recebe a string da soma (formatada)

qde2 resd 1		; Quantidade de algarismos da soma
vt resd 1			; Variavel de teste

; ----------------------- CODIGOS ---------------------------
segment .text
global main

main:					; Entrada do programa

; Mostra a mensagem inicial
	mov edx, tam_ini		; Carrega o tamanho da str inicial
	mov ecx, mensini		; Aponta para a str inicial
	call print_str		; Procedimento que exibe a str

; Entra com o primeiro numero
pedir1:
	mov edx, pedido1_tam	; Carrega o tamanho da primeira str
	mov ecx, pedido1		; Aponta para a primeira str
	call print_str		; Procedimento que exibe a str

	call read_str		; Le o primeiro numero

	dec eax			
; A entrada nao pode ser vazia, ou seja, conter soh o <Enter>
	jz pedir1			; Se for, pede para ler de novo

; Segundo teste
	cmp eax, 4			; Limite de caracteres
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


; Mensagem da conv

	mov edx, tam_conv
	mov ecx, mens_conv
	call print_str



call pula_linha
call pula_linha

fim:
	mov eax, 1			; Servico exit
	int 0x80			; Encerra o programa


; ----------------- AREA DOS PROCEDIMENTOS ------------------

print_str:
; Exibe uma string no monitor
; Chamada: EDX = tamanho; ECX = ponteiro
	mov ebx, 1			; Descritor (monitor = 1)
	mov eax, 4			; Servico (print)
	int 0x80			; Executa (exibe)
	ret				; Devolve ao chamador
;------------------------------------------------------------

read_str:
; Le uma string do teclado
; Chamada: nenhum (universal)
	mov edx, n1_max		; Limita a quantidade aceita
	mov ecx, n1		; Destino da str lida
	mov ebx, 0			; Descritor (teclado = 0)
	mov eax, 3			; Servico (read)
	int 0x80			; Executa a leitura
	ret
; No final EAX recebe o tamanho real do numero mais o <Enter>
;------------------------------------------------------------

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


;--------------------------------------------------------------
	
pula_linha:
; Salta uma linha na tela 
	mov edx, 1			; Tamanho da string
	mov ecx, linha		; Ponteiro da string
	call print_str
	ret
;------------------------------------------------------------

	
