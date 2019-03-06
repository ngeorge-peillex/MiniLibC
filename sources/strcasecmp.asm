[BITS 64]

section .text
GLOBAL strcasecmp

strcasecmp:
	push rbp
	mov rbp, rsp

initVar:
	mov r9b, [rsi]
	mov r8b, [rdi]

loop:
	cmp r8b, 0
	je notEqual
	cmp r8b, 90
	jle checkFirst
	cmp r9b, 90
	jle checkSecond

compare:
	cmp r8b, r9b
	jne notEqual
	inc rdi
	inc rsi
	jmp initVar

checkFirst:
	cmp r8b, 65
	jge toLowerFirst
	jmp compare

toLowerFirst:
	xor r8b, 32
	jmp loop

checkSecond:
	cmp r9b, 65
	jge toLowerSecond
	jmp compare

toLowerSecond:
	xor r9b, 32
	jmp compare

notEqual:
	movzx rax, r8b
	movzx r9, r9b
	sub rax, r9

end:
	mov rsp, rbp
	pop rbp
	ret