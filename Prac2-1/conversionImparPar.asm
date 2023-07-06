%include "io.inc"

section .data
array db 1,2,3,4,5 ; array de 5 bytes inic en 1,2,3,4,5

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
        mov ecx, 0 ; registro "contador"
        mov eax, 0 ; limpio reg eax
start_loop:
        cmp ecx, 5 ; ecx - 5 = ?
        jz end_loop ; salta si ZF = 1
        mov al, [array + ecx] ; al = array[ecx]
        test al, 1 ; si al es par (ZF = 1)
                   ; si al es impar (ZF = 0)
        jnz turn_par ; se ejecuta si ZF = 0
        inc ecx ; ecx = ecx + 1
        jmp start_loop ; se ejecuta siempre
turn_par:
        add al, 1 ; al = al + 1
        inc ecx
        jmp start_loop
end_loop:
        ret