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
	mov r8b, byte [rdi + rcx]
	mov r9b, byte [rsi + rcx]
	cmp r8b, 0
	je notEqual
	cmp r8b, r9b
	jne notEqual
	inc rcx
	jmp loop

notEqual:
	movsx rax, r8b
	movsx r9, r9b
	sub rax, r9

end:
	mov rsp, rbp
	pop rbp
	ret