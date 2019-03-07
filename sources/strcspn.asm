[BITS 64]

section .text
GLOBAL strcspn

strcspn:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	xor r10, r10
	xor r11, r11

loop:
	cmp byte [rdi], 0
	je end

loop2:
	cmp byte [rsi + r10], 0
	je nextChar
	mov r11b, [rsi + r10]
	cmp byte [rdi], r11b
	je end
	inc r10
	jmp loop2

nextChar:
	inc rcx
	inc rdi
	xor r10, r10
	xor r11, r11
	jmp loop

end:
	mov rsp, rbp
	pop rbp
	mov rax, rcx
	ret