.section .text
.globl main
main:
  lui $t0, 0x7fff
  ori $t0, $t0, 0xfff0
  addiu $t0, $t0, 20

  addiu $v0, $0, 0
  jr $ra

