.section .text
  .globl Q_inv
Q_inv:
  mov.s $f10, $f12
  mfc1 $t0, $f12
  li $t1, 0x7EEEEBB3
  sub $t0, $t1, $t0
  mtc1 $t0, $f6
  li $t3, 2
  mtc1 $t3, $f8
  cvt.s.w $f8, $f8
  mul.s $f4, $f6, $f10
  sub.s $f4, $f8, $f4
  mul.s $f0, $f4, $f6
  jr $ra
