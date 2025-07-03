.section .data
  .globl niz
  .align 2
niz:
  .word 7, 14, 9, 3, 20, 1, 6, 11, 8, 5
  .globl najveci_neparni 
  .align 2
najveci_neparni:
  .word 0
.section .text
  .globl main

main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  lw $t1, ($t0) #najveci_neparni
  addiu $t2, $0, 0 #brojac

petlja:
  slti $t3, $t2, 10
  beq $t3, $0, kraj
  lw $t4, ($t0)  # ucitavamo element
  addiu $t0, $t0, 4
  addiu $t2, $t2, 1
  andi $t5, $t4, 1
  bne $t5, $0, neparan_provjera
  j petlja

neparan_provjera:
  slt $t6, $t1, $t4
  beq $t6, $0, petlja
  move $t1, $t4
  j petlja

kraj:
  lui $t0, %hi(najveci_neparni)
  ori $t0, $t0, %lo(najveci_neparni)
  sw $t1, ($t0)
  addiu $v0, $0, 0
  jr $ra
