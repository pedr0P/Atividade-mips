.data
vec   : .word   10, 9, 8, 7, 6, 5, 4, 3, 2, 1
sep   : .asciiz " "
n_line: .asciiz "\n"

.text
.globl main

main:
    # Show the vector before
    la  $t0, vec
    lw  $t1, 36($t0)
    jal Print_vec

    # New line
    li $v0, 4
    la $a0, n_line
    syscall

    # Prepare to sort
    la  $t0, vec
    lw  $t3, 36($t0)
    # Sort loop
    jal Sort

    j Exit

Sort:
    lw $t1, 0($t0)
    lw $t2, 4($t0)

    sgt $t9, $t1, $t2
    beq $t9, 1, Swap
    
Swap:
    move 0($t0)
    
Print_vec:
    # Print vec[n]
    li $v0, 1
    lw $a0, 0($t0)
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

    bne $a0, $t1, Print_vec
    jr $ra

Exit:
    li $v0, 10
    syscall
