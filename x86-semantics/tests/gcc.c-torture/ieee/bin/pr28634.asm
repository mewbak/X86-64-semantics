x:
    .long	0
    .long	-1019215872
y:
    .long	0
    .long	1072693248
    .globl _start
_start:
    pushq	%rbp
    movq	%rsp, %rbp
    jmp	L2
L3:
    movq $y(%rip), %rdx
    movq $x(%rip), %rax
    vmovq	%rdx, %xmm1
    vmovq	%rax, %xmm2
    vaddsd	%xmm2, %xmm1, %xmm0
    vmovq	%xmm0, %rax
    movq	%rax, $y(%rip)
L2:
    movq $y(%rip), %rax
    movl	$0, %edx
    vmovq	%rax, %xmm3
    vmovq	%rdx, %xmm4
    vucomisd	%xmm4, %xmm3
    ja	L3
    movq $x(%rip), %rdx
    movabsq	$4607182418800017408, %rax
    vmovq	%rdx, %xmm6
    vmovq	%rax, %xmm7
    vaddsd	%xmm7, %xmm6, %xmm5
    vmovq	%xmm5, %rax
    movq $y(%rip), %rdx
    vmovq	%rax, %xmm0
    vmovq	%rdx, %xmm1
    vucomisd	%xmm1, %xmm0
    jp	L6
    vmovq	%rax, %xmm2
    vmovq	%rdx, %xmm3
    vucomisd	%xmm3, %xmm2
    je	L7
L6:
    call	abort
L7:
    movl	$0, %edi
    call	exit