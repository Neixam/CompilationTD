section .text
global _start
extern swap
extern print_registers
_start:
    mov edi, 25
    mov esi, 12
	call swap
    mov ecx, edi
    mov edx, esi
    call print_registers
    mov rax, 60
    mov rdi, 0
    syscall
