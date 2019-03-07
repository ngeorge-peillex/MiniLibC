[BITS 64]

section .text
GLOBAL rindex

rindex:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

goToEnd:
	cmp byte [rdi + rcx], 0
	je findChar
	inc rcx
	jmp goToEnd

findChar:
	cmp rcx, 0
	je notFound
	cmp byte [rdi + rcx], sil
	je found
	dec rcx
	jmp findChar

found:
	add rdi, rcx
	mov rax, rdi
	jmp end

notFound:
	mov rax, 0

end:
	mov rsp, rbp
	pop rbp
	ret