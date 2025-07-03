.section .data
epsilon:
  .double 1.0e-6

.section .text
.global foo
foo:
  # f14 = f1 (float), f12 = d1 (double), $a3 = f2 (float)
  mtc1 $a3, $f6            # f6 = f2

  la $t0, epsilon
  ldc1 $f16, ($t0)         # f16 = epsilon

  addiu $t0, $0, 3
  mtc1 $t0, $f8
  cvt.d.w $f8, $f8         # f8 = 3.0

  addiu $t0, $0, 0
  mtc1 $t0, $f10
  cvt.d.w $f10, $f10       # f10 = 0.0

  cvt.d.s $f2, $f14        # f2 = f1 kao double
  cvt.d.s $f4, $f6         # f4 = f2 kao double

  # if d1 > f2
  sub.d $f0, $f12, $f4
  c.lt.d $f0, $f16         # ako (d1 - f2) < epsilon, idi dalje
  bc1t outif1

  add.s $f0, $f14, $f6     # f1 + f2
  cvt.d.s $f0, $f0
  sub.d $f0, $f0, $f12     # (f1 + f2 - d1)
  div.d $f0, $f0, $f8      # / 3.0
  trunc.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra

outif1:
  # if d1 == f2
  sub.d $f0, $f12, $f4
  abs.d $f0, $f0
  c.lt.d $f0, $f16         # |d1 - f2| < epsilon ?
  bc1f outif2

  # if d1 != f1
  sub.d $f0, $f12, $f2
  abs.d $f0, $f0
  c.lt.d $f0, $f16
  bc1t outif2

  # if d1 != 0
  sub.d $f0, $f12, $f10
  abs.d $f0, $f0
  c.lt.d $f0, $f16
  bc1t outif2

  mul.d $f0, $f2, $f8      # f1 * 3.0
  div.d $f0, $f0, $f12     # / d1
  trunc.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra

outif2:
  # if f2 > d1
  sub.d $f0, $f4, $f12
  c.lt.d $f0, $f16
  bc1t outif3

  # if d1 == f1
  sub.d $f0, $f12, $f2
  abs.d $f0, $f0
  c.lt.d $f0, $f16
  bc1f outif3

  # if f1 != 0
  sub.d $f0, $f2, $f10
  abs.d $f0, $f0
  c.lt.d $f0, $f16
  bc1t outif3

  sub.d $f0, $f12, $f4     # d1 - f2
  abs.d $f0, $f0
  div.d $f0, $f0, $f2      # / f1
  trunc.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra

outif3:
  addiu $t0, $0, 12
  mtc1 $t0, $f8
  cvt.d.w $f8, $f8         # f8 = 12.0

  mul.s $f0, $f14, $f6     # f1 * f2
  cvt.d.s $f0, $f0
  mul.d $f2, $f12, $f8     # d1 * 12.0
  sub.d $f0, $f0, $f2
  trunc.w.d $f0, $f0
  mfc1 $v0, $f0
  jr $ra

