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
    .globl	f_le
f_le:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$24, %rsp
    movq	%rdi, %rax
    movq	%rsi, %r8
    movq	%rax, %rsi
    movq	%rdx, %rdi
    movq	%r8, %rdi
    movq	%rsi, -128(%rbp)
    movq	%rdi, -120(%rbp)
    movq	%rdx, -144(%rbp)
    movq	%rcx, -136(%rbp)
    movl	$0, -100(%rbp)
    movq	-120(%rbp), %rdx
    movq	-128(%rbp), %rax
    subq	%rax, %rdx
    movq	%rdx, %rax
    movq	%rax, -88(%rbp)
    movq	-144(%rbp), %rdx
    movq	-136(%rbp), %rax
    subq	%rax, %rdx
    movq	%rdx, %rax
    movq	%rax, -96(%rbp)
    movq	-144(%rbp), %rax
    cmpq	-96(%rbp), %rax
    jnb	L58
    negq	-96(%rbp)
    notl	-100(%rbp)
L58:
    movq	-128(%rbp), %rdx
    movq	-144(%rbp), %rax
    imulq	%rdx, %rax
    movq	%rax, -48(%rbp)
    movq	-120(%rbp), %rdx
    movq	-136(%rbp), %rax
    imulq	%rdx, %rax
    movq	%rax, -64(%rbp)
    movq	-88(%rbp), %rax
    imulq	-96(%rbp), %rax
    movq	%rax, -32(%rbp)
    movq	-32(%rbp), %rdx
    movl	-100(%rbp), %eax
    cltq
    xorq	%rdx, %rax
    movq	%rax, -32(%rbp)
    movq	-64(%rbp), %rdx
    movq	-56(%rbp), %rax
    addq	%rax, %rdx
    movq	-40(%rbp), %rax
    addq	%rax, %rdx
    movq	-24(%rbp), %rax
    addq	%rdx, %rax
    movq	%rax, -80(%rbp)
    movq	-40(%rbp), %rdx
    movq	-64(%rbp), %rax
    addq	%rax, %rdx
    movq	-48(%rbp), %rax
    addq	%rax, %rdx
    movq	-32(%rbp), %rax
    addq	%rdx, %rax
    movq	%rax, -16(%rbp)
    movq	-80(%rbp), %rax
    movl	%eax, %edx
    movq	-16(%rbp), %rax
    addl	%edx, %eax
    leave
    ret
    .globl	f_be
f_be:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$24, %rsp
    movq	%rdi, %rax
    movq	%rsi, %r8
    movq	%rax, %rsi
    movq	%rdx, %rdi
    movq	%r8, %rdi
    movq	%rsi, -128(%rbp)
    movq	%rdi, -120(%rbp)
    movq	%rdx, -144(%rbp)
    movq	%rcx, -136(%rbp)
    movl	$0, -100(%rbp)
    movq	-128(%rbp), %rdx
    movq	-120(%rbp), %rax
    subq	%rax, %rdx
    movq	%rdx, %rax
    movq	%rax, -88(%rbp)
    movq	-136(%rbp), %rdx
    movq	-144(%rbp), %rax
    subq	%rax, %rdx
    movq	%rdx, %rax
    movq	%rax, -96(%rbp)
    movq	-136(%rbp), %rax
    cmpq	-96(%rbp), %rax
    jnb	L61
    negq	-96(%rbp)
    notl	-100(%rbp)
L61:
    movq	-120(%rbp), %rdx
    movq	-136(%rbp), %rax
    imulq	%rdx, %rax
    movq	%rax, -48(%rbp)
    movq	-128(%rbp), %rdx
    movq	-144(%rbp), %rax
    imulq	%rdx, %rax
    movq	%rax, -64(%rbp)
    movq	-88(%rbp), %rax
    imulq	-96(%rbp), %rax
    movq	%rax, -32(%rbp)
    movq	-32(%rbp), %rdx
    movl	-100(%rbp), %eax
    cltq
    xorq	%rdx, %rax
    movq	%rax, -32(%rbp)
    movq	-64(%rbp), %rdx
    movq	-64(%rbp), %rax
    addq	%rax, %rdx
    movq	-48(%rbp), %rax
    addq	%rax, %rdx
    movq	-32(%rbp), %rax
    addq	%rdx, %rax
    movq	%rax, -80(%rbp)
    movq	-48(%rbp), %rdx
    movq	-56(%rbp), %rax
    addq	%rax, %rdx
    movq	-40(%rbp), %rax
    addq	%rax, %rdx
    movq	-24(%rbp), %rax
    addq	%rdx, %rax
    movq	%rax, -16(%rbp)
    movq	-72(%rbp), %rax
    movl	%eax, %edx
    movq	-8(%rbp), %rax
    addl	%edx, %eax
    leave
    ret
    .globl	main
.globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    pushq	%rbx
    subq	$24, %rsp
    movq	$268435456, -32(%rbp)
    movl	$3758096384, %eax
    movq	%rax, -24(%rbp)
    movq	-32(%rbp), %rdx
    movabsq	$1152921508364943360, %rax
    cmpq	%rax, %rdx
    jne	L64
    movl	$0, %ecx
    movl	$0, %ebx
    movabsq	$4294967296, %rcx
    movl	$0, %eax
    movl	$0, %edx
    movabsq	$4294967296, %rax
    movq	%rax, %rsi
    movq	%rdx, %rdi
    movq	%rdx, %rax
    movq	%rcx, %rdx
    movq	%rbx, %rcx
    movq	%rsi, %rdi
    movq	%rax, %rsi
    call	f_be
    cmpl	$-1, %eax
    je	L64
    call	abort
L64:
    movq	-32(%rbp), %rdx
    movabsq	$-2305843008945258496, %rax
    cmpq	%rax, %rdx
    jne	L65
    movl	$0, %ecx
    movl	$0, %ebx
    movabsq	$4294967296, %rcx
    movl	$0, %eax
    movl	$0, %edx
    movabsq	$4294967296, %rax
    movq	%rax, %rsi
    movq	%rdx, %rdi
    movq	%rdx, %rax
    movq	%rcx, %rdx
    movq	%rbx, %rcx
    movq	%rsi, %rdi
    movq	%rax, %rsi
    call	f_le
    cmpl	$-1, %eax
    je	L65
    call	abort
L65:
    movl	$0, %edi
    call	exit