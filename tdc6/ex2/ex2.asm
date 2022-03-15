section .text
global mult2
mult2:
	mov rax, rdi
	imul rax, 2
    ret
