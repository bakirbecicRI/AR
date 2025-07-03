.section .rodata
  .globl niz
  .align 2
niz:
  .word 2,4,-34,8,10,11,3,10,9,16
.section .data
  .globl broj_parnih
  .align 2
broj_parnih:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  addiu $t1, $0, 0 #brojac
  addiu $t7, $0, 0 #brojac parnih

petlja:
  slti $t2, $t1, 10
  beq $t2, $0, kraj
  sll $t4, $t1, 2
  add $t3, $t0, $t4 
  lw $t5, ($t3) #ucitavamo element
  addiu $t1, $t1, 1 
  andi $t6, $t5, 1
  beq $t6, $0, summing
  j petlja

summing:
  addiu $t7, $t7, 1
  j petlja 

kraj:
  lui $t0, %hi(broj_parnih)
  ori $t0, $t0, %lo(broj_parnih)
  sw $t7, ($t0)
  addiu $v0, $0, 0
  jr $ra

