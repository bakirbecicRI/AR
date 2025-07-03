#niz od 16-bitnih cijelih brojevea duzine 10, potrebno je prebrojati koliko ima pozitivnih, i pronaci najveci neparni broj;
.section .rodata
  .globl niz
  .align 2
niz: 
  .word -4,7,0,13,-9,22,5,-6,8,15
.section .data
  .globl broj_pozitivnih
  .align 2
broj_pozitivnih:
  .word 0
  .globl najveci_neparni
  .align 2
najveci_neparni:
  .word -32768
.section .text
  .globl main
main:
  addiu $t1, $0, 0 #brojac
  lui $t5, %hi(najveci_neparni)
  ori $t5, $t5, %lo(najveci_neparni)
  lw $t6, ($t5)
  addiu $t8, $0, 0 # registar za parne

petlja:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  slti $t9, $t1, 10
  beq $t9, $0, kraj 
  sll $t2, $t1, 2
  add $t0, $t0, $t2
  lw $t3, ($t0)
  addiu $t1, $t1, 1
  andi $t4, $t3, 1
  bne $t4, $0, neparni
  j is_positive

is_positive:
slti $t7, $t3, 0
beq $t7, $0, positive
j petlja

positive:
  addiu $t8, $t8, 1
  j petlja

neparni:
slt $t7, $t6, $t3 
bne $t7, $0, store
slti $t7, $t3, 0
beq $t7, $0, positive
j petlja

store:
  add $t6, $0, $t3
  slti $t7, $t3, 0
  beq $t7, $0, positive
  j petlja

kraj:
  sw $t6, ($t5)
  lui $t0, %hi(broj_pozitivnih)
  ori $t0, $t0, %lo(broj_pozitivnih)
  sw $t8, ($t0)
  addiu $v0, $0, 0
  jr $ra

