.section .text
.globl main
main:
  addiu $t0, $0, 7
  ori $t1, $0, 12

  addiu $v0, $0, 0
  jr $ra
