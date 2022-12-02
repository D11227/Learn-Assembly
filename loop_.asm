extern printf
extern scanf
global main

section .data
        l times 4 dd 0
        i times 4 dd 0
        msg db "Enter the limit: ", 0x0
        rd db "%d", 0x0
        sh db "Value of i = %d", 0xA, 0x0
section .text
        _show:
                push DWORD [i]
                push sh
                call printf
                add esp, 0x8 ; Pop 2 times
                add DWORD [i], 0x1
                jmp _check
                ret
        _check:
                mov eax, DWORD [l]
                cmp eax, DWORD [i]
                jg _show
                ret
        main:
                push msg
                call printf
                pop eax

                push l
                push rd
                call scanf
                add esp, 0x8    ; Pop 2 times

                jmp _check
                ret
