.section .data
d:
  .double 10.25

.section .text
  .globl foo
foo:
  slt $t0, $a0, $0
  bne $t0, $0, ret1
  mtc1 $a2, $f6
  mtc1 $a3, $f7
  li $t0, 0
  mtc1 $t0, $f4
  mtc1 $t0, $f5
  c.lt.d $f6, $f4
  bc1f end

ret1:
  slt $t0, $a0, 0
  bne $t0, $0, abs1
cont:
  c.lt.d $f6, $f4
  bc1t abs2
cont2:
  mfc1 $a2, $f6
  mfc1 $a3, $f7
  addiu $sp, $sp, -32
  sw $ra, 28($sp)
  s.d $f4, 16($sp)
  jal foo
  lw $f4, 16($sp)
  lw $ra, 28($sp)
  addiu $sp, $sp, 32
  la $t0, d
  ldc1 $f8, ($t0)
  sub.d $f0, $f8, $f0
  jr $ra

abs1:
  sub $a0, $0, $a0
  j cont
  
abs2:
  sub.d $f6, $f4, $f6
  j cont2

end:
  add.d $f0, $f4, $f4
  jr $ra
