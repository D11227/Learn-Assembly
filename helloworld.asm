global _start				; Cho biết chỗ khởi đầu

section .text:

_start:					; Điểm bắt đầu

	mov eax, 0x4			; Tạo sys_write (eax 4)
	mov ebx, 1			; trình mô tả tệp stdout
	mov ecx, message		; Viết message
	mov edx, message_length		; Độ dài message
	int 0x80			; Gọi kernel

	; Kết thúc chương trình

	mov eax, 0x1			; Tạo sys_exit (eax 1)
	mov ebx, 0			;
	int 0x80			; Gọi kernel

section .data:
	message: db "Hello World!", 0xA ; 0xA là kí tự newline (/n)
	message_length equ $-message	; Độ dài của string
