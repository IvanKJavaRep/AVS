// объявление всех глобальных переменных
	.file	"Array.c"
	.text
	.globl	n
	.bss
	.align 4
	.type	n, @object
	.size	n, 4
// переменная n 
n:
	.zero	4
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 3996
// массив из 999 элементов (по 4 байта)
a:
	.zero	3996
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 3992
// массив из 998 элементов (по 4 байта)
b:
	.zero	3992
	.globl	i
	.align 4
	.type	i, @object
	.size	i, 4
// переменная i
i:
	.zero	4
	.section	.rodata
.LC0:
// подготовка параметров для функции scanf 
	.string	"%d"
.LC1:
// подготовка параметров для функции printf 
	.string	"%d "
	.align 8
.LC2:
// Аналог этой строки в Си: для выполнения 
задачи массив должн состоять минимум из дву элементов, 
а для исключения использования слишком большого количества
ресурсов, ограничим сверху числом 1000

	.ascii	"\320\264\320\273\321\217 \320\262\321\213\320\277\320\276\320"
	.ascii	"\273\320\275\320\265\320\275\320\270\321\217 \320\267\320\260"
	.ascii	"\320\264\320\260\321\207\320\270 \320\274\320\260\321\201\321"
	.ascii	"\201\320\270"
	.string	"\320\262 \320\264\320\276\320\273\320\266\320\275 \321\201\320\276\321\201\321\202\320\276\321\217\321\202\321\214 \320\274\320\270\320\275\320\270\320\274\321\203\320\274 \320\270\320\267 \320\264\320\262\321\203 \321\215\320\273\320\265\320\274\320\265\320\275\321\202\320\276\320\262, \320\260 \320\264\320\273\321\217 \320\270\321\201\320\272\320\273\321\216\321\207\320\265\320\275\320\270\321\217 \320\270\321\201\320\277\320\276\320\273\321\214\320\267\320\276\320\262\320\260\320\275\320\270\321\217 \321\201\320\273\320\270\321\210\320\272\320\276\320\274 \320\261\320\276\320\273\321\214\321\210\320\276\320\263\320\276 \320\272\320\276\320\273\320\270\321\207\320\265\321\201\321\202\320\262\320\260 \321\200\320\265\321\201\321\203\321\200\321\201\320\276\320\262, \320\276\320\263\321\200\320\260\320\275\320\270\321\207\320\270\320\274 \321\201\320\262\320\265\321\200\321\205\321\203 \321\207\320\270\321\201\320\273\320\276\320\274 1000"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
// запускаем программу и готовим параметры для функции scanf
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	n(%rip), %rax  # load value of n into rax
	movq	%rax, %rsi # value from rax to rsi
	leaq	.LC0(%rip), %rax  # %d address into rax
	movq	%rax, %rdi  # value from rax to rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT # call scanf
	movl	n(%rip), %eax  # load value of n into eax
// проверяем условие if(n>=2 && n<1000)
	cmpl	$1, %eax  # %eax - 1
	jle	.L2  # -> .L2, if %eax <= 1
	movl	n(%rip), %eax
	cmpl	$999, %eax  # %eax - 999
	jg	.L2  # >0
	movl	$0, i(%rip)  # if is true => i=0 
	jmp	.L3
.L4:  -- scanf("%d", &a[i]);
	movl	i(%rip), %eax  # put value of i into eax
	cltq  # Convert doubleword in %eax to quadword in %rax (sign-extended)
	leaq	0(,%rax,4), %rdx  # rdx = rax*4
	leaq	a(%rip), %rax  # put address of a into rax
	addq	%rdx, %rax  # rax = &a + i*4
	movq	%rax, %rsi  # rsi = rax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax  # eax =0
	call	__isoc99_scanf@PLT
	movl	i(%rip), %eax  # eax = i
	addl	$1, %eax  # eax+=1
	movl	%eax, i(%rip)
.L3:  ---- for (i = 0; i<n; i++)
	movl	i(%rip), %edx  # put value of i into edx
	movl	n(%rip), %eax  # put value of n into eax
	cmpl	%eax, %edx  # i < n (edx-eax)
	jl	.L4  # go to L4 if i-n<=0
	movl	$0, i(%rip)
	jmp	.L5  # for loop finished
.L6: b[i]=a[i]+a[i+1];
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %ecx  # &a[i]
	movl	i(%rip), %eax
	addl	$1, %eax  # i+1
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %edx # &a[i+1]
	movl	i(%rip), %eax
	addl	%edx, %ecx  # a[i]+a[i+1] -> ecx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L5:   --- for (i = 0; i<n-1; i++)  (second for-loop in my programm)
	movl	n(%rip), %eax
	leal	-1(%rax), %edx
	movl	i(%rip), %eax
	cmpl	%eax, %edx  # n-1 - i >0
	jg	.L6
	movl	$0, i(%rip)
	jmp	.L7  # for loop finished
.L8:  -- printf("%d ", b[i]);
	movl	i(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
.L7:  --- for (i = 0; i<n-1; i++)
	movl	n(%rip), %eax
	leal	-1(%rax), %edx
	movl	i(%rip), %eax
	cmpl	%eax, %edx
	jg	.L8
	jmp	.L9
.L2:
// else
        printf("для выполнения задачи массив должн 
состоять минимум из двух элементов, а для исключения
 использования слишком большого количества ресурсов, 
ограничим сверху числом 1000");
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L9:
	movl	$0, %eax # eax =0 last in stack
	popq	%rbp  # return value on top of stack frame (rbp is a pointer to this frame)
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
