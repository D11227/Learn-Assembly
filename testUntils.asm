%include 'untils.asm'

section .data
	hello db "Hello World!", 0xA
        check db "HAIZFU", 0xA, 0x0

section .text
	global _start

_start:
	mov eax, hello
	call print

	call exit
