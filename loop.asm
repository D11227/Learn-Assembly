%include "utils.asm"

section .text
	global _start

_start:
	mov ecx, 0			; Gán 0 cho ecx

nextNumber:
	inc ecx				; Tăng giá trị ecx lên 1

	mov eax, ecx
	add eax, 48			; Cộng 48 vào eax để chuyển số nguyên sang ASCII

	push eax			; Lưu trữ eax vào stack
	mov eax, esp

	call print			; In ra màn hình

	pop eax				; Khôi phục lại eax

	cmp ecx, 10			; So sánh ecx vớ 10
	jne nextNumber			; Nếu chưa = 10 thì tiếp tục gọi hàm nextNumber

	call exit			; Ngược lại gọi hàm exit
