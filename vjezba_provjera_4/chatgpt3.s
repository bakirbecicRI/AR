.section .text
  .globl Q_rsqrt
Q_rsqrt:
  mfc1 $t0, $f12
  # #t0-long bits
  lui $t1, 0x8000
  ori $t1, $t1, 0x0000
  xor $t0, $t0, $t1
  lui $t1, 0x7F80
  ori $t1, $t1, 0x0000
  and $t2, $t0, $t1
  # $t2-long exponent
  srl $t3, $t2, 1
  # $t3-half exponent
  sub $t0, $t0, $t3
  mtc1 $t0, $f0
  jr $ra

