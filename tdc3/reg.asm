; reg.asm
; registres, chevauchements, appel de fonction
section .text
global _start
extern print_stack
extern print_registers

_start:
	mov rax, 2
	mov rbx, 10
	mov rcx, 0
	mov rdx, 0
	; point 1 rax = 2 rbx = 0xa rcx = 0 rdx = 0
    call print_registers
	add rax, rbx
	; point 2 rax = rax + rbx => rax = 0xc rbx = 0xa rcx = 0 rdx = 0
    call print_registers
	add al, 2
	; point 3 al = al + 2 => rax = 0xe rbx = 0xa rcx = 0 rdx = 0
    call print_registers
	mov eax, 256
	mov cl, ah
	; point 4 eax = 256 cl = ah => rax = 0x100 rbx = 0xa rcx = 0x1 rdx = 0
    call print_registers
	add ah, 1
	; point 5 ah = ah + 1 => rax = 0x200 rbx = 0xa rcx = 0x1 rdx = 0
    call print_registers
	mov rax, 60
	mov rdi, 0
	syscall
