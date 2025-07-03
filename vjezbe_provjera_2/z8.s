.section .data
  .globl niz
  .align 2
niz:
  .word 6, 4, 15, 9, 10, 18, 5, 21, 11, 30

.globl suma_djeljivih_sa_3
  .align 2
suma_djeljivih_sa_3:
  .word 0
.section .text
  .globl main
main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  addiu $t1, $0, 0 #brojac
  addiu $t6, $0, 0 #sumator za djeljive sa 3
  li $t9, 3

petlja:
  addiu $t7, $0, 0
  slti $t2, $t1, 10
  beq $t2, $0, kraj
  sll $t3, $t1, 2
  add $t4, $t3, $t0
  lw $t4, ($t4)
  addiu $t1, $t1, 1
  addiu $t7, $t4, 0
  div $t4, $t9
  mfhi $t5
  beq $t5, $0, djeljiv_sa_3
  j petlja

djeljiv_sa_3:
  add $t6, $t6, $t7
  j petlja

kraj:
  lui $t0, %hi(suma_djeljivih_sa_3)
  ori $t0, $t0, %lo(suma_djeljivih_sa_3)
  sw $t6, ($t0)
  addiu $v0, $0, 0
  jr $ra

