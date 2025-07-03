.section .data
  .globl str
str:
  .asciiz "OVO je TeST 123"
  .globl res
res:
  .space 50

.section .text
  .globl main
main:
  lui $t0, %hi(str)
  ori $t0, $t0, %lo(str)
  lui $t1, %hi(res)
  ori $t1, $t1, %lo(res)

petlja:
  lb $t2, ($t0)
  beq $t2, $0, kraj

  li $t3, 'A'
  li $t4, 'Z'

  slt $t5, $t2, $t3
  bne $t5, $0, skip

  slt $t5, $t4, $t2
  bne $t5, $0, skip

  addiu $t2, $t2, 32

skip:
  sb $t2, ($t1)
  addiu $t0, $t0, 1
  addiu $t1, $t1, 1
  j petlja

kraj:
  sb $zero, ($t1)
  jr $ra




