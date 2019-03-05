[BITS 64]

section .text
GLOBAL strcmp

strcmp:
	push rbp
	mov rbp, rsp
	xor rax, rax

loop:
	mov r8b, byte [rdi]
	mov r9b, byte [rsi]
	cmp r8b, 0
	je notEqual
	cmp r8b, r9b
	jne notEqual
	inc rdi
	inc rsi
	jmp loop

notEqual:
	movzx rax, r8b
	movzx r10, r9b
	sub rax, r10

end:
	mov rsp, rbp
	pop rbp
	ret