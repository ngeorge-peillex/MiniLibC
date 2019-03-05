[BITS 64]

section .text
GLOBAL rindex

rindex:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

goToEnd:
	cmp rdi, 0
	je findChar
	inc rdi
	inc rcx
	jmp goToEnd

findChar:
	cmp rcx, 0
	je notFound
	cmp byte [rdi], sil
	je found
	dec rdi
	dec rcx
	jmp findChar

found:
	mov rax, rdi

notFound:
	mov rax, 0

end:
	mov rsp, rbp
	pop rbp
	ret