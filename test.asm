%include "utils.asm"

section .data
	hello db "Hello World!", 0xA
        hello2 db "HAIZFU", 0xA

section .text
	global _start

_start:
	mov eax, hello
	call print

	call exit
