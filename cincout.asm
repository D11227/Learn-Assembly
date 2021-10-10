%include "utils.asm"

section .data:
	prompt_message db "Please input the number: ", 0xA
	display_message db "The number is: ", 0xA

section .bss           					; Uninitialized data
        num resb 5

section .text
        global _start

_start:							; Start program
	call _PrintPrompt
	call _Input
	call _Output

	call exit                                       ; Function exit from untils.asm

_PrintPrompt:
	; Print prompt message
	mov eax, prompt_message
	call print                                      ; Function print from untils.asm

	ret

_Input:
	; Read and store the number
	mov eax, 3					; Read from keyboard
	mov ebx, 2
	mov ecx, num
	mov edx, 5					; 5 bytes
	int 0x80

	ret

_Output:
	; Print message "The number is: "
	mov eax, display_message
	call print

	mov eax, num
	call print
	ret
