.section .text
.global main
main:
 addiu $t0, $0, 0xc000
 ori $t1, $0, 0xc000
  addiu $v0, $0, 0
  jr $ra
