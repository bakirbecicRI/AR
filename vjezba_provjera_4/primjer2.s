.section .text
  .globl bar
bar:
  li $t0, 0
  mtc1 $t0, $f8
  mtc1 $t0, $f9
  mtc1 $a2, $f6
  mtc1 $a3, $f7
  c.lt.d $f6, $f8
  bc1f drugiif
  li $t0, -1
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  c.lt.d $f6, $f8
  bc1t fabs

kont:
  mtc1 $a0, $f12
  cvt.d.w $f12, $f12
  mul.d $f0, $f6, $f4
  add.d $f0, $f0, $f12
  jr $ra

fabs:
  sub.d $f6, $f8, $f6
  j kont

drugiif:
  li $t0, 2
  div $a0, $t0
  mfhi $t0
  beq $t0, $0, if
  j else
if:
  li $t0, 2
  mtc1 $t0, $f8
  cvt.d.w $f8, $f8
  mtc1 $a0, $f12
  cvt.d.w $f12, $f12
  div.d $f0, $f12, $f8
  add.d $f0, $f0, $f6
  jr $ra

else:
  mtc1 $a0, $f12
  cvt.d.w $f12, $f12
  sub.d $f0, $f6, $f12
  jr $ra


