SECTION .bss              ; Section containing uninitialized data
      BUFFLEN equ 1024    ; Length of buffer
      Buff: resb BUFFLEN  ; Text buffer itself

SECTION .data
      
SECTION .Text

global _start


_start:
        nop

read:   mov eax,3        ; Syscall 3 (sys_read) to EAX
        mov ebx,0        ; Set FD to 0 (stdin) in EBX
        mov ecx,Buff     ; Move address of buffer to ECX
        mov edx,BUFFLEN  ; Move size of buffer to EDX
        int 80h          ; Make sys call
        mov esi,eax      ; Move bytes read to ESI 
        cmp eax,0        ; Compare EAX to 0 (i.e. EOF)
        je Done          ; If 0, jump to done (no more data to process)


        mov ecx,esi      ; Move count of bytes read to ECX 
        mov ebp,Buff     ; Move address of buffer to EBP 
        dec ebp          ; EBP = EBP - 1

Scan:   cmp byte [ebp+ecx],61h  ; Compare the byte at address EBP + offset to 61h
        jb Next                 ; If less, then it's not a lowercase letter so jump to Next 
        cmp byte [ebp+ecx],7ah  ; Compare again, but this time to 7ah 
        ja Next                 ; If greater then it's also not a lower case letter so jump to Next 

        sub byte [ebp+ecx],20h  ; At this stage it must be lowercase letter - subtract 20h to make it uppercase (ASCII codes FTW)

Next:   dec ecx         ; ECX = ECX - 1 
       jnz Scan         ; If ECX != 0, then jump to Scan (i.e. still more data to process in buffer)

Write: mov eax,4         ; Syscall 4 (sys_write) to EAX 
       mov ebx,1         ; Set FD to 1 (stdout) in EBX 
       mov ecx,Buff      ; Set start address of buffer in ECX 
       mov edx,esi       ; Set number of bytes to write (not necessarily same as buffer size) in EDX 
       int 80h           ; Initiate sys call 
       jmp read          ; Jump to read - see if there is more data to process 

Done:  mov eax,1         ; Set syscall to 1 (sys_exist) in EAX 
       mov ebx,0         ; Set return code to pass back to Linux (0) in EBX 
       int 80h           ; Initiate sys_call
