;construyo una libreria que determina si un numero es par, usando arreglos

%include "asm_io.inc"
section .data
array dw 20,21,22,23,24,25,26,27,28,29

section .text
global rutina_principal

rutina_principal:
	mov eax, 0
	mov ecx, 0
ciclo_for:
	cmp ecx, 10			; ecx - 10 = algo
	jz fin_for
	mov ax, [array + (ecx * 2) ]	; ax = array[ecx]
	test ax, 1			; se fija si el numero es par o no
	jz numero_par			; salta si ZF=1 (numero par):
	inc ecx
	jmp ciclo_for

numero_par:
	call print_int		; imprime el valor de ax
	inc ecx			; ecx += 1
	jmp ciclo_for

fin_for:
	ret
