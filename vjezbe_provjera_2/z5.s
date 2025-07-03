.section .data
  .globl niz
  .align 2
niz:
  .word 2,-4,7,-1,0,-13,9,-8,5,-2
  .globl zbir_negativnih
  .align 2
zbir_negativnih:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  addiu $t1, $0, 0 #brojac
  addiu $t8, $0, 0 #zbir_negativnih

petlja:
  slti $t2, $t1, 10
  beq $t2, $0, kraj
  sll $t3, $t1, 2
  add $t4, $t0, $t3
  lw $t5, ($t4)
  slti $t6, $t5, 0
  bne $t6, $0, sum
  addiu $t1, $t1, 1
  j petlja
sum:
  add $t8, $t8, $t5
  addiu $t1, $t1, 1
  j petlja
  
kraj:
  lui $t0, %hi(zbir_negativnih)
  ori $t0, $t0, %lo(zbir_negativnih)
  sw $t8, ($t0)
  addiu $v0, $0, 0
  jr $ra

