.section .text
  .globl calculateAmount
  calculateAmount:
  addiu $sp, $sp, -32
  sw $ra, 28($sp)
  s.d $f12, 16($sp)
  #u f12 je vec price tako da pozivamo
  jal getTick
  #vraca double u f0/f1
  li $t0, 1
  #pripremamo drugi argument
  cvt.w.d $f4, $f0
  mfc1 $t2, $f4
  div $t0, $t2
  mflo $a1
  #pripremili drugi argument
  pripremimo prvi
  addiu $a0, $sp, 16
  #i idemo u funkciju
  jal roundToTick
  lw $ra, 28($sp)
  l.d $f0, 16($sp)
  mtc1 $a2, $f10
  cvt.d.w $f10, $f10
  mul.d $f0, $f0, $f10
  jr $ra




