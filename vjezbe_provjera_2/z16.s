.section .data
  .globl tekst
  .align 0
tekst:
  .asciiz "Imam 2 jabuke i 3 banane."

.globl broj_cifara
.align 2
broj_cifara:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(tekst)
  ori $t0, $t0, %lo(tekst)
  addiu $t2, $0, 0 #brojac cifara

petlja:
  lb $t1, ($t0)
  beq $t1, $0, kraj
  li $t5, 58       # ASCII '9' + 1
  li $t6, 47       # ASCII '0' - 1

  slt $t3, $t1, $t5
  beq $t3, $zero, preskoci
  slt $t3, $t6, $t1
  beq $t3, $zero, preskoci

  addiu $t2, $t2, 1

preskoci:
  addiu $t0, $t0, 1
  j petlja

kraj:
  lui $t0, %hi(broj_cifara)
  ori $t0, $t0, %lo(broj_cifara)
  sw $t2, ($t0)
  addiu $v0, $0, 0
  jr $ra

