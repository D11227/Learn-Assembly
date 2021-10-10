%include "utils.asm"

section .data
	msg: db "The number entered is: "
section .bss
	len equ 5
	number: resb len

section .text
	global _start

_start:
	mov eax, number
	call input

	mov eax, msg
	call print

	mov eax, number
	call print

	call exit
