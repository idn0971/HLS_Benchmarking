li t0 4
li t1 4
beq t0, t1, branch
li s6 1
jal end
branch:
li s6 2
end:
