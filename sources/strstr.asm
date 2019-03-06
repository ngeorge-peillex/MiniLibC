[BITS 64]

section .text
GLOBAL strstr
EXTERN strncmp
EXTERN strlen

strstr:
	push rbp
	mov rbp, rsp

init:
	push rdi
	push rsi
	mov rdi, rsi
	CALL strlen wrt ..plt
	mov rdx, rax
	pop rsi
	pop rdi

loop:
	cmp byte [rdi], 0
	je notFound
	CALL strncmp wrt ..plt
	cmp rax, 0
	je found
	inc rdi
	jmp init

found:
	mov rax, rdi
	dec rax
	jmp leave

notFound:
	mov rax, 0

leave:
	mov rsp, rbp
	pop rbp
	ret