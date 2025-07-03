.section .text
  .globl average
average:
  li $t0, 0
  mtc1 $t0, $f4
  cvt.s.w $f4, $f4

  addi $t1, $0, 0
  move $t2, $a0
petlja:
  slt $t3, $t1, $a1
  beq $t3, $0, out
  sll $t4, $t1, 2
  add $t5, $t2, $t4
  lwc1 $f6, ($t5)
  add.s $f4, $f4, $f6
  addi $t1, $t1, 1
  j petlja
out:
  mtc1 $a1, $f5
  cvt.s.w $f5, $f5
  div.s $f0, $f4, $f5
  jr $ra

