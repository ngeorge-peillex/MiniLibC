[BITS 64]

section .text
GLOBAL strchr

strchr:
	push rbp
	mov rbp, rsp

loop:
	cmp byte [rdi], sil
	je found
	cmp byte [rdi], 0
	je notFound
	inc rdi
	jmp loop

found:
	mov rax, rdi
	jmp leave

notFound:
	mov rax, 0

leave:
	mov rsp, rbp
	pop rbp
	ret