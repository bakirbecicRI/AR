.section .text
.global main
main:
  addiu $t0, $0, 100
  ori $t1, $0, 40000;
  add $t2, $t0, $t1
  lui $t3, 0xffff
  ori $t3, $t3, 0xffff
  add $t4, $t2, $t3

  addiu $v0, $0, 0
  jr $ra
