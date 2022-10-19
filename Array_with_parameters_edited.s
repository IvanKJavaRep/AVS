	.file	"Array_with_parameters.c"
	.text
	.globl	sum_pairs
	.type	sum_pairs, @function
sum_pairs:
	pushq	%rbp
	movq	%rsp, %rbp
	# Выгрузка параметров из регистров в стек уже внутри функции
		movl	%edi, -20(%rbp) # int n
		movq	%rsi, -32(%rbp) # адрес a
		movq	%rdx, -40(%rbp) # адрес b
		movl	$0, -4(%rbp)    # int i, локальная переменная 
	# Из регистров, в которые были записаны параметры функции в регистры по нашему усмотрению.
		movl	%edi, %r13d # int n (можно было без промежуточного edi сразу обращаться к r13, уменьшить количество параметров функции)
		movq	%rsi, %r9 # адрес a
		movq	%rdx, %r10 # адрес b
		movl	$0, %r11d    # int i, локальная
	jmp	.L2
.L3:
	movl	%r11d, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	%r9, %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	%r11d, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,4), %rdx
	movq	%r9, %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	%r11d, %eax
	cltq
	leaq	0(,%rax,4), %rsi
	movq	%r10, %rax
	addq	%rsi, %rax
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, %r11d
.L2:
	movl	%r13d, %eax
	subl	$1, %eax
	cmpl	%eax, %r11d
	jl	.L3
	# Возвращаемое значение это n-1 и передается оно через регистр eax и считывается уже в функции мэйн
		movl	%r13d, %eax
		subl	$1, %eax
	popq	%rbp # очистка стека
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
	movl	$0, %r12d # было -8024(%rbp), поменяли на %r12d
	movl	-8028(%rbp), %r13d # переместим прочитанное n из памяти в регистр
	jmp	.L6
.L7:
	leaq	-4016(%rbp), %rdx
	movl	%r12d, %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, %r12d
.L6:
	movl	%r13d, %eax
	cmpl	%eax, %r12d
	jl	.L7
	movl	%r13d, %eax
	# Передача параметров в функцию через регистры ( первые 4 параметра передаются через rdi, rsi,rdx,rcx соответственно)
		leaq	-8016(%rbp), %rdx # int[] b
		leaq	-4016(%rbp), %rsi # int[] a
		movl	%eax, %edi # int n
	call	sum_pairs
	movl	%eax, -8020(%rbp)  # запись возвращаемого значения на стек (можно заменить на регистр %r14)
	movl	%eax, %r14d # эта строка - аналог предыдущей. Оставил для наглядности.
	movl	$0, %r12d
	jmp	.L8
.L9:
	movl	%r12d, %eax
	cltq
	movl	-8016(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, %r12d
.L8:
	movl	%r12d, %eax
	cmpl	%r14d, %eax
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
