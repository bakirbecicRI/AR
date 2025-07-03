#prebrojati koliko brojeva u nizu se nalazi u opsegu [5,15]
  .section .data
  .globl niz
  .align 2
niz:
  .word 3, 6, 14, 2, 15, 7, 20, 5, -1, 10
  .globl broj_u_opsegu
  .align 2
broj_u_opsegu:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  addiu $t1, $0, 0 #brojac
  lui $t3, %hi(broj_u_opsegu)
  ori $t3, $t3, %lo(broj_u_opsegu)
  addiu $t4, $0, 0 #za sumiranje brojeva u opsegu

petlja:
  slti $t2, $t1, 10
  beq $t2, $zero, kraj
  sll $t9, $t1, 2
  add $t7, $t0, $t9
  lw $t8, ($t7)
  addiu $t1, $t1, 1
  slti $t5, $t8, 16
  slti $t6, $t8, 5
  beq $t5, $0, skip
  bne $t5, $0, addnumber
  j petlja

skip:
  addiu $t1, $t1, 1
  j petlja

add_number:
  addiu $t4, $t4, 1
  j petlja

kraj:
  sw $t4, ($t3)
  addiu $v0, $0, 0
  jr $ra

