%include "io.inc"
section .data
arr1 db 0, 2, 4, 6, 8 ; arreglo de 5 bytes
arr2 dw 1, 3, 5, 7, 9 ; arreglo de 5 words
arr3 dd 1, 5, 9, 13, 17 ; arreglo de 5 dwords

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx, 0 ; inicializo ecx=0
    mov eax, 0 ; limpio el registro eax
ciclo_1:
    cmp ecx, 5
    jz fin_ciclo1
    mov al, [arr1 + ecx] ; al = arr1[ecx]
    inc ecx ; ecx++
    jmp ciclo_1
fin_ciclo1:
    
    mov ecx, 0
ciclo_2:
    cmp ecx, 5
    jz fin_ciclo2
    mov ax, [arr2 + (ecx * 2)] ; ax = arr2[ecx]
    inc ecx
    jmp ciclo_2
fin_ciclo2:

    mov ecx, 0
ciclo_3:
    cmp ecx, 5
    jz fin_ciclo3
    mov eax, [arr3 + (ecx * 4)] ; eax = arr3[ecx]
    inc ecx
    jmp ciclo_3
fin_ciclo3:
    ret