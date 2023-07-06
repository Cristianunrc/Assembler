%include "io.inc"

section .data
A db 100,100,100

section .text
global CMAIN
CMAIN:
        mov ebp, esp; for correct debugging
        mov eax, 0
        mov ebx, 0
        mov ecx, 0
start_loop:
        cmp ecx, 3
        jz end_loop         ;salta si ZF=1
        mov al, [A + ecx]
        add bx, ax
        jo hay_over     ;salta si OF=1
        inc ecx
        jmp start_loop
end_loop:
        jno no_hay_over
hay_over: 
        mov eax, 1          ;si 0F=1 entonces eax=1
no_hay_over:
        mov eax, 0
    
        ret