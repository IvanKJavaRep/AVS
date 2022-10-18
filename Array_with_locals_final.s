	.file	"Array_with_locals.c"
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
	.string	"%d "
.LC1:
	.string	"%s"
	.text
	.globl	print_array
	.type	print_array, @function
print_array:
	push	rbp
	mov	rbp, rsp
	add	rsp, -128
	mov	QWORD PTR -120[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	movabs	rax, 8079591190941548810
	movabs	rdx, 110386907867506
	mov	QWORD PTR -112[rbp], rax
	mov	QWORD PTR -104[rbp], rdx
	mov	QWORD PTR -96[rbp], 0
	mov	QWORD PTR -88[rbp], 0
	mov	QWORD PTR -80[rbp], 0
	mov	QWORD PTR -72[rbp], 0
	mov	QWORD PTR -64[rbp], 0
	mov	QWORD PTR -56[rbp], 0
	mov	QWORD PTR -48[rbp], 0
	mov	QWORD PTR -40[rbp], 0
	mov	QWORD PTR -32[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR i[rip], 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR i[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -120[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR i[rip]
	add	eax, 1
	mov	DWORD PTR i[rip], eax
.L2:
	mov	eax, DWORD PTR n[rip]
	lea	edx, -1[rax]
	mov	eax, DWORD PTR i[rip]
	cmp	edx, eax
	jg	.L3
	lea	rax, -112[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leave
	ret
	.size	print_array, .-print_array
	.section	.rodata
.LC2:
	.string	"%d"
	.align 8
.LC3:
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
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR n[rip]
	cmp	eax, 1
	jle	.L6
	mov	eax, DWORD PTR n[rip]
	cmp	eax, 999
	jg	.L6
	mov	DWORD PTR i[rip], 0
	jmp	.L7
.L8:
	mov	eax, DWORD PTR i[rip]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR i[rip]
	add	eax, 1
	mov	DWORD PTR i[rip], eax
.L7:
	mov	edx, DWORD PTR i[rip]
	mov	eax, DWORD PTR n[rip]
	cmp	edx, eax
	jl	.L8
	mov	DWORD PTR i[rip], 0
	jmp	.L9
.L10:
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
.L9:
	mov	eax, DWORD PTR n[rip]
	lea	edx, -1[rax]
	mov	eax, DWORD PTR i[rip]
	cmp	edx, eax
	jg	.L10
	lea	rax, b[rip]
	mov	rdi, rax
	call	print_array
	jmp	.L11
.L6:
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L11:
	mov	eax, 0
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
