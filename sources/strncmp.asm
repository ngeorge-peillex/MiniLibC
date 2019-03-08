[BITS 64]

section .text
GLOBAL strncmp

strncmp:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rcx, rcx

loop:
	cmp rcx, rdx
	je notEqual
	mov r8b, [rdi]
	mov r9b, [rsi]
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
	movzx r9, r9b
	sub rax, r9

end:
	mov rsp, rbp
	pop rbp
	ret