build:
	nasm -f elf32 -o helloworld.o helloworld.asm
	ld -m elf_i386 -o test helloworld.o
	./test
