[BITS 64]

section .text
GLOBAL memmove

memmove:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

loop:
	cmp rcx, rdx
	je backToBegin
	mov ah, [rsi]
 	mov [rdi], ah
	inc rdi
	inc rsi
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