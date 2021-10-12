%macro write_string 2

	mov eax, 0x4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 0x80

%endmacro

section .data
	even_msg: db "The number is even", 0xA
	even_msg_length: equ $ - even_msg

	odd_msg: db "The number is odd", 0xA
	odd_msg_length: equ $ - odd_msg

section .bss
	number: resb 5

section .text
	global _start

_start:
	mov eax, 0x3
	mov ebx, 2
	mov ecx, number
	mov edx, 5
	int 0x80

	push ax
	mov ax, [number]
	and ax, 1
	pop ax
	jz evenNumber

	write_string odd_msg, odd_msg_length

	jmp exit

evenNumber:
	write_string even_msg, even_msg_length

	jmp exit

exit:
	mov eax, 0x1
	mov ebx, 0
	int 0x80
