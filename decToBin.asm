%macro write_string 2

	push eax

	mov eax, 0x4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80

	pop eax

%endmacro

section .data
	newline: db 0xA
	length: db 0x0

section .bss
	num: equ 100            ; Number to print in base 2

section .text
	global _start

_start:
	mov eax, num

	jmp _loop

_loop:
	inc dword [length]

	mov edx, 0
	mov ecx, 0x2
	div ecx

	push edx

	cmp eax, 0
	jne _loop

	jmp _print

_print:
	dec dword [length]

	pop edx

	push eax

        mov eax, edx
        add eax, 48

        push eax

        mov eax, esp

        mov ecx, eax
        mov edx, 1
        mov ebx, 1
        mov eax, 0x4
        int 0x80

        pop eax
        pop eax

	cmp dword [length], 0
	jne _print

	jmp _exit

_exit:
	write_string newline, 1

	mov eax, 0x1
	mov ebx, 0
	int 0x80


