  .section .bss
res:
  .space 4

  .section .text
  .globl Q_fabs
Q_fabs:
  la $t0, res
  s.s $f12, ($t0)
  lw $t1, ($t0)
  lui $t2, 0x7FFF
  ori $t2, $t2, 0xFFFF
  and $t1, $t1, $t2
  sw $t1, ($t0)
  lwc1 $f0, ($t0) # ili l.s
  jr $ra
