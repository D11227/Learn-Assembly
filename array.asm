; nasm -f elf32 test.asm
; gcc -m32 -o test test.o

extern printf
global main

section .data
        array db 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64, 0xA
        array_length equ $-array
        rd db '%c'
section .text
        main:
                push ebp
                mov ebp, esp

                mov ecx, array_length
                mov esi, array

                loop_start:
                        movzx eax, byte [esi]

                        push ecx

                        push eax
                        push rd
                        call printf
                        add esp, 8

                        pop ecx

                        inc esi
                        loop loop_start

                mov esp, ebp
                pop ebp
                ret
