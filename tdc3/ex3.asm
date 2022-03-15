section .text
global _start
extern print_registers
_start:
    mov rax, 42
    mov rbx, 42
    call print_registers
    cmp rax, rbx
    jg greater
    je equal
	mov rax, 60
	mov rdi, -1
	syscall

greater:
    mov rax, 60
    mov rdi, 1
    syscall

equal:
    mov rax, 60
    mov rdi, 0
    syscall
