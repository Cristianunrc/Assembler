%include "io.inc"

section .data
var_n dw 1 ; actualizar var_n con el valor que se quiera.

section .text
global CMAIN
CMAIN:
        mov ebp, esp; for correct debugging
        mov ecx, 0 ; limpio reg ecx
        mov cx, [var_n] ; ecx = var_n 
        mov eax, 1
start_for:
        cmp cx, 0 ; caso 0 - 0 = 0
        jz caso_if
        cmp cx, 1 ; caso 1 - 1 = 0
        jz caso_if
        imul ax, cx ; al * cl
        loop start_for ; loop hace cx --;
caso_if:
        imul ax, 1
        jmp fin_ciclo
fin_ciclo:  
        ret