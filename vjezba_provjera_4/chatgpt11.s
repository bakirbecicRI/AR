.section .text
  .globl min_positive
min_positive:
  li $t0, -1
  mtc1 $t0, $f4
  cvt.s.w $f4, $f4
  li $t0, 0
  mtc1 $t0, $f6
  cvt.s.w $f6, $f6
  addi $t0, $0, 0
  move $t2, $a0

petlja:
  slt $t1, $t0, $a1
  beq $t1, $0, out
  sll $t3, $t0, 2
  add $t4, $t3, $t2
  lwc1 $f5, 0($t4)
  c.lt.s $f6, $f5
  bc1f continue
  c.lt.s $f4, $f6
  bc1t if
  c.lt.s $f5, $f4
  bc1t if

continue:
  addi $t0, $t0, 1
  j petlja

if:
  mov.s $f4, $f5
  addi $t0, $t0, 1
  j petlja

out:
  mov.s $f0, $f4
  jr $ra
