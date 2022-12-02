extern printf
extern scanf
global main

section .data
        input db "Enter the name: ", 0x0
        formatOutput db "Your name is: %s", 0x0
        format db "%s", 0x0

section .bss
        name resb 100

section .text
        main:
                pushad
                push DWORD input
                call printf
                pop eax

                push name
                push format
                call scanf
                pop eax
                pop eax

                push name
                push formatOutput
                call printf
                pop eax
                pop eax

                popad
                ret
