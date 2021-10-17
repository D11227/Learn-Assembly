; Chuyển code c sang assembly (intel syntax)
; Code c
; int main() {
;       int a = 5;
;       int b = 2;
;       printf("%d", a + b);
;       return 0;
; }
;

; Assembly
section .text
        global main                     ; Điểm khởi đầu là main

main:
        push ebp
        mov ebp, esp

        mov DWORD [ebp - 4], 0x5        ; ebp - 4 vì kiểu int có giá trị là 4 bytes.
        mov DWORD [ebp - 8], 0x2        ; Gán 0x2 cho khu vực ebp - 8 trong stack

        mov eax, DWORD [ebp - 4]        ; Gán dữ liệu khu vực ebp - 4 (5) trong stack cho thanh ghi eax
        add eax, DWORD [ebp - 8]        ; Cộng dữ liệu khu vực bp - 8 (2) trong stack cho thanh ghi eax (Giá trị hiện tại là 5)

        add eax, '0'                    ; Chuyển số sang ASCII

        push eax

        mov eax, esp

        mov ecx, eax
        mov edx, 1
        mov ebx, 1
        mov eax, 0x4
        int 0x80

        pop eax

        mov esp, ebp
        pop ebp

        mov eax, 0x1    ; Exit
        mov ebx, 0
        int 0x80
