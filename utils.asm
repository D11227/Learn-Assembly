strlen:					; Hàm lấy độ dài của chuỗi
        push ebx			; Lưu trữ ebx vào stack
        mov ebx, eax			; Thêm eax vào ebx
        jmp nextchar

nextchar:				; Vòng lặp
        cmp byte [eax], 0		; Kiểm tra xem string kết thúc chưa
        jz finished			; Nếu kết thúc thì chuyển sang finished
        inc eax				; Ngược lại thì tăng eax lên 1
        jmp nextchar			; Chuyển sang nextchar

finished:
        sub eax, ebx
        pop ebx
        ret

input:
	mov edx, 5
	mov ecx, eax

	mov eax, 0x3
	mov ebx, 2
	int 0x80
	ret

print:
        push edx
        push ecx
        push ebx
        push eax
        call strlen

        mov edx, eax
        pop eax

        mov ecx, eax
        mov ebx, 1
        mov eax, 0x4
        int 0x80

        pop ebx
        pop ecx
        pop edx
        ret

exit:
        mov eax, 0x1
        mov ebx, 0
        int 0x80
        ret
