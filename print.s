# as --32 -o print.o print.s
# ld -f elf_i386 -o print print.o

.section .data
        msg:    .asciz "Hello World!\n"
        msg2:   .asciz "Assembly is the best!\n"

.section .text
.globl _start

_printf:
        pushl   %ebp
        movl    %esp, %ebp              # movl [src], [des]

        movl    $4, %eax
        movl    $1, %ebx
        movl    8(%ebp), %ecx           # Argument 1    String
        movl    12(%ebp), %edx          # Argument 2    String length
        int     $0x80

        movl    %ebp, %esp
        popl    %ebp
        ret

_start:
        pushl   %ebp
        movl    %esp, %ebp

        pushl   $14
        pushl   $msg
        call    _printf
        addl    $8, %esp

        pushl   $23
        pushl   $msg2
        call    _printf
        addl    $8, %esp

        movl    %ebp, %esp
        popl    %ebp

        movl    $1, %eax
        xorl    %ebx, %ebx
        int     $0x80
