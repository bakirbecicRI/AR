.section .data
  .globl ulaz
ulaz:
  .asciiz "a1b2c3D4e5"
  .globl cifre
cifre:
  .space 100

.section .text
  .globl main
main:
  lui $t0, %hi(ulaz)
  ori $t0, $t0, %lo(ulaz)
  lui $t3, %hi(cifre)
  ori $t3, $t3, %lo(cifre)

petlja:
  lb $t1, ($t0)
  beq $t1, $0, kraj
  slti $t2, $t1, '0'
  bne $t2, $0, skip
  li $t5, '9'
  slt $t2, $t5, $t1
  bne $t2, $0, skip
  addiu $t0, $t0, 1
  sb $t1, ($t3)
  addiu $t3, $t3, 1
  j petlja

skip:
  addiu $t0, $t0, 1
  j petlja

kraj:
  sb $0, ($t3)
  li $v0, 0
  jr $ra
