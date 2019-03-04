[BITS 64]

section .text
GLOBAL strlen

strlen:
	xor rax, rax

count:
	cmp BYTE [rdi], 0
	je end
	inc rdi
	mov rcx, rax
	jmp count

end:
	ret