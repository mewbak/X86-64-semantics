strchr:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	nop
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movl	-12(%rbp), %eax
	cmpb	%al, %dl
	je	L6
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	L3
	movl	$0, %eax
	jmp	L1
L3:
	movq	-8(%rbp), %rax
	jmp	L1
L6:
L1:
	popq	%rbp
	ret
exit:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movq $-1, %rax
	jmp %rax
	
	popq	%rbp
	ret
abort:
	pushq	%rbp
	movq	%rsp, %rbp
	movq $-1, %rax
	jmp %rax
	
	popq	%rbp
	ret
a:
	.value	-24075
b:
	.value	3419
	.bss
c:
	.zero	4
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movzwl	a(%rip), %eax
	movzwl	%ax, %edx
	movzwl	b(%rip), %eax
	movzwl	%ax, %ecx
	movl	$0, %eax
	subl	%ecx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	testl	%eax, %eax
	je	L9
	movzwl	b(%rip), %eax
	movzwl	%ax, %edx
	movl	$0, %eax
	subl	%edx, %eax
	addl	%eax, %eax
	addl	$1, %eax
	addl	$2147483647, %eax
	movl	%eax, c(%rip)
L9:
	popq	%rbp
	ret
.globl _start
_start:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$0, %eax
	call	foo
	movl	c(%rip), %eax
	cmpl	$2147476810, %eax
	je	L12
	movl	$-1, %eax
	jmp	L13
L12:
	movl	$0, %eax
L13:
	popq	%rbp
	ret