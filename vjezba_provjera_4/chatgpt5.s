.section .text
  .globl ln_approx
ln_approx:
  li $t0, -2
  mtc1 $t0, $f4
  cvt.s.w $f4, $f4
  c.lt.s $f12, $f4
  bc1t ret1
  addi $t0, $0, 1
  #upcast
  #term=x;
  mov.s $f6, $f12
  mtc1 $t0, $f9
  cvt.s.w $f9, $f9
  # t0-sign
  addi $t1, $0, 1
  # t1-brojac
  li $t3, 0
  mtc1 $t3, $f8
  cvt.s.w $f8, $f8
  li $t7, 0
  mtc1 $t7, $f11
  cvt.s.w $f11, $f11

petlja:
  slt $t2, $t1, $a1
  beq $t2, $0, out
  mul.s $f10, $f9, $f6
  move $t5, $t1
  mtc1 $t5, $f7
  cvt.s.w $f7, $f7
  div.s $f10, $f10, $f7
  add.s $f8, $f8, $f10
  mul.s $f6, $f6, $f12
  sub.s $f9, $f11, $f9
  addi $t1, $t1, 1
  j petlja8
out:

  mov.s $f0, $f8
  jr $ra




ret1:
  li $t0, 0
  mtc1 $t0, $f5
  cvt.s.w $f0, $f5
  jr $ra 


