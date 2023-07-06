%include "asm_io.inc"

section .data
array db "H","o","l","a","M","u","n","d","o" , 0

section .text
 global rutina_principal

rutina_principal:
	mov	ecx, 0		; ecx = 0
	mov	eax, 0		; eax = 0

   start_for:
	
	cmp	ecx, 9
	jz 	end_for
	push	dword [array + ecx]
	inc	ecx			; ecx ++
	jmp	start_for

   end_for:

	mov	eax, 0		; eax = 0
	mov	edx, 8		; edx = 8
	call 	ordenInverso
	
	add	esp, 36
	ret

ordenInverso:

	push	ebp
	mov	ebp, esp
	sub	esp, 4		; reservo lugar en la pila para una variable 					; local
	
	mov	ebx, 1
	mov	dword [ebp - 4], 0	; i = 0
	mov	ecx, [ebp - 4]		; ecx = i
	
   start_for1:
	
	cmp	ecx, 9
	jz	end_for1
	mov	eax, [esp + edx]
	call	print_char
	add	[ebp - 4], ebx		; i++
	inc	ecx
	add	edx, 4
	jmp	start_for1

   end_for1:

	mov	esp, ebp
	pop	ebp
	ret
