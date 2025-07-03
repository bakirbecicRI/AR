  .section .data
   float
float:
  .float 0.5
  .section .rodata
threehalfs:
  .float 1.5

  .section .text
  .globl inverse_sqrt_iterative
inverse_sqrt_iterative:
  li $t0, 1
  mtc1 $t0, $f4
  cvt.s.w $f4, $f4
  c.lt.s $f12 $f4
  bc1f continue
  li $t0, 0
  mtc1 $t0, $f4
  cvt.s.w $f4, $f4

continue:
  la $t0, float
  lwc1 $f4, ($t0)
  mul.s $f5, $f12, $f4
  # $f5-x2
  mov.s $f6, $f12
  # $f6-y
  mfc1 $t0, $f6
  lui $t1, 0x5f37
  ori $t1, $t1, 0x59df
  srl $t2, $t0, 1
  sub $t0, $t1, $t2
  mtc1 $t0, $f6
  li $t0, 0
  mtc1 $t0, $f1
  cvt.s.w $f1, $f1 
  
loop:
  mov.s $f8, $f6
  la $t0, threehalfs
  l.s $f10, ($t0)
  mul.s $f3, $f6, $f6
  mul.s $f3, $f3, $f5
  sub.s $f3, $f10, $f3
  mul.s $f6, $f6, $f3

  sub.s $f13, $f8, $f6
  c.lt.s $f13, $f1 
  bc1t abs
loop_kont:
  c.lt.s $f14, $f13
  bc1f end
  j loop

abs:
  sub.s $f13, $f1, $f13
  j loop_kont

end:
  mov.s $f0, $f6
  jr $ra

