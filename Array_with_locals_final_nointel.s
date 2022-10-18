	.file	"Array_with_locals.c"
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
	pushq	%rbp
	movq	%rsp, %rbp
	addq	$-128, %rsp # суммарный размер локальных переменных на стеке
	movq	%rdi, -120(%rbp)
# сохранение аргументов на стеке
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax

# создание char str[100] = "\nArray printed";
	movabsq	$8079591190941548810, %rax 
	movabsq	$110386907867506, %rdx
	movq	%rax, -112(%rbp)
	movq	%rdx, -104(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, i(%rip)
	jmp	.L2
.L3:
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L2:
	movl	n(%rip), %eax
	leal	-1(%rax), %edx
	movl	i(%rip), %eax
	cmpl	%eax, %edx
	jg	.L3
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
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
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	n(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	n(%rip), %eax
	cmpl	$1, %eax
	jle	.L6
	movl	n(%rip), %eax
	cmpl	$999, %eax
	jg	.L6
	movl	$0, i(%rip)
	jmp	.L7
.L8:
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L7:
	movl	i(%rip), %edx
	movl	n(%rip), %eax
	cmpl	%eax, %edx
	jl	.L8
	movl	$0, i(%rip)
	jmp	.L9
.L10:
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %ecx
	movl	i(%rip), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	i(%rip), %eax
	addl	%edx, %ecx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L9:
	movl	n(%rip), %eax
	leal	-1(%rax), %edx
	movl	i(%rip), %eax
	cmpl	%eax, %edx
	jg	.L10
	leaq	b(%rip), %rax # rax = b 
	movq	%rax, %rdi # rdi = rax регистр rdi - формальный параметр
в который кладется наша локальная переменная.
	call	print_array
	jmp	.L11
.L6:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT  # вызов функции с передачей параметров.
.L11:
	movl	$0, %eax
	popq	%rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
