strlen:
        push ebx
        mov ebx, eax

nextchar:
        cmp byte [eax], 0
        jz finished
        inc eax
        jmp nextchar

finished:
        sub eax, ebx
        pop ebx
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
