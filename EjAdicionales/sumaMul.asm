%include "asm_io.inc"

section .data
;num1 dd 7
;num2 dd 9

section .text
 global rutina_principal

rutina_principal:
	mov eax, 0	   ; registro donde se guarda el resultado
	push dword 3
	push dword 2
	call operacion	   ; salta incondic a la subrutina operacion 
	
	pop ebx
	pop ebx
	ret

operacion:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 12]	; eax = 7
	add eax, [ebp + 8]	; eax = eax + 9
	imul eax, 10		; eax = eax * 10
	call print_int		; imprime el reg eax
	pop ebp			; restauro ebp
	ret
