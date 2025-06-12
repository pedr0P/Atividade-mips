.data
vec   : .word   10, 9, 8, 7, 6, 5, 4, 3, 2, 1
#vec   : .word   9, 8, 90, 4, 8, 101, 3, 1, 7, 5,
#vec   : .word  1, 2, 3, 4, 5, 6, 7, 8, 9, 10
sep   : .asciiz " "
n_line: .asciiz "\n"

.text
.globl main

main:
    la  $t0, vec
    la  $t3, vec
    la  $t1, 0($t0)
    la  $t2, 4($t1)

    jal Print_vec

    ### New line
    li $v0, 4
    la $a0, n_line
    syscall

    jal Sort

    j Exit

Print_vec:
    # Last spot of memory
    la  $s7, 40($t3)

    # Print vec[n]
    li $v0, 1
    lw $a0, ($t0)
    syscall

    # Print "sep"
    li $v0, 4

    # Move vec[n] to $a0
    move $a1, $a0
    la $a0, sep
    syscall

    # Move vec[n] back to $a1
    move $a0, $a1

    addi $t0, $t0, 4


    bne $t0, $s7, Print_vec
    la  $t0, vec
    jr $ra

Sort:
    # Last spot of memory
    lw  $s7, 36($t0)

    lw  $s1, ($t1)
    lw  $s2, ($t2)
    sgt $s0, $s1, $s2
    beq $s0, 1, Swap

    seq $s0, $s2, $s7
    beq $s0, 1, Sort_2

    addi $t2, $t2, 4

    j Sort
Sort_2:
    la  $s6, -4($t2)
    seq $s0, $t1, $s6 
    beq $s0, 1, Print_vec

    addi $t1, $t1, 4
    la   $t2, 4($t1)

    j Sort

Swap:
    lw $a1, ($t1)
    lw $a2, ($t2)
    sw $a1, ($t2)
    sw $a2, ($t1)

    j Sort

Exit:
    li $v0, 10
    syscall

