print:				; Print
	mov edx, ebx
	mov ecx, eax

	mov eax, 0x4
	mov ebx, 1

	int 0x80
	ret

printNL:			; Print with new line
	call print

	push eax

	mov eax, 0xA

	push eax

	mov eax, esp
	mov ebx, 1

	call print

	pop eax
	pop eax
	ret

exit:				; Exit
	mov eax, 0x1
	mov ebx, 0
	int 0x80
	ret
