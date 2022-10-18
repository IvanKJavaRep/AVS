	.file	"Array.c"
	.intel_syntax noprefix
	.text
	.globl	n
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.zero	4
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 3996
a:
	.zero	3996
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 3992
b:
	.zero	3992
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
	.align 8
.LC2:
	.ascii	"\320\264\320\273\321\217 \320\262\321\213\320\277\320\276\320"
	.ascii	"\273\320\275\320\265\320\275\320\270\321\217 \320\267\320\260"
	.ascii	"\320\264\320\260\321\207\320\270 \320\274\320\260\321\201\321"
	.ascii	"\201\320\270"
	.string	"\320\262 \320\264\320\276\320\273\320\266\320\275 \321\201\320\276\321\201\321\202\320\276\321\217\321\202\321\214 \320\274\320\270\320\275\320\270\320\274\321\203\320\274 \320\270\320\267 \320\264\320\262\321\203 \321\215\320\273\320\265\320\274\320\265\320\275\321\202\320\276\320\262, \320\260 \320\264\320\273\321\217 \320\270\321\201\320\272\320\273\321\216\321\207\320\265\320\275\320\270\321\217 \320\270\321\201\320\277\320\276\320\273\321\214\320\267\320\276\320\262\320\260\320\275\320\270\321\217 \321\201\320\273\320\270\321\210\320\272\320\276\320\274 \320\261\320\276\320\273\321\214\321\210\320\276\320\263\320\276 \320\272\320\276\320\273\320\270\321\207\320\265\321\201\321\202\320\262\320\260 \321\200\320\265\321\201\321\203\321\200\321\201\320\276\320\262, \320\276\320\263\321\200\320\260\320\275\320\270\321\207\320\270\320\274 \321\201\320\262\320\265\321\200\321\205\321\203 \321\207\320\270\321\201\320\273\320\276\320\274 1000"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	lea	rax, n[rip]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR n[rip]
	cmp	eax, 1
	jle	.L2
	mov	eax, DWORD PTR n[rip]
	cmp	eax, 999
	jg	.L2
	mov	DWORD PTR i[rip], 0
	jmp	.L3
.L4:
	mov	eax, DWORD PTR i[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR i[rip]
	add	eax, 1
	mov	DWORD PTR i[rip], eax
.L3:
	mov	edx, DWORD PTR i[rip]
	mov	eax, DWORD PTR n[rip]
	cmp	edx, eax
	jl	.L4
	mov	DWORD PTR i[rip], 0
	jmp	.L5
.L6:
	mov	eax, DWORD PTR i[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	ecx, DWORD PTR [rdx+rax]
	mov	eax, DWORD PTR i[rip]
	add	eax, 1
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	edx, DWORD PTR [rdx+rax]
	mov	eax, DWORD PTR i[rip]
	add	ecx, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	DWORD PTR [rdx+rax], ecx
	mov	eax, DWORD PTR i[rip]
	add	eax, 1
	mov	DWORD PTR i[rip], eax
.L5:
	mov	eax, DWORD PTR n[rip]
	lea	edx, -1[rax]
	mov	eax, DWORD PTR i[rip]
	cmp	edx, eax
	jg	.L6
	mov	DWORD PTR i[rip], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR i[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR i[rip]
	add	eax, 1
	mov	DWORD PTR i[rip], eax
.L7:
	mov	eax, DWORD PTR n[rip]
	lea	edx, -1[rax]
	mov	eax, DWORD PTR i[rip]
	cmp	edx, eax
	jg	.L8
	jmp	.L9
.L2:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L9:
	mov	eax, 0
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
