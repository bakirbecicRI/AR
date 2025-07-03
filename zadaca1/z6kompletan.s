.section .text
  .globl exchange
exchange:
  move $t0, $a1
  lh $t1, ($a0)
  sh $t0, ($a0)
  move $v0, $t1
  jr $ra
