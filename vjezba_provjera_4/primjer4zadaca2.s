.section .rodata
  .globl threehalfs
threehalfs:
  .float 1.5
.section .data
  .globl f
f:
  .float 0.5
.section .bss
y:
  .space 4
  .section .text
  .globl Q_rsqrt
Q_rsqrt:
    #x2-$f4
    #y-$f5
  la $t0, f
  l.s $f5, ($t0)
  mul.s $f4, $f5, $f12
  la $t0, y
  s.s $f12, ($t0)
  lw $t1, ($t0)
  srl $t1, $t1, 1
  lui $t0, 0x5f37
  ori $t0, $t0, 0x59df
  sub $t1, $t0, $t1
  la $t0, y
  sw $t1, ($t0)
  l.s $f5, ($t0)
  mul.s $f7, $f4, $f5
  mul.s $f7, $f7, $f5
  la $t0, threehalfs
  lwc1 $f8, ($t0)
  sub.s $f7, $f8, $f7
  mul.s $f0, $f5, $f7

  jr $ra
  




