.section .data
  .globl tekst
  .align 0
tekst:
  .asciiz "Imam 2 jabuke i 3 banane."

.globl broj_cifara
.align 2
zbir:
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
  li $t5, 58       
  li $t6, 47      

  slt $t3, $t1, $t5
  beq $t3, $zero, preskoci
  slt $t3, $t6, $t1
  beq $t3, $zero, preskoci

  addi $t1, $t1, -48
  add $t2, $t2, $t1
  
preskoci:
  addiu $t0, $t0, 1
  j petlja

kraj:
  lui $t0, %hi(zbir)
  ori $t0, $t0, %lo(zbir)
  sw $t2, ($t0)
  addiu $v0, $0, 0
  jr $ra

