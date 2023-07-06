%include "asm_io.inc"

section .data
a	db	1, 0, 1, 0, 0, 1, 0, 1
np	db	"No es palindromo" , 0
p	db	"Es palindromo" , 0

section .text
 global rutina_principal

rutina_principal:
		mov	ecx, 0
	
	start_for:
		cmp 	ecx, 8
		jz	end_for
		push	dword [a + ecx]
		inc	ecx
		jmp	start_for
	end_for:

		mov	eax, 0
		mov	ebx, 32		; ebx lo utilizo como direccionamiento
					; indexado en la pila
		mov	ecx, 0		; limpio ecx
		mov	edx, 4		; edx lo utilizo como direcc. indexado
					; en la pila
		call	palindromo

		add	esp, 28		; quita los datos de la
					; pila
		ret

palindromo:
		push	ebp
		mov	ebp, esp
		
	start_for1:
		cmp	ecx, 4		; ciclo hasta la mitad del tamaño
					; del arreglo
		jz	end_for1
		mov	eax, [ebp + edx]	; eax=[ebp + edx]
		cmp	eax, [ebp + ebx]
		jne	no_palindromo
		add	edx, 4
		sub	ebx, 4
		inc	ecx
		jmp	start_for1

	end_for1:
			
		mov	eax, 0		; limpio eax
		mov	eax, p		; eax = &p
		call	print_string	; imprime eax ("Es palindromo")
		
		pop	ebp
		ret

	no_palindromo:
		
		mov	eax, 0		; limpio eax
		mov	eax, np		; eax = &np
		call	print_string	; imprime eax ("No es palindromo")
		
		pop	ebp
		ret	
