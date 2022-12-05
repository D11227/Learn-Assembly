; nasm -f elf32 dec2bin.asm
; gcc -m32 -o dec2bin dec2bin.asm

extern printf
extern scanf
global main

section .data
        number times 4 dd 0x0
        length times 4 dd 0x0
        msg db "Enter the number: ", 0x0
        rd db "%d", 0x0
section .text
        _print:
                dec DWORD [length]
                pop edx
                mov eax, edx
                push eax
                push rd
                call printf
                add esp, 0x8

                cmp DWORD [length], 0x0
                jne _print
                ret
        _loop:
                inc DWORD [length]
                xor edx, edx
                mov ecx, 0x2
                div ecx
                push edx
                cmp eax, 0x0

                jne _loop
                jmp _print
                ret
        main:
                push msg
                call printf
                pop eax
                push number
                push rd
                call scanf
                add esp, 0x8

                mov eax, DWORD [number]
                jmp _loop
                ret
