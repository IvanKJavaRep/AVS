	.file	"Array_with_parameters.c"
	.text
	.globl	sum_pairs
	.type	sum_pairs, @function
sum_pairs:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-4(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	-40(%rbp), %rax
	addq	%rsi, %rax
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -4(%rbp)
.L2:
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L3
	movl	-20(%rbp), %eax
	subl	$1, %eax
	popq	%rbp
	ret
	.size	sum_pairs, .-sum_pairs
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$3936, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-8028(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -8024(%rbp)
	jmp	.L6
.L7:
	leaq	-4016(%rbp), %rdx
	movl	-8024(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -8024(%rbp)
.L6:
	movl	-8028(%rbp), %eax
	cmpl	%eax, -8024(%rbp)
	jl	.L7
	movl	-8028(%rbp), %eax
	leaq	-8016(%rbp), %rdx
	leaq	-4016(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	sum_pairs
	movl	%eax, -8020(%rbp)
	movl	$0, -8024(%rbp)
	jmp	.L8
.L9:
	movl	-8024(%rbp), %eax
	cltq
	movl	-8016(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8024(%rbp)
.L8:
	movl	-8024(%rbp), %eax
	cmpl	-8020(%rbp), %eax
	jl	.L9
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
