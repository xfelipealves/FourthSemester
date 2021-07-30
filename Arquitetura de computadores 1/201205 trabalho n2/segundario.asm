global print_str, pula_linha, read_str1,  read_str2

extern linha, n1_max, n1, n2_max, n2

section .text
; ----------------- AREA DOS PROCEDIMENTOS ------------------
print_str:
; Exibe uma string no monitor
; Chamada: EDX = tamanho; ECX = ponteiro
	mov ebx, 1			; Descritor (monitor = 1)
	mov eax, 4			; Servico (print)
	int 0x80			; Executa (exibe)
	ret				; Devolve ao chamador
;--------------------------------------------------------------
	
pula_linha:
; Salta uma linha na tela 
	mov edx, 1			; Tamanho da string
	mov ecx, linha		; Ponteiro da string
	call print_str
	ret

;------------------------------------------------------------

read_str1: 
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

read_str2: 
; Le uma string do teclado
; Chamada: nenhum (universal)
	mov edx, n2_max		; Limita a quantidade aceita
	mov ecx, n2		; Destino da str lida
	mov ebx, 0			; Descritor (teclado = 0)
	mov eax, 3			; Servico (read)
	int 0x80			; Executa a leitura
	ret
; No final EAX recebe o tamanho real do numero mais o <Enter>
;------------------------------------------------------------