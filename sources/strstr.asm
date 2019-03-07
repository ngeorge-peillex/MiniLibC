[BITS 64]

section .text
GLOBAL strstr
EXTERN strncmp

strstr:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

check:
	cmp byte [rsi], 0
	je found

lencount:
	cmp byte [rsi + rcx], 0
	je init
	inc rcx
	jmp lencount

init:
	mov rdx, rcx

loop:
	cmp byte [rdi], 0
	je notFound
	CALL strncmp wrt ..plt
	cmp rax, 0
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