%include "asm_io.inc"

section .data
 array dd 1,2,3,4,5,6,7,8,9,10

section .text
 global rutina_principal

rutina_principal:

	mov 	ecx, 0

ciclo_for:
	
	cmp 	ecx, 10
	jz	end_for
	push	dword [array + (ecx * 4)]
	inc	ecx
	jmp	ciclo_for

end_for:
	push ebp 
	mov ebp, esp

	mov	ebx, 40
	mov	ecx, 0
	mov 	eax, 0

ciclo_for1:

	cmp	ecx, 10
	jz	end_for1
	mov	eax, [ebp + ebx]
	test	eax, 1
	jz	numero_par
	sub	ebx, 4
	inc	ecx
	jmp	ciclo_for1
      numero_par:
	call	print_int
	inc	ecx
	sub	ebx, 4
	jmp	ciclo_for1

end_for1:

	pop	ebp
	add	esp, 40
	ret




