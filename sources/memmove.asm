[BITS 64]

section .text
GLOBAL memmove
EXTERN memcpy

memmove:
	push rbp
	mov rbp, rsp
	xor rcx, rcx

checkOverlap:
	cmp rdi, rsi
	jge isOverlap
	jl noOverlap

noOverlap:
	call memcpy wrt ..plt
	jmp end

isOverlap:
	dec rdx
	jmp loop

loop:
	mov ah, [rsi + rdx]
 	mov [rdi + rdx], ah
	dec rdx
	cmp rdx, 0
	jl end
	jmp loop

end:
	mov rsp, rbp
	mov rax, rdi
	pop rbp
	ret