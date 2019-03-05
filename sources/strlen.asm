[BITS 64]

section .text
GLOBAL strlen

strlen:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

count:
	cmp byte [rdi], 0
	je leave
	inc rdi
	inc rcx
	jmp count

leave:
	mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret