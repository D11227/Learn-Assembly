section.data:						; Data
	; PROMPT MESSAGE
	prompt_message: db "Please input the number: "
	prompt_message_length equ $-prompt_message	; Độ dài message

	; DISPLAY MESSAGE
	display_message: db "The numer is: "
	display_message_length equ $-display_message

section .bss           ;Uninitialized data
        num resb 5

section .text:
        global _start

_start:							; Start program
	; Print prompt message
	mov eax, 4					; Stdout
	mov ebx, 1					;
	mov ecx, prompt_message				; Write message
	mov edx, prompt_message_length			; Message length
	int 0x80					;

	; Read and store the numer
	mov eax, 3					; Read from keyboard
	mov ebx, 2
	mov ecx, num
	mov edx, 5					; 5 bytes
	int 0x80

	; Print message "The number is: "
	mov eax, 4
	mov ebx, 1
	mov ecx, display_message
	mov edx, display_message_length
	int 0x80

        ;Output the number entered
        mov eax, 4
        mov ebx, 1
        mov ecx, num
        mov edx, 5
        int 80h

	; Exit program
	mov eax, 1					; exit program
	mov ebx, 0					;
	int 0x80					;
