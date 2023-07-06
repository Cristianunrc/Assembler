%include "asm_io.inc"

section .data
array db "H","o","l","a","M","u","n","d","o" , 0

section .text
 global rutina_principal

rutina_principal:
	mov	ecx, 0		; ecx = 0

start_for:
	
	cmp	ecx, 9
	jz 	end_for
	push	dword [array + ecx]	; pusheo los elementos con +1
	inc	ecx			; ecx ++
	jmp	start_for

end_for:
	
	mov	ecx, 0
	mov	eax, 0
	mov	ebx, 40
	call	mostrarCaracteres
	add	esp, 36
	ret


mostrarCaracteres:
	push	ebp
	mov	ebp, esp

    for1:

	cmp	ecx, 9
	jz	end_for1
	mov	eax, [ebp + ebx]
	call	print_char
	sub	ebx, 4
	inc	ecx
	jmp	for1

    end_for1:
		
	pop	ebp
	ret




