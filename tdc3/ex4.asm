section .text
global _start
extern print_registers
_start:
    mov rax, 0
    jmp loop

loop:
    cmp rax, 101
    jg end
        call print_registers
        add rax, 9
        jmp loop

end:
    call print_registers
	mov rax, 60
	mov rdi, 0
	syscall
