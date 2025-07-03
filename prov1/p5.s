#((26567-567)&10)+34292
.section .text
.globl main
main:
  addiu $t0, $0, 26567
  addiu $t1, $0, -567
  add $t0, $t0, $t1
  andi $t1, $t0, 10 
  ori $t1, $t1, 34292


  addiu $v0, $0, 0
  jr $ra
