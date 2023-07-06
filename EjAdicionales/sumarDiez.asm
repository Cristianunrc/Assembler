section .data

section .bss

section .text
 global sumarDiez

sumarDiez:
	push ebp
	mov ebp, esp
	sub esp, 4	; guardo lugar en la pila para dos variables locales
	push ebx

	mov dword [ebp - 4], 10
	mov ebx, [ebp - 4]
	add ebx, [ebp + 4]
	
	pop ebx
	leave
	ret
 
