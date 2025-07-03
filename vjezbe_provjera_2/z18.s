.section .data
  .globl niz
niz:
  .word 5, 8, 3, 12, 7, 4, 9, 10
  .globl duzina
duzina:
  .word 8

.globl suma_parnih
suma_parnih:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  lui $t9, %hi(duzina)
  ori $t9, $t9, %lo(duzina)
  lw $t9, ($t9)
  addiu $t1, $0, 0
  addiu $t8, $0, 0 #brojac
  addiu $t7, $0, 0 #suma_parnih

petlja:
  lw $t3, ($t0)
  slt $t2, $t8, $t9
  beq $t2, $0, kraj
  addiu $t0, $t0, 4
  addiu $t8, $t8, 1
  andi $t5, $t3, 1
  beq $t5, $0, parni
  j petlja

parni:
  add $t7, $t7, $t3
  j petlja

kraj:
  lui $t0, %hi(suma_parnih)
  ori $t0, $t0, %lo(suma_parnih)
  sw $t7, ($t0)
  addiu $v0, $0, 0
  jr $ra




