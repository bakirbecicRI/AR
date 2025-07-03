#suma svih parnih brojeva
.section .data
  .globl array
  .align 2
array:
  .word 2,5,8,3,10,7
  .globl len
  .align 2
len:
  .word 6
  .globl suma
  .align 2
suma_parnih:
  .word 0
.section .text
  .globl main
main:
  addiu $t0, $0, 0 #registar za sumu
  lui $t1, %hi(array)
  ori $t1, $t1, %lo(array)
  lui $t2, %hi(len)
  ori $t2, $t2, %lo(len)
  lw $t2, ($t2)
  addiu $t5, $0, 0 #brojac
  j petlja

petlja:
  beq $t2, $t5, kraj
  lw $t3, ($t1) #ucitavamo element niza
  andi $t4, $t3, 1 #provjeravamo element niza da li je paran
  beq $t4, $0, summing
  addiu $t5, $t5, 1
  addiu $t1, $t1, 4
  j petlja

summing:
  addu $t0, $t0, $t3 #sumiranje
  addiu $t1, $t1, 4 #pomjeranje niza
  addiu $t5, $t5, 1
  j petlja


kraj:
  lui $t6, %hi(suma_parnih)
  ori $t6, $t6, %lo(suma_parnih)
  sw $t0, ($t6)
  addiu $v0, $0, 0
  jr $ra

