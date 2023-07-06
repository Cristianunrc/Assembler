; ejercicio simple que usa la subrutina print_hex
; desarrollada en el archivo asm_io.asm
%include "asm_io.inc"

section .data
num dd 200

section .text
 global rutina_principal

rutina_principal:
	enter	0,0

	mov eax, [num]
	call print_hex
	
	leave
	ret
