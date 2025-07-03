  .section .data
one_point_five:
  .double 1.5

  .section .text
  .globl test
test:
  beq $a0, $0, return1
  li $t0, 3
  div $a0, $t0
  mfhi $t0
  beq $t0, $0, return2
  li $t0, 10
  mtc1 $t0, $f8
  cvt.d.w $f8, $f8
  mtc1 $a2, $f6
  mtc1 $a3, $f7
  c.lt.d $f8, $f6
  bc1t return3
  li $t0, 1
  mtc1 $t0, $f12
  cvt.d.w $f12, $f12
  mtc1 $a0, $f8
  cvt.d.w $f8, $f8
  mul.d $f0, $f8, $f12
  add.d $f0, $f0, $f6
  jr $ra

return1:
  mtc1 $a2, $f6
  mtc1 $a3, $f7
  la $t0, one_point_five
  ldc1 $f8, ($t0)
  add.d $f0, $f6, $f8
  jr $ra

return2:
  li $t0, 2
  mtc1 $t0, $f8
  cvt.d.w $f8, $f8
  mtc1 $a2, $f6
  mtc1 $a3, $f7
  mtc1 $a0, $f12
  cvt.d.w $f12, $f12
  div.d $f0, $f6, $f8
  add.d $f0, $f0, $f12
  jr $ra

return3:
  mtc1 $a0, $f12
  cvt.d.w $f12, $f12
  sub.d $f0, $f6, $f12
  jr $ra
