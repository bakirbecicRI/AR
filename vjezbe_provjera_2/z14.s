.section .data
  .globl tekst
  .align 0
tekst:
  .asciiz "Pozdrav svijete!"

  .globl duzina
  .align 2
duzina:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(tekst)
  ori $t0, $t0, %lo(tekst)
  addiu $t1, $0, 0 #duzina

petlja:
  lb $t2, ($t0)
  beq $t2, $0, kraj
  addiu $t1, $t1, 1
  addiu $t0, $t0, 1  
  j petlja

kraj:
  lui $t0, %hi(duzina)
  ori $t0, $t0, %lo(duzina)
  sw $t1, ($t0)
  addiu $v0, $0, 0
  jr $ra
