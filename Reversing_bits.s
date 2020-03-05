addi a0, x0, 28 #argument
addi t1, x0, -1
add a3, x0, a0
addi a4, x0, 1
addi a5, x0, 0

jal ra, clz #count leading zeros
addi t0, a0, -32
mul t0, t0, t1
add t2, t0, x0
addi t0, t0, -1

jal ra, reverse
andi a0, x0, 0
add a0, x0, a6
exit: beq x0, x0, exit

clz:
srli a1, a0, 1
or a0, a0, a1
srli a1, a0, 2
or a0, a0, a1
srli a1, a0, 4
or a0, a0, a1
srli a1, a0, 8
or a0, a0, a1
srli a1, a0, 16
or a0, a0, a1
not a0, a0
srli a1, a0, 1
lui a2, 349525
addi a2, a2, 1365
and a1, a1, a2
sub a0, a0, a1
lui a1, 209715
addi a1, a1, 819
and a2, a0, a1
srli a0, a0, 2
and a0, a0, a1
add a0, a0, a2
srli a1, a0, 4
add a0, a0, a1
lui a1, 61681
addi a1, a1, -241
and a0, a0, a1
lui a1, 4112
addi a1, a1, 257
mul a0, a0, a1
srli a0, a0, 24
jalr x0, 0(ra)

reverse:
again: and a5, a3, a4
sll a5, a5, t0
or a6, a6, a5
and a5, a5, x0
srli a3, a3, 1
addi t2, t2, -1
addi t0, t0, -1
bne t2, x0, again
jalr x0, 0(ra)