[BITS 64]

section .text
GLOBAL strlen

strlen:
	push rbp
	mov rbp, rsp

count:
	cmp BYTE [rdi], 0
	je leave
	inc rdi
	mov rax, rcx
	jmp count

leave:
	mov rsp, rbp
	pop rbp
	ret