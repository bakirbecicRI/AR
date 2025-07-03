.section .data
  .globl niz
niz:
  .asciiz "hello world, assembly is cool!"
  .globl broj_samoglasnika
  .align 2
broj_samoglasnika:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  addiu $t3, $0, 0

petlja:
  lb $t1, ($t0)
  beq $t1, $0, kraj
  addiu $t0, $t0, 1
  li $t4, 'a'
  beq $t4, $t1, samoglasnik
  li $t4, 'e'
  beq $t4, $t1, samoglasnik
  li $t4, 'i'
  beq $t4, $t1, samoglasnik
  li $t4, 'o'
  beq $t4, $t1, samoglasnik
  li $t4, 'u'
  beq $t4, $t1, samoglasnik
  j petlja

samoglasnik:
  addiu $t3, $t3, 1
  j petlja

kraj:
  lui $t0, %hi(broj_samoglasnika)
  ori $t0, $t0, %lo(broj_samoglasnika)
  sw $t3, ($t0)
  addiu $v0, $0, 0
  jr $ra
