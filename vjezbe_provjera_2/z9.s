.section .data
  .globl niz
  .align 2
niz:
  .word 6,13,4,15,8,10,23,18,9,2

  .globl najmanji_neparni
  .align 2
najmanji_neparni:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  addiu $t1, $0, 0 #brojac
  addiu $t2, $t0, 0 #prvi elem, kao najmanji neparni

petlja:
  slti $t3, $t1, 10
  beq $t3, $0, kraj
  sll $t4, $t1, 2
  add $t5, $t4, $t0
  lw $t6, ($t5)
  addiu $t1, $t1, 1
  andi $t7, $t6, 1
  bne $t7, $0, provjera
  j petlja

provjera:
  slt $t8, $t6, $t2
  bne $t8, $0, najmanji
  j petlja

najmanji:
  move $t2, $t6
  j petlja

kraj:
  lui $t0, %hi(najmanji_neparni)
  ori $t0, $t0, %lo(najmanji_neparni)
  sw $t2, ($t0)
  addiu $v0, $0, 0
  jr $ra

