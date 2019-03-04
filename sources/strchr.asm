[BITS 64]

section .text
GLOBAL strchr

strchr:
	push rbp
	mov rbp, rsp

loop:
	cmp BYTE [rdi], 0
	je notFound
	cmp BYTE [rdi], sil
	je found
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