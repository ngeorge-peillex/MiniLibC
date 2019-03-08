[BITS 64]

section .text
GLOBAL memmove
EXTERN memcpy

memmove:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

checkOverlap:
	cmp rsi, rdi
	jg noOverlap
	jl isOverlap
	jmp end

noOverlap:
	call memcpy wrt ..plt
	mov rsp, rbp
	pop rbp
	ret

isOverlap:
	jmp goToEnd

goToEnd:
	cmp rcx, rdx
	je loop
	inc rcx
	jmp goToEnd

loop:
	mov ah, [rsi + rcx]
 	mov [rdi + rcx], ah
	cmp rcx, 0
	je end
	dec rcx
	jmp loop

end:
	mov rsp, rbp
	pop rbp
	mov rax, rdi
	ret