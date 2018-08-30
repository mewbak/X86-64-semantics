    .text
    .globl	strlen
strlen:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movq	$0, -8(%rbp)
    jmp	L2
L3:
    addq	$1, -8(%rbp)
L2:
    movq	-24(%rbp), %rdx
    movq	-8(%rbp), %rax
    addq	%rdx, %rax
    movzbl	(%rax), %eax
    testb	%al, %al
    jne	L3
    movq	-8(%rbp), %rax
    popq	%rbp
    ret
    .globl	strcpy
strcpy:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movq	%rsi, -32(%rbp)
    movq	-24(%rbp), %rax
    movq	%rax, -8(%rbp)
    nop
L6:
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
    jne	L6
    movq	-8(%rbp), %rax
    popq	%rbp
    ret
    .globl	strcmp
strcmp:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movq	%rsi, -16(%rbp)
    jmp	L9
L11:
    addq	$1, -8(%rbp)
    addq	$1, -16(%rbp)
L9:
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    testb	%al, %al
    je	L10
    movq	-8(%rbp), %rax
    movzbl	(%rax), %edx
    movq	-16(%rbp), %rax
    movzbl	(%rax), %eax
    cmpb	%al, %dl
    je	L11
L10:
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %edx
    movq	-16(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %eax
    subl	%eax, %edx
    movl	%edx, %eax
    popq	%rbp
    ret
    .globl	strchr
strchr:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movl	%esi, -12(%rbp)
    jmp	L14
L16:
    movq	-8(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movzbl	(%rax), %eax
    testb	%al, %al
    jne	L14
    movl	$0, %eax
    jmp	L15
L14:
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    movl	-12(%rbp), %edx
    cmpb	%dl, %al
    jne	L16
    movq	-8(%rbp), %rax
L15:
    popq	%rbp
    ret
    .globl	strncpy
strncpy:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movq	%rsi, -32(%rbp)
    movq	%rdx, -40(%rbp)
    movq	-24(%rbp), %rax
    movq	%rax, -8(%rbp)
L20:
    movq	-40(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -40(%rbp)
    testq	%rax, %rax
    jne	L18
    movq	-8(%rbp), %rax
    jmp	L19
L18:
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
    jne	L20
    jmp	L21
L22:
    movq	-24(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -24(%rbp)
    movb	$0, (%rax)
L21:
    movq	-40(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -40(%rbp)
    testq	%rax, %rax
    jne	L22
    movq	-8(%rbp), %rax
L19:
    popq	%rbp
    ret
    .globl	strncmp
strncmp:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movq	%rsi, -16(%rbp)
    movq	%rdx, -24(%rbp)
    jmp	L24
L26:
    movq	-8(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movzbl	(%rax), %ecx
    movq	-16(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -16(%rbp)
    movzbl	(%rax), %eax
    cmpb	%al, %cl
    je	L24
    movq	-8(%rbp), %rax
    subq	$1, %rax
    movzbl	(%rax), %eax
    movzbl	%al, %edx
    movq	-16(%rbp), %rax
    subq	$1, %rax
    movzbl	(%rax), %eax
    movzbl	%al, %eax
    subl	%eax, %edx
    movl	%edx, %eax
    jmp	L25
L24:
    movq	-24(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -24(%rbp)
    testq	%rax, %rax
    jne	L26
    movl	$0, %eax
L25:
    popq	%rbp
    ret
    .globl	strrchr
strrchr:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movl	%esi, -28(%rbp)
    movq	$0, -8(%rbp)
L29:
    movq	-24(%rbp), %rax
    movzbl	(%rax), %eax
    movl	-28(%rbp), %edx
    cmpb	%dl, %al
    jne	L28
    movq	-24(%rbp), %rax
    movq	%rax, -8(%rbp)
L28:
    movq	-24(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -24(%rbp)
    movzbl	(%rax), %eax
    testb	%al, %al
    jne	L29
    movq	-8(%rbp), %rax
    popq	%rbp
    ret
    .globl	memcmp
memcmp:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movq	%rsi, -32(%rbp)
    movq	%rdx, -40(%rbp)
    movq	-24(%rbp), %rax
    movq	%rax, -16(%rbp)
    movq	-32(%rbp), %rax
    movq	%rax, -8(%rbp)
    jmp	L32
L35:
    movq	-16(%rbp), %rax
    movzbl	(%rax), %edx
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    cmpb	%al, %dl
    je	L33
    movq	-16(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %edx
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %eax
    subl	%eax, %edx
    movl	%edx, %eax
    jmp	L34
L33:
    addq	$1, -16(%rbp)
    addq	$1, -8(%rbp)
L32:
    movq	-40(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -40(%rbp)
    testq	%rax, %rax
    jne	L35
    movl	$0, %eax
L34:
    popq	%rbp
    ret
    .globl	__stack_chk_fail
__stack_chk_fail:
    pushq	%rbp
    movq	%rsp, %rbp
    movq $-1, %rax
    jmp %rax
    
    nop
    popq	%rbp
    ret
    .globl	exit
exit:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movq $-1, %rax
    jmp %rax
    
    nop
    popq	%rbp
    ret
    .globl	abort
abort:
    pushq	%rbp
    movq	%rsp, %rbp
    movq $-1, %rax
    jmp %rax
    
    nop
    popq	%rbp
    ret
    .globl	memset
memset:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movl	%esi, -28(%rbp)
    movq	%rdx, -40(%rbp)
    movq	-24(%rbp), %rax
    movq	%rax, -8(%rbp)
    jmp	L40
L41:
    movq	-8(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	-28(%rbp), %edx
    movb	%dl, (%rax)
L40:
    movq	-40(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -40(%rbp)
    testq	%rax, %rax
    jne	L41
    movq	-24(%rbp), %rax
    popq	%rbp
    ret
    .globl	memcpy
memcpy:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -24(%rbp)
    movq	%rsi, -32(%rbp)
    movq	%rdx, -40(%rbp)
    movq	-24(%rbp), %rax
    movq	%rax, -16(%rbp)
    movq	-32(%rbp), %rax
    movq	%rax, -8(%rbp)
    jmp	L44
L45:
    movq	-16(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -16(%rbp)
    movq	-8(%rbp), %rdx
    leaq	1(%rdx), %rcx
    movq	%rcx, -8(%rbp)
    movzbl	(%rdx), %edx
    movb	%dl, (%rax)
L44:
    movq	-40(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -40(%rbp)
    testq	%rax, %rax
    jne	L45
    movq	-24(%rbp), %rax
    popq	%rbp
    ret
    .globl	malloc
malloc:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movl	$1000, %eax
    popq	%rbp
    ret
    .globl	calloc
calloc:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movq	%rsi, -16(%rbp)
    movl	$1000, %eax
    popq	%rbp
    ret
    .globl	free
free:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    nop
    popq	%rbp
    ret
    .globl	isprint
isprint:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    cmpl	$96, -4(%rbp)
    jle	L53
    cmpl	$122, -4(%rbp)
    jg	L53
    movl	$1, %eax
    jmp	L54
L53:
    cmpl	$64, -4(%rbp)
    jle	L55
    cmpl	$90, -4(%rbp)
    jg	L55
    movl	$1, %eax
    jmp	L54
L55:
    cmpl	$47, -4(%rbp)
    jle	L56
    cmpl	$57, -4(%rbp)
    jg	L56
    movl	$1, %eax
    jmp	L54
L56:
    movl	$0, %eax
L54:
    popq	%rbp
    ret
    .globl	feq
feq:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jne	L58
    movl	$13, %eax
    jmp	L59
L58:
    movl	$140, %eax
L59:
    popq	%rbp
    ret
    .globl	fne
fne:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    je	L61
    movl	$13, %eax
    jmp	L62
L61:
    movl	$140, %eax
L62:
    popq	%rbp
    ret
    .globl	flt
flt:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jge	L64
    movl	$13, %eax
    jmp	L65
L64:
    movl	$140, %eax
L65:
    popq	%rbp
    ret
    .globl	fge
fge:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jl	L67
    movl	$13, %eax
    jmp	L68
L67:
    movl	$140, %eax
L68:
    popq	%rbp
    ret
    .globl	fgt
fgt:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jle	L70
    movl	$13, %eax
    jmp	L71
L70:
    movl	$140, %eax
L71:
    popq	%rbp
    ret
    .globl	fle
fle:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jg	L73
    movl	$13, %eax
    jmp	L74
L73:
    movl	$140, %eax
L74:
    popq	%rbp
    ret
    .globl	fltu
fltu:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jnb	L76
    movl	$13, %eax
    jmp	L77
L76:
    movl	$140, %eax
L77:
    popq	%rbp
    ret
    .globl	fgeu
fgeu:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jb	L79
    movl	$13, %eax
    jmp	L80
L79:
    movl	$140, %eax
L80:
    popq	%rbp
    ret
    .globl	fgtu
fgtu:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jbe	L82
    movl	$13, %eax
    jmp	L83
L82:
    movl	$140, %eax
L83:
    popq	%rbp
    ret
    .globl	fleu
fleu:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	%edi, -4(%rbp)
    movl	%esi, -8(%rbp)
    movl	-4(%rbp), %eax
    cmpl	-8(%rbp), %eax
    ja	L85
    movl	$13, %eax
    jmp	L86
L85:
    movl	$140, %eax
L86:
    popq	%rbp
    ret
    .globl	args
    .data
args:
    .long	0
    .long	1
    .long	-1
    .long	2147483647
    .long	-2147483648
    .long	-2147483647
    .long	440345459
    .long	-1819996526
    .globl	correct_results
correct_results:
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	13
    .long	140
    .long	13
    .long	140
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .long	140
    .long	13
    .text
    .globl	main
.globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$32, %rsp
    movq	$correct_results, -8(%rbp)
    movl	$0, -24(%rbp)
    jmp	L88
L101:
    movl	-24(%rbp), %eax
    cltq
    movl	args(,%rax,4), %eax
    movl	%eax, -16(%rbp)
    movl	$0, -20(%rbp)
    jmp	L89
L100:
    movl	-20(%rbp), %eax
    cltq
    movl	args(,%rax,4), %eax
    movl	%eax, -12(%rbp)
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	feq
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L90
    call	abort
L90:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	fne
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L91
    call	abort
L91:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	flt
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L92
    call	abort
L92:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	fge
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L93
    call	abort
L93:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	fgt
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L94
    call	abort
L94:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	fle
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L95
    call	abort
L95:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	fltu
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L96
    call	abort
L96:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	fgeu
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L97
    call	abort
L97:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	fgtu
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L98
    call	abort
L98:
    movl	-12(%rbp), %edx
    movl	-16(%rbp), %eax
    movl	%edx, %esi
    movl	%eax, %edi
    call	fleu
    movl	%eax, %ecx
    movq	-8(%rbp), %rax
    leaq	4(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	(%rax), %eax
    cmpl	%eax, %ecx
    je	L99
    call	abort
L99:
    addl	$1, -20(%rbp)
L89:
    cmpl	$7, -20(%rbp)
    jle	L100
    addl	$1, -24(%rbp)
L88:
    cmpl	$7, -24(%rbp)
    jle	L101
    movl	$0, %edi
    call	exit