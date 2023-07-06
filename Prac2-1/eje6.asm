%include "io.inc"

section .data
array dw 2,3,4,10,8,9,1,0,2,3 ; arreglo de 10 words inic en esos valores
var dw 2
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx, 0 ; inic ecx = 0
    mov ebx, 0 ; ebx lleva la suma de los numeros pares
    mov eax, 0 ; limpio el reg eax
ciclo:
    cmp ecx, 10 ; ecx - 10 = n
    jz fin_ciclo ; se ejecuta si ZF esta on
    mov ax, [array + (ecx * 2)]
    test ax, 1 ; ax AND 1 , 1 = impar y 0 = par
    jz par 
    inc ecx
    jmp ciclo
par:
    add bx, ax
    inc ecx
    jmp ciclo
fin_ciclo: