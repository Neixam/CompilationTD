section .data
table dw 1, 2, 6, 4, 8, 9, 6, 52, 4, 2, 0
section .text
global _start
extern print_registers
_start:
    mov rbp, rsp
    mov rbx, 0
    mov r12, 0
    mov r13, 0
    mov r14, 1

    sub rsp, 32

    mov [rbp], r12; -0 size 
    mov [rbp-8], r12; -8 max
    mov [rbp-16], r12; -16 min
    mov [rbp-24], r12; -24 sum
    
    mov rsi, table
    mov bx, [rsi]
    cmp rbx, 0
    jne loop
    call print_registers
    
    mov rax, 60
    mov rdi, 0
    syscall

loop:
    inc [rbp]
    cmp rbx, [rbp-8]
    jg notmax

notmax:
     
