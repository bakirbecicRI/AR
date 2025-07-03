.section .text
  .globl foo
foo:
  mtc1 $a3, $f8
  cvt.d.s $f8, $f8
  c.lt.d $f8, $f12
  bc1t ret1
  c.eq.d $f12, $f8
  bc1f else
  c.eq.d $f12, $f14
  bc1t else
  li $t0, 0
  mtc1 $t0, $f8
  cvt.d.w $f8, $f8
  c.eq.d $f12, $f8
  bc1t else
  li $t0, 3
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  cvt.d.s $f14, $f14
  mul.d $f0, $f14, $f4
  div.d $f0, $f0, $f12
  cvt.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra
 
ret1:
  cvt.d.s $f14, $f14
  add.d $f0, $f14, $f8
  sub.d $f0, $f0, $f12
  li $t0, 3
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  div.d $f0, $f0, $f4
  cvt.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra

else:
  addi $v0, $0, 0
  jr $ra
