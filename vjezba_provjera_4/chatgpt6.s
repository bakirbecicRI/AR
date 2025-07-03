.section .text
  .globl mymax
mymax:
  addi $t0, $0, 0
  # brojac-$t0

petlja:
  slt $t1, $t0, $a3
  beq $t1, $0, out
  # nums[i]
  ldc1 $f6, 0($a2)
  c.lt.d $f12, $f6
  bc1f continue
  mov.d $f12, $f6

continue:
  addi $t0, $t0, 1
  sll $t3, $t0, 3
  add $a2, $a2, $t3
  j petlja

out:
  mov.d $f0, $f12
  jr $ra

