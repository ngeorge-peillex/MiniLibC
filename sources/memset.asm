[BITS 64]

section .text
GLOBAL memset

memset:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

loop:
	cmp rcx, rdx
	je backToBegin
	mov [rdi], sil
	inc rdi
	inc rcx
	jmp loop

backToBegin:
	cmp rcx, 0
	je end
	dec rdi
	dec rcx
	jmp backToBegin

end:
	mov rsp, rbp
	pop rbp
	mov rax, rdi
	ret