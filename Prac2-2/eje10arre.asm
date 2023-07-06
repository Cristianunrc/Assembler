%include "asm_io.inc"

section .data
array dd 12, 1 , 2, 4, 6, 7, 10, 10, 0, 11 

section  .text
 global rutina_principal

rutina_principal:
	
	mov ecx, 0	; ecx = 0
start_loop:

	cmp ecx, 10
	jz end_loop
	push dword [array + (ecx * 4)]
	inc ecx
	jmp start_loop

end_loop:
	mov ecx, 0		; reestablezco ecx en 0

	call maximo
	
	add esp, 40
	ret

maximo:
	push ebp 
	mov ebp, esp
 
	mov ebx, 44
	mov eax, [ebp + ebx]	; eax = array[0]

      start_loop2:
	cmp ecx, 9
	jz end_loop2
	sub ebx, 4		; ebx = ebx - 4
	mov edx, [ebp + ebx]	; edx = array[n]
	cmp eax, edx
	jbe mayor_der
	inc ecx
	jmp start_loop2
       
       mayor_der:
	mov eax, edx		; eax = 10
	inc ecx
	jmp start_loop2
	
      end_loop2:	 
	call print_int
	
	pop ebp
        ret
