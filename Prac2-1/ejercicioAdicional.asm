%include "io.inc"

section .data
array db 100, 80, 90

section .text
global CMAIN
CMAIN:
        mov ebp, esp; for correct debugging
        mov eax, 0
        mov ecx, 0
        mov edx, 0
        mov ebx, array ; ebx = &array
for:
        cmp ecx, 3
        jz end_for
        mov al, [ebx + ecx] ; al = *ebx + ecx
        add dl, al ; dl+=al
        inc ecx ; ecx += 1
        jmp for
 end_for:         
        ret