.section .data
  .globl tekst
  .align 0
tekst:
  .asciiz "Ana voli Milovana"

  .globl trazeni_znak
  .align 0
trazeni_znak:
  .byte 'a'

  .globl broj_ponavljanja
  .align 2
broj_ponavljanja:
  .word 0

  .section .text
  .globl main
main:
  lui $t0, %hi(tekst)
  ori $t0, $t0, %lo(tekst)
  lui $t1, %hi(trazeni_znak)
  ori $t1, $t1, %lo(trazeni_znak)
  lb $t2, ($t1)
  addiu $t3, $0, 0

loop:
  lb $t4, ($t0)
  beq $t4, $0, kraj
  addiu $t0, $t0, 1
  beq $t2, $t4, povecaj
  j loop

povecaj:
  addiu $t3, $t3, 1
  j loop

kraj:
  lui $t0, %hi(broj_ponavljanja)
  ori $t0, $t0, %lo(broj_ponavljanja)
  sw $t3, ($t0)
  addiu $v0, $0, 0
  jr $ra




