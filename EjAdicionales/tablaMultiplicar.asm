;programa que dada una entrada por teclado (numero entero), devuelve o
;imprime por pantalla la tabla de multiplicar de ese numero ingresado.

%include "asm_io.inc"

section .data

frase	db	"Ingresar un numero del 1 al 10: " , 0

section .bss

n resd 1

section .text
global rutina_principal

rutina_principal:
		mov	eax, 0

		mov	eax, frase	; eax = &frase
		call	print_string	; imprime [eax]

		call	read_int	; lee el entero ingresado por teclado
					; y lo guarda en eax
		mov	[n], eax	; n = eax
		push	dword [n]
		
		call	tablaMultiplicar
		
		sub	esp, 4
		ret

tablaMultiplicar:
		push	ebp
		mov	ebp, esp
		sub	esp, 8

		mov	dword [ebp - 4], 1	; i = 1
		mov	dword [ebp - 8], 0	; acumulador = 0
		
		mov	ecx, 1
		mov	eax, 0			; limpio eax
		mov	ebx, [ebp + 8]
		
	for:
		cmp	ecx, 10
		jz	end_for		; salta a end_for cuando ZF = 1
		imul	ebx, [ebp - 4]		; ebx = ebx * i
		mov	dword [ebp - 8], ebx	; acumulador = ebx * i
		mov	eax, [ebp - 8]		; eax = acumulador
		
		call	print_int
		inc	ecx			; ecx ++
		mov	dword [ebp - 4], ecx	; i = ecx
		jmp	for

	end_for:

		mov	esp, ebp
		pop	ebp
		ret
