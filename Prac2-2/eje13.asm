%include "asm_io.inc"

section .data
 frase db "Sumar enteros hasta: ",0
 int_format db "%d" , 0

section .bss
;nada

section .text
 global rutina_principal

rutina_principal:
	
	push dword frase
	call _printf		; no la puedo usar

	push dword int_format
	call _scanf		; no la puedo usar
	mov [edx], eax		; edx = eax	

	push dword [edx]	; utilizo como var. local a edx
	call calcSum
	
	call print_int
	add esp, 4	; quita de la pila el valor ingresado
  	ret

calcSum:
	push ebp
	mov ebp, esp
	sub esp, 8		; guarda lugar en la pila para dos valores

	mov dword [ebp - 4], 0	; acumulador
	mov dword [ebp - 8], 1	; variable de control
	mov ecx, [ebp - 8]	; ecx = 1
	mov ebx, 1		; ebx = 1
	add [ebp + 8], ebx	; incremento en 1 el valor de [ebp + 8]
				; para que el ciclo itere correctamente
   start_for:
	
	cmp ecx, [ebp + 8]	; comparo entre ecx y [ebp + 8]
	jz end_for
	mov ebx, ecx		; guardo el valor de ecx en ebx
	call elevarCubo
	add [ebp - 4], ecx	; acum = acum + ecx
	mov ecx, ebx		; restauro el valor de ecx
	inc ecx
	mov [ebp - 8], ecx
	jmp start_for

   end_for:	

	mov eax, [ebp - 4]	; eax = [ebp - 4]

	mov esp, ebp
	pop ebp
        ret

elevarCubo:
	push ebp
	mov ebp, esp

	imul ecx, [ebp + 8]
	imul ecx, [ebp + 8]
	
	pop ebp
	ret
