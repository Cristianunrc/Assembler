%include "io.inc"

section .data
Data dw 10 ; Data es una variable definida con un
            ; espacio de memoria de 1 word inic.
            ; en 10

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 0 ; limpio eax
    mov ax, [Data] ; direccionamiento directo
    ;direccionamiento indirecto
    mov ebx, Data ; ebx = &Data
    mov ax, [ebx] ; ax = *ebx
    
    ret