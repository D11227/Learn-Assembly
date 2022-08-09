section .data
        str: DB "We are Vietnamese"
        strlen: DB 0x0
        str_length equ $-str

section .text
        global _start

_start:
        mov [strlen], DWORD str_length
        sub [strlen], DWORD 0x1

        mov ecx, str

        jmp _loop

_loop:
        dec DWORD [strlen]
        add ecx, DWORD [strlen]

        mov eax, 0x4
        mov ebx, 0x1
        mov edx, 0x1
        int 0x80

        sub ecx, DWORD [strlen]
        cmp DWORD [strlen], 0x0
        je _exit

        jmp _loop

_exit:
        mov eax, 0x1
        mov ebx, [strlen]
        int 0x80
