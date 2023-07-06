%include "asm_io.inc"

section .data
frase db "Ingrese un numero, se mostrara el numero al cuadrado: " ,0

section .bss 
n resd 1

section .text
 global rutina_principal

rutina_principal:
	
	mov eax, frase
	call print_string
	
	call read_int
	mov [n], eax
	push dword [n]
	
	call elevarCuad
	call print_int
	add esp, 4
	
	ret

elevarCuad:
	
	push ebp
	mov ebp, esp
	sub esp, 4	; guardo lugar en la pila para una var. local

	lea eax, [ebp + 8]	; guarda en eax la dir. memoria de n
	mov [ebp - 4], eax	; guarda en ebx el contenido de n
	mov ebx, [eax]
	imul ebx, [eax]		; n * n = n cuadrado
	mov eax, ebx		; eax = ebx
	
	mov esp, ebp	
	pop ebp
		
	ret	



