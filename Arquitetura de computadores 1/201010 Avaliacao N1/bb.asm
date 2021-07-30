; Alexssander e Felipe Camilo
; Avaliação de N1

section .text     ;   Segmento de código
    global _start   ;   Tornando o main visível ao linker

_start:                   ; Inicio do código
    
    ; Imprime a mensangem que pede para digitar a senha
    mov     edx, inicio_tam1    ; sys_write
    mov     ecx, inicio1        ; string pra imprimir
    call    imprime

    ; Le a senha a partir do teclado
    mov     edx, senha_MAX      ; P/ sys_read, edx=tamanho maximo do buffer
    mov     ecx, senha1         ; P/ sys_read, ecx=endereco do buffer para a leitura
    mov     ebx, 0              ; P/ sys_read, 0=stdin
    mov     eax, 3              ; chamada de sistema, 3=sys_read
    int     80h                 ; kernel
    mov     [senha_tam1], eax
    
    ; Imprime a mensangem que pede para repetir a senha
    mov     edx, inicio_tam2    ; sys_write
    mov     ecx, inicio2        ; string pra imprimir
    call    imprime
    
    ; Le a senha repetida a partir do teclado
    mov     edx, senha_MAX      ; P/ sys_read, edx=tamanho maximo do buffer
    mov     ecx, senha2         ; P/ sys_read, ecx=endereco do buffer para a leitura
    mov     ebx, 0              ; P/ sys_read, 0=stdin
    mov     eax, 3              ; chamada de sistema, 3=sys_read
    int     80h                 ; kernel
    mov     [senha_tam2], eax
     
    mov     esi, 0
    
    ; tamanho
    mov     ax, [senha_tam1]
    cmp     [senha_tam2], ax
    jne     diferente
    
comparacao:
    
    mov     al, [senha1+esi]    ; al recebe o caractere da senha1 na posição esi  
    mov     bl, [senha2+esi]    ; o mesmo
    cmp     al, bl
    jne     diferente           ; se o caractere for diferente
    
    add     al, 1
    mov     [senha1+esi], al
    
    inc     esi                 ; esi++
    cmp     esi, dword [senha_tam1] ; compara o valor de esi com o tamanho da senha
    jna     comparacao          ; entra se for diferente.
    
    mov     edx, msgf_tam1    ; sys_write
    mov     ecx, msgfinal1        ; string pra imprimir
    call    imprime
    
    mov     edx, senha_tam2    ; sys_write
    mov     ecx, senha2        ; string pra imprimir
    call    imprime
    
    mov     edx, msgf_tam2    ; sys_write
    mov     ecx, msgfinal2        ; string pra imprimir
    call    imprime
    
    mov     edx, [senha_tam2]    ; sys_write
    mov     ecx, senha1        ; string pra imprimir
    call    imprime
    jmp fim
    
imprime:
    mov     ebx, 1              ; stdout
    mov     eax, 4              ; sys_write
    int     80h                 ; kernel
    ret
    
diferente:

    mov     eax, 0
    ; Imprime a mensagem de erro
    mov     edx, erro_tam       ; sys_write
    mov     ecx, erro           ; string pra imprimir
    mov     ebx, 1              ; stdout
    mov     eax, 4              ; sys_write
    int     0x80                ; kernel
    
fim:
    ; Finanlizando o programa
    mov     eax, 1          ; sys_exit
    mov     ebx, 0          ; saída
    int     0x80            ; kernel

section .data           ;  Segmento de dados
    inicio1 db "Insira a senha> "
    inicio_tam1 equ $ - inicio1
    inicio2 db "Repita a senha> "
    inicio_tam2 equ $ - inicio2
    erro db "Senha incorreta> "
    erro_tam equ $ - erro
    
    msgfinal1 db "A senha anterior era> "
    msgf_tam1 equ $ - msgfinal1
    msgfinal2 db "A nova senha e> "
    msgf_tam2 equ $ - msgfinal2
    
    senha_tam1 dd 0      ; variavel para guardar o tamanho da senha
    senha_tam2 dd 0
    
    ;senhaAlt resd 1

    senha_MAX equ 8
    

segment .bss

     senha1 resb senha_MAX
     senha2 resb senha_MAX
    
