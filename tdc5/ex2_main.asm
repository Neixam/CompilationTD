section .text
global _start
extern carre
extern print_registers
_start:
    mov edi, 5
	call carre
    mov ecx, eax
    call print_registers
    mov rax, 60
    mov rdi, 0
    syscall
