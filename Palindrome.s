.data
str: .asciiz "wow"
.text
la a0, str
la a1, str
jal ra, checklength
exit: beq x0, x0, exit

checklength:
lb t0, 0(a1)
beq t0, x0, end
addi a1, a1, 1
j checklength

end:
addi a1, a1, -1


palin_test:
bge a0, a1, true
lb t1, 0(a0)
lb t2, 0(a1)
bne t1, t2, false
addi a1, a1, -1
addi a0, a0, 1
j palin_test

true:
and a0, x0, a0
addi a0, x0, 1
jalr x0, 0(ra)

false:
and a0, x0, a0
addi a0, x0, 0
jalr x0, 0(ra)

