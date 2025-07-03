.section .data
  .globl array
array:
  .word 3, 7, 9, 11, 13, 15, 18
  .globl len
len:
  .word 7
  .globl result
result:
  .word 0
.section .text
  .globl main
main:
  lui $t0, %hi(array)
  ori $t0, $t0, %lo(array)
  lui $t3, %hi(len)
  ori $t3, $t3, %lo(len)
  lw $t3, ($t3) #ucitavanje lengtha
  addiu $t4, $0, 1 #formiranje brojaca u $t4
  j petlja

petlja:
  lw $t1, ($t0)
  andi $t2, $t1, 1
  beq $t2, $0, paran
  beq $t4, $t3, neparan
  addiu $t4, $t4, 1 #pomjeranje brojaca
  addiu $t0, $t0, 4 #pomjeranje adrese
  j petlja

paran:
  lui $t5, %hi(result)
  ori $t5, $t5, %lo(result)
  sw $t2, ($t5)
j kraj

neparan:
  lui $t5, %hi(result)
  ori $t5, $t5, %lo(result)
  sw $t2, ($t5)
j kraj

kraj:
  addiu $v0, $0, 0
  jr $ra

