[BITS 64]

section .text
GLOBAL strncmp

strncmp:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

loop:
	cmp rdx, rcx
	je notEqual
	mov r8b, byte [rdi]
	mov r9b, byte [rsi]
	cmp r8b, 0
	je notEqual
	cmp r8b, r9b
	jne notEqual
	inc rdi
	inc rsi
	inc rcx
	jmp loop

notEqual:
	movzx rax, r8b
	movzx r10, r9b
	sub rax, r10

end:
	mov rsp, rbp
	pop rbp
	ret