    .text
    .globl	strchr
strchr:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movl	%esi, -12(%rbp)
    nop
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    movl	-12(%rbp), %edx
    cmpb	%dl, %al
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
    .globl	strlen
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
    .globl	strcpy
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
    jmp	L15
L18:
    movq	-16(%rbp), %rax
    movzbl	(%rax), %edx
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    cmpb	%al, %dl
    je	L16
    movq	-16(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %edx
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %eax
    subl	%eax, %edx
    movl	%edx, %eax
    jmp	L17
L16:
    addq	$1, -16(%rbp)
    addq	$1, -8(%rbp)
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
    jmp	L26
L27:
    movq	-16(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -16(%rbp)
    movq	-8(%rbp), %rdx
    leaq	1(%rdx), %rcx
    movq	%rcx, -8(%rbp)
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
    jle	L35
    cmpl	$122, -4(%rbp)
    jg	L35
    movl	$1, %eax
    jmp	L36
L35:
    cmpl	$64, -4(%rbp)
    jle	L37
    cmpl	$90, -4(%rbp)
    jg	L37
    movl	$1, %eax
    jmp	L36
L37:
    cmpl	$47, -4(%rbp)
    jle	L38
    cmpl	$57, -4(%rbp)
    jg	L38
    movl	$1, %eax
    jmp	L36
L38:
    movl	$0, %eax
L36:
    popq	%rbp
    ret
    .globl	h
h:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	%edi, -4(%rbp)
    movq	%rsi, -16(%rbp)
    movl	-4(%rbp), %eax
    cmpl	$1, %eax
    je	L41
    cmpl	$5, %eax
    je	L42
    jmp	L56
L41:
    movq	-16(%rbp), %rax
    movl	(%rax), %eax
    cmpl	$48, %eax
    jnb	L43
    movq	-16(%rbp), %rax
    movq	16(%rax), %rdx
    movq	-16(%rbp), %rax
    movl	(%rax), %eax
    movl	%eax, %eax
    addq	%rdx, %rax
    movq	-16(%rbp), %rdx
    movl	(%rdx), %edx
    leal	8(%rdx), %ecx
    movq	-16(%rbp), %rdx
    movl	%ecx, (%rdx)
    jmp	L44
L43:
    movq	-16(%rbp), %rax
    movq	8(%rax), %rax
    leaq	8(%rax), %rcx
    movq	-16(%rbp), %rdx
    movq	%rcx, 8(%rdx)
L44:
    movl	(%rax), %eax
    cmpl	$3, %eax
    jne	L45
    movq	-16(%rbp), %rax
    movl	(%rax), %eax
    cmpl	$48, %eax
    jnb	L46
    movq	-16(%rbp), %rax
    movq	16(%rax), %rdx
    movq	-16(%rbp), %rax
    movl	(%rax), %eax
    movl	%eax, %eax
    addq	%rdx, %rax
    movq	-16(%rbp), %rdx
    movl	(%rdx), %edx
    leal	8(%rdx), %ecx
    movq	-16(%rbp), %rdx
    movl	%ecx, (%rdx)
    jmp	L47
L46:
    movq	-16(%rbp), %rax
    movq	8(%rax), %rax
    leaq	8(%rax), %rcx
    movq	-16(%rbp), %rdx
    movq	%rcx, 8(%rdx)
L47:
    movl	(%rax), %eax
    cmpl	$4, %eax
    je	L57
L45:
    call	abort
L42:
    movq	-16(%rbp), %rax
    movl	(%rax), %eax
    cmpl	$48, %eax
    jnb	L50
    movq	-16(%rbp), %rax
    movq	16(%rax), %rdx
    movq	-16(%rbp), %rax
    movl	(%rax), %eax
    movl	%eax, %eax
    addq	%rdx, %rax
    movq	-16(%rbp), %rdx
    movl	(%rdx), %edx
    leal	8(%rdx), %ecx
    movq	-16(%rbp), %rdx
    movl	%ecx, (%rdx)
    jmp	L51
L50:
    movq	-16(%rbp), %rax
    movq	8(%rax), %rax
    leaq	8(%rax), %rcx
    movq	-16(%rbp), %rdx
    movq	%rcx, 8(%rdx)
L51:
    movl	(%rax), %eax
    cmpl	$9, %eax
    jne	L52
    movq	-16(%rbp), %rax
    movl	(%rax), %eax
    cmpl	$48, %eax
    jnb	L53
    movq	-16(%rbp), %rax
    movq	16(%rax), %rdx
    movq	-16(%rbp), %rax
    movl	(%rax), %eax
    movl	%eax, %eax
    addq	%rdx, %rax
    movq	-16(%rbp), %rdx
    movl	(%rdx), %edx
    leal	8(%rdx), %ecx
    movq	-16(%rbp), %rdx
    movl	%ecx, (%rdx)
    jmp	L54
L53:
    movq	-16(%rbp), %rax
    movq	8(%rax), %rax
    leaq	8(%rax), %rcx
    movq	-16(%rbp), %rdx
    movq	%rcx, 8(%rdx)
L54:
    movl	(%rax), %eax
    cmpl	$10, %eax
    je	L58
L52:
    call	abort
L56:
    call	abort
L57:
    nop
    jmp	L39
L58:
    nop
L39:
    leave
    ret
    .globl	f1
f1:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$224, %rsp
    movl	%edi, -212(%rbp)
    movq	%rsi, -224(%rbp)
    movq	%rdx, -160(%rbp)
    movq	%rcx, -152(%rbp)
    movq	%r8, -144(%rbp)
    movq	%r9, -136(%rbp)
    testb	%al, %al
    je	L60
    vmovaps	%xmm0, -128(%rbp)
    vmovaps	%xmm1, -112(%rbp)
    vmovaps	%xmm2, -96(%rbp)
    vmovaps	%xmm3, -80(%rbp)
    vmovaps	%xmm4, -64(%rbp)
    vmovaps	%xmm5, -48(%rbp)
    vmovaps	%xmm6, -32(%rbp)
    vmovaps	%xmm7, -16(%rbp)
L60:
    movq	$40, %rax
    movq	%rax, -184(%rbp)
    xorl	%eax, %eax
    movl	$16, -208(%rbp)
    movl	$48, -204(%rbp)
    leaq	16(%rbp), %rax
    movq	%rax, -200(%rbp)
    leaq	-176(%rbp), %rax
    movq	%rax, -192(%rbp)
    leaq	-208(%rbp), %rdx
    movl	-212(%rbp), %eax
    movq	%rdx, %rsi
    movl	%eax, %edi
    call	h
    cmpl	$1, -212(%rbp)
    jne	L61
    cmpq	$2, -224(%rbp)
    je	L64
L61:
    call	abort
L64:
    nop
    movq	-184(%rbp), %rax
    xorq	$40, %rax
    je	L63
    call	__stack_chk_fail
L63:
    leave
    ret
    .globl	f2
f2:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$240, %rsp
    movl	%edi, -212(%rbp)
    movl	%esi, -216(%rbp)
    movl	%edx, -220(%rbp)
    movq	%rcx, -232(%rbp)
    movq	%r8, -144(%rbp)
    movq	%r9, -136(%rbp)
    testb	%al, %al
    je	L66
    vmovaps	%xmm0, -128(%rbp)
    vmovaps	%xmm1, -112(%rbp)
    vmovaps	%xmm2, -96(%rbp)
    vmovaps	%xmm3, -80(%rbp)
    vmovaps	%xmm4, -64(%rbp)
    vmovaps	%xmm5, -48(%rbp)
    vmovaps	%xmm6, -32(%rbp)
    vmovaps	%xmm7, -16(%rbp)
L66:
    movq	$40, %rax
    movq	%rax, -184(%rbp)
    xorl	%eax, %eax
    movl	$32, -208(%rbp)
    movl	$48, -204(%rbp)
    leaq	16(%rbp), %rax
    movq	%rax, -200(%rbp)
    leaq	-176(%rbp), %rax
    movq	%rax, -192(%rbp)
    leaq	-208(%rbp), %rdx
    movl	-212(%rbp), %eax
    movq	%rdx, %rsi
    movl	%eax, %edi
    call	h
    cmpl	$5, -212(%rbp)
    jne	L67
    cmpl	$6, -216(%rbp)
    jne	L67
    cmpl	$7, -220(%rbp)
    jne	L67
    cmpq	$8, -232(%rbp)
    je	L70
L67:
    call	abort
L70:
    nop
    movq	-184(%rbp), %rax
    xorq	$40, %rax
    je	L69
    call	__stack_chk_fail
L69:
    leave
    ret
    .globl	main
.globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	$4, %ecx
    movl	$3, %edx
    movl	$2, %esi
    movl	$1, %edi
    movl	$0, %eax
    call	f1
    movl	$10, %r9d
    movl	$9, %r8d
    movl	$8, %ecx
    movl	$7, %edx
    movl	$6, %esi
    movl	$5, %edi
    movl	$0, %eax
    call	f2
    movl	$0, %eax
    popq	%rbp
    ret