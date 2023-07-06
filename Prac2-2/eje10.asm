; programa assembly que calcula el mayor de dos numeros
%include "asm_io.inc"

section .data
x dd 100
y dd 5100

section .text
 global rutina_principal

rutina_principal:
	
	push dword [x]
	push dword [y]
	call mayor_num
	call print_int

	add esp, 8
	ret

mayor_num:
	push ebp
	mov ebp, esp

	mov eax, [ebp + 12]
	cmp eax, [ebp + 8]
	jb mayor_der

	pop ebp
	ret		

       mayor_der:
	mov eax, [ebp + 8]
	pop ebp
	ret
	
	ret
