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
    .globl	test1
test1:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	$3, -8(%rbp)
    movl	$2, -4(%rbp)
    movl	-8(%rbp), %eax
    cmpl	-4(%rbp), %eax
    jge	L46
    movl	-8(%rbp), %eax
    leal	1(%rax), %edx
    movl	%edx, -8(%rbp)
    cmpl	$2, %eax
    setne	%al
    jmp	L47
L46:
    movl	-4(%rbp), %eax
    leal	1(%rax), %edx
    movl	%edx, -4(%rbp)
    cmpl	$2, %eax
    setne	%al
L47:
    testb	%al, %al
    je	L48
    call	abort
L48:
    cmpl	$3, -8(%rbp)
    je	L49
    call	abort
L49:
    cmpl	$3, -4(%rbp)
    je	L51
    call	abort
L51:
    nop
    leave
    ret
    .globl	test2
test2:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	$3, -12(%rbp)
    movl	$2, -8(%rbp)
    movl	-12(%rbp), %eax
    cmpl	-8(%rbp), %eax
    jge	L53
    movl	-12(%rbp), %eax
    leal	1(%rax), %edx
    movl	%edx, -12(%rbp)
    jmp	L54
L53:
    movl	-8(%rbp), %eax
    leal	1(%rax), %edx
    movl	%edx, -8(%rbp)
L54:
    movl	%eax, -4(%rbp)
    cmpl	$2, -4(%rbp)
    je	L55
    call	abort
L55:
    cmpl	$3, -12(%rbp)
    je	L56
    call	abort
L56:
    cmpl	$3, -8(%rbp)
    je	L58
    call	abort
L58:
    nop
    leave
    ret
    .globl	test3
test3:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	$3, -16(%rbp)
    movl	$2, -12(%rbp)
    movl	$3, -8(%rbp)
    movl	$2, -4(%rbp)
    movl	-8(%rbp), %eax
    cmpl	-4(%rbp), %eax
    jge	L60
    movl	-16(%rbp), %eax
    leal	1(%rax), %edx
    movl	%edx, -16(%rbp)
    cmpl	$2, %eax
    setne	%al
    jmp	L61
L60:
    movl	-12(%rbp), %eax
    leal	1(%rax), %edx
    movl	%edx, -12(%rbp)
    cmpl	$2, %eax
    setne	%al
L61:
    testb	%al, %al
    je	L62
    call	abort
L62:
    cmpl	$3, -16(%rbp)
    je	L63
    call	abort
L63:
    cmpl	$3, -12(%rbp)
    je	L65
    call	abort
L65:
    nop
    leave
    ret
    .comm	x,4,4
    .comm	y,4,4
init_xy:
    pushq	%rbp
    movq	%rsp, %rbp
    movl	$3, x(%rip)
    movl	$2, y(%rip)
    nop
    popq	%rbp
    ret
    .globl	test4
test4:
    pushq	%rbp
    movq	%rsp, %rbp
    call	init_xy
    movl	x(%rip), %edx
    movl	y(%rip), %eax
    cmpl	%eax, %edx
    jge	L68
    movl	x(%rip), %eax
    leal	1(%rax), %edx
    movl	%edx, x(%rip)
    cmpl	$2, %eax
    setne	%al
    jmp	L69
L68:
    movl	y(%rip), %eax
    leal	1(%rax), %edx
    movl	%edx, y(%rip)
    cmpl	$2, %eax
    setne	%al
L69:
    testb	%al, %al
    je	L70
    call	abort
L70:
    movl	x(%rip), %eax
    cmpl	$3, %eax
    je	L71
    call	abort
L71:
    movl	y(%rip), %eax
    cmpl	$3, %eax
    je	L73
    call	abort
L73:
    nop
    popq	%rbp
    ret
    .globl	test5
test5:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    call	init_xy
    movl	x(%rip), %edx
    movl	y(%rip), %eax
    cmpl	%eax, %edx
    jge	L75
    movl	x(%rip), %eax
    leal	1(%rax), %edx
    movl	%edx, x(%rip)
    jmp	L76
L75:
    movl	y(%rip), %eax
    leal	1(%rax), %edx
    movl	%edx, y(%rip)
L76:
    movl	%eax, -4(%rbp)
    cmpl	$2, -4(%rbp)
    je	L77
    call	abort
L77:
    movl	x(%rip), %eax
    cmpl	$3, %eax
    je	L78
    call	abort
L78:
    movl	y(%rip), %eax
    cmpl	$3, %eax
    je	L80
    call	abort
L80:
    nop
    leave
    ret
    .globl	test6
test6:
    pushq	%rbp
    movq	%rsp, %rbp
    subq	$16, %rsp
    movl	$3, -12(%rbp)
    movl	$2, -8(%rbp)
    call	init_xy
    movl	y(%rip), %eax
    cmpl	%eax, -12(%rbp)
    jge	L82
    movl	x(%rip), %eax
    leal	1(%rax), %edx
    movl	%edx, x(%rip)
    jmp	L83
L82:
    movl	y(%rip), %eax
    leal	1(%rax), %edx
    movl	%edx, y(%rip)
L83:
    movl	%eax, -4(%rbp)
    cmpl	$2, -4(%rbp)
    je	L84
    call	abort
L84:
    movl	x(%rip), %eax
    cmpl	$3, %eax
    je	L85
    call	abort
L85:
    movl	y(%rip), %eax
    cmpl	$3, %eax
    je	L87
    call	abort
L87:
    nop
    leave
    ret
    .globl	main
.globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    call	test1
    call	test2
    call	test3
    call	test4
    call	test5
    call	test6
    movl	$0, %edi
    call	exit