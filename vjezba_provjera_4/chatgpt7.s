.section .text
  .globl baz
baz:
  lwc1 $f4, ($a1)
  cvt.d.s $f4, $f4
  li $t0, 0
  mtc1 $t0, $f6
  cvt.d.w $f6, $f6
  c.eq.d $f6, $f4
  bc1t ret1
  mtc1 $a2, $f8
  add.s $f8, $f12, $f8
  mtc1 $a3, $f10
  cvt.s.w $f10, $f10
  c.lt.d $f8, $f10
  bc1t ret1
  c.eq.d $f4, $f6
  bc1f ret2
else:
  cvt.d.w $f12, $f12
  mul.d $f0, $f12, $f4
  add.d $f0, $f0, $f10
  mtc1 $a2, $f8
  cvt.d.s $f8, $f8
  add.d $f0, $f0, $f8
  jr $ra

ret1:
  cvt.d.s $f12, $f12
  mtc1 $a2, $f10
  cvt.d.s $f10, $f10
  mtc1 $a3, $f8
  cvt.d.w $f8, $f8
  mul.d $f0, $f8, $f10
  add.d $f0, $f0, $f12
  jr $ra
    
ret2:
  cvt.d.s $f12, $f12
  mtc1 $a2, $f10
  cvt.d.s $f10, $f10
  mtc1 $a3, $f8
  cvt.d.w $f8, $f8
  mul.d $f0, $f8, $f10
  sub.d $f0, $f12, $f0
  ldc1 $f6, 0($a1)
  div.d $f0, $f0, $f6
  jr $ra
