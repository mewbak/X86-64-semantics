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
    .globl	strcmp
strcmp:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movq	%rsi, -16(%rbp)
    jmp	L15
L17:
    addq	$1, -8(%rbp)
    addq	$1, -16(%rbp)
L15:
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    testb	%al, %al
    je	L16
    movq	-8(%rbp), %rax
    movzbl	(%rax), %edx
    movq	-16(%rbp), %rax
    movzbl	(%rax), %eax
    cmpb	%al, %dl
    je	L17
L16:
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
    jmp	L20
L23:
    movq	-16(%rbp), %rax
    movzbl	(%rax), %edx
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    cmpb	%al, %dl
    je	L21
    movq	-16(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %edx
    movq	-8(%rbp), %rax
    movzbl	(%rax), %eax
    movzbl	%al, %eax
    subl	%eax, %edx
    movl	%edx, %eax
    jmp	L22
L21:
    addq	$1, -16(%rbp)
    addq	$1, -8(%rbp)
L20:
    movq	-40(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -40(%rbp)
    testq	%rax, %rax
    jne	L23
    movl	$0, %eax
L22:
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
    jmp	L28
L29:
    movq	-8(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -8(%rbp)
    movl	-28(%rbp), %edx
    movb	%dl, (%rax)
L28:
    movq	-40(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -40(%rbp)
    testq	%rax, %rax
    jne	L29
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
    jmp	L32
L33:
    movq	-16(%rbp), %rax
    leaq	1(%rax), %rdx
    movq	%rdx, -16(%rbp)
    movq	-8(%rbp), %rdx
    leaq	1(%rdx), %rcx
    movq	%rcx, -8(%rbp)
    movzbl	(%rdx), %edx
    movb	%dl, (%rax)
L32:
    movq	-40(%rbp), %rax
    leaq	-1(%rax), %rdx
    movq	%rdx, -40(%rbp)
    testq	%rax, %rax
    jne	L33
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
    jle	L41
    cmpl	$122, -4(%rbp)
    jg	L41
    movl	$1, %eax
    jmp	L42
L41:
    cmpl	$64, -4(%rbp)
    jle	L43
    cmpl	$90, -4(%rbp)
    jg	L43
    movl	$1, %eax
    jmp	L42
L43:
    cmpl	$47, -4(%rbp)
    jle	L44
    cmpl	$57, -4(%rbp)
    jg	L44
    movl	$1, %eax
    jmp	L42
L44:
    movl	$0, %eax
L42:
    popq	%rbp
    ret
    .globl	foo
foo:
    pushq	%rbp
    movq	%rsp, %rbp
    movq	%rdi, -8(%rbp)
    movl	%esi, -12(%rbp)
    movl	%edx, -16(%rbp)
    movq	%rcx, -24(%rbp)
    movq	%r8, -32(%rbp)
    nop
    popq	%rbp
    ret
    .globl	bar
bar:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$56, %rsp
    movq	%rdi, -40(%rbp)
    movl	%esi, -44(%rbp)
    movl	%edx, -48(%rbp)
    movl	%ecx, -52(%rbp)
    movl	%r8d, -56(%rbp)
    movq	-40(%rbp), %rax
    movl	(%rax), %eax
    cmpl	-44(%rbp), %eax
    jne	L47
    movq	-40(%rbp), %rax
    movl	4(%rax), %eax
    cmpl	-48(%rbp), %eax
    je	L49
L47:
    movl	-52(%rbp), %eax
    movl	%eax, -24(%rbp)
    movl	-56(%rbp), %eax
    movl	%eax, -20(%rbp)
    movq	-40(%rbp), %rax
    movl	16(%rax), %eax
    movl	%eax, -16(%rbp)
    movq	-40(%rbp), %rax
    movl	20(%rax), %eax
    movl	%eax, -12(%rbp)
    leaq	-56(%rbp), %rcx
    leaq	-52(%rbp), %rdx
    movq	-40(%rbp), %rax
    movq	%rcx, %r8
    movq	%rdx, %rcx
    movl	$0, %edx
    movl	$0, %esi
    movq	%rax, %rdi
    call	foo
    movl	-52(%rbp), %eax
    movl	-24(%rbp), %edx
    subl	%eax, %edx
    movl	%edx, %eax
    vxorpd	%xmm1, %xmm1, %xmm1
    vcvtsi2sd	%eax, %xmm1, %xmm1
    vxorpd	%xmm0, %xmm0, %xmm0
    vcvtsi2sd	-16(%rbp), %xmm0, %xmm0
    vmulsd	%xmm0, %xmm1, %xmm0
    vmovsd	LC0(%rip), %xmm1
    vdivsd	%xmm1, %xmm0, %xmm0
    vcvttsd2si	%xmm0, %eax
    movl	%eax, -8(%rbp)
    movl	-56(%rbp), %eax
    movl	-20(%rbp), %edx
    subl	%eax, %edx
    movl	%edx, %eax
    vxorpd	%xmm1, %xmm1, %xmm1
    vcvtsi2sd	%eax, %xmm1, %xmm1
    vxorpd	%xmm0, %xmm0, %xmm0
    vcvtsi2sd	-12(%rbp), %xmm0, %xmm0
    vmulsd	%xmm0, %xmm1, %xmm0
    vmovsd	LC0(%rip), %xmm1
    vdivsd	%xmm1, %xmm0, %xmm0
    vcvttsd2si	%xmm0, %eax
    movl	%eax, -4(%rbp)
    movl	-8(%rbp), %eax
    addl	%eax, -44(%rbp)
    movl	-4(%rbp), %eax
    addl	%eax, -48(%rbp)
    movq	-40(%rbp), %rax
    movl	-44(%rbp), %edx
    movl	%edx, (%rax)
    movq	-40(%rbp), %rax
    movl	-48(%rbp), %edx
    movl	%edx, 4(%rax)
    movl	-52(%rbp), %edx
    movq	-40(%rbp), %rax
    movl	%edx, 8(%rax)
    movl	-56(%rbp), %edx
    movq	-40(%rbp), %rax
    movl	%edx, 12(%rax)
L49:
    nop
    leave
    ret
    .globl	main
.globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$32, %rsp
    movq	$40, %rax
    movq	%rax, -8(%rbp)
    xorl	%eax, %eax
    movl	$100, -32(%rbp)
    movl	$110, -28(%rbp)
    movl	$20, -24(%rbp)
    movl	$30, -20(%rbp)
    movl	$-1, -16(%rbp)
    movl	$-1, -12(%rbp)
    leaq	-32(%rbp), %rax
    movl	$70, %r8d
    movl	$50, %ecx
    movl	$420, %edx
    movl	$400, %esi
    movq	%rax, %rdi
    call	bar
    movl	-20(%rbp), %eax
    cmpl	$70, %eax
    je	L51
    call	abort
L51:
    movl	$0, %edi
    call	exit
    .section	.rodata
LC0:
    .long	0
    .long	1073741824