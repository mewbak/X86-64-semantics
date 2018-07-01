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
strlen:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	$0, -8(%rbp)
	jmp	L8
L9:
	addq	$1, -8(%rbp)
L8:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	L9
	movq	-8(%rbp), %rax
	popq	%rbp
	ret
strcpy:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	nop
L12:
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-32(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	%rcx, -32(%rbp)
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	L12
	movq	-8(%rbp), %rax
	popq	%rbp
	ret
memcmp:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	L15
L18:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	je	L16
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %edx
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movzbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	jmp	L17
L16:
	addq	$1, -8(%rbp)
	addq	$1, -16(%rbp)
L15:
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	testq	%rax, %rax
	jne	L18
	movl	$0, %eax
L17:
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
memset:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	L22
L23:
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movl	-28(%rbp), %edx
	movb	%dl, (%rax)
L22:
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	testq	%rax, %rax
	jne	L23
	movq	-24(%rbp), %rax
	popq	%rbp
	ret
memcpy:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	L26
L27:
	movq	-8(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -8(%rbp)
	movq	-16(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movq	%rcx, -16(%rbp)
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
L26:
	movq	-40(%rbp), %rax
	leaq	-1(%rax), %rdx
	movq	%rdx, -40(%rbp)
	testq	%rax, %rax
	jne	L27
	movq	-24(%rbp), %rax
	popq	%rbp
	ret
malloc:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movl	$1000, %eax
	popq	%rbp
	ret
free:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	popq	%rbp
	ret
foo:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movq	%rcx, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -16(%rbp)
	movl	-32(%rbp), %eax
	andl	$15, %eax
	andl	$15, %eax
	movl	%eax, %edx
	movzbl	-16(%rbp), %eax
	andl	$-16, %eax
	orl	%edx, %eax
	movb	%al, -16(%rbp)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, 4(%rdx)
	addq	$1, -8(%rbp)
	movzbl	-14(%rbp), %eax
	orl	$64, %eax
	movb	%al, -14(%rbp)
	movl	$1, -12(%rbp)
	jmp	L33
L34:
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, 4(%rdx)
	addq	$1, -8(%rbp)
	addl	$1, -12(%rbp)
L33:
	movl	-12(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	L34
	popq	%rbp
	ret
.globl _start
_start:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	$5, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$6, -16(%rbp)
	movzbl	-12(%rbp), %eax
	orl	$15, %eax
	movb	%al, -12(%rbp)
	movzwl	-12(%rbp), %eax
	orl	$-16, %eax
	movw	%ax, -12(%rbp)
	movzbl	-10(%rbp), %eax
	orl	$63, %eax
	movb	%al, -10(%rbp)
	movzbl	-10(%rbp), %eax
	orl	$64, %eax
	movb	%al, -10(%rbp)
	movzbl	-10(%rbp), %eax
	andl	$127, %eax
	movb	%al, -10(%rbp)
	movzbl	-9(%rbp), %eax
	orl	$1, %eax
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %eax
	andl	$-3, %eax
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %eax
	orl	$4, %eax
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %eax
	andl	$-9, %eax
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %eax
	orl	$16, %eax
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %eax
	andl	$-33, %eax
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %eax
	orl	$64, %eax
	movb	%al, -9(%rbp)
	movzbl	-9(%rbp), %eax
	andl	$127, %eax
	movb	%al, -9(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, -80(%rbp)
	movl	$4, -72(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, -96(%rbp)
	movzbl	-88(%rbp), %eax
	orl	$1, %eax
	movb	%al, -88(%rbp)
	leaq	-64(%rbp), %rax
	movl	$32, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	leaq	-96(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$2, %edx
	movl	$65, %esi
	movq	%rax, %rdi
	call	foo
	movl	-12(%rbp), %eax
	movl	%eax, -112(%rbp)
	movzbl	-112(%rbp), %eax
	andl	$-16, %eax
	orl	$2, %eax
	movb	%al, -112(%rbp)
	leaq	-64(%rbp), %rax
	leaq	4(%rax), %rcx
	leaq	-112(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp
	testl	%eax, %eax
	je	L36
	call	abort
L36:
	movzbl	-110(%rbp), %eax
	orl	$64, %eax
	movb	%al, -110(%rbp)
	leaq	-64(%rbp), %rax
	leaq	12(%rax), %rcx
	leaq	-112(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcmp
	testl	%eax, %eax
	je	L37
	call	abort
L37:
	movl	$0, %eax
	leave
	ret