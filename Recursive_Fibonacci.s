addi a0, x0, 6
jal ra, fib
and a0, a0, x0
add a0, a1, x0
exit: beq x0, x0, exit

fib:
slti t0, a0, 2
add a1, a0, x0
beq t0, x0, else
jalr x0, 0(ra)

else:
addi sp, sp, -12
sw ra, 0(sp)
sw a0, 4(sp)
addi a0, a0, -1 #n-1
jal ra, fib
lw a0, 4(sp)
sw a1, 8(sp)  #a1 is ret value
addi a0, a0, -2 #n-2
jal ra, fib
lw t0, 8(sp)
add a1, a1, t0
lw ra, 0(sp)
addi sp, sp, 12
jalr x0, 0(ra)








