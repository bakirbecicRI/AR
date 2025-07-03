#median
.section .data
  .globl niz
  .align 1
niz:
  .hword 1, 19, 350, 740, 1522
  .globl duzina
  .align 1
duzina:
  .hword 5
  .globl result
  .align 1
result:
  .hword 0

.section .text
  .globl main
main:
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  lui $t2, %hi(duzina)
  ori $t2, $t2, %lo(duzina)
  lui $t5, %hi(result)
  ori $t5, $t5, %lo(result)
  lh $t4, ($t2)
  addiu $t1, $0, 1 #brojac


petlja:
  slt $t3, $t1, $t4
  beq $t3, $0, sorted
  lh $t7, ($t0)
  addiu $t0, $t0, 2
  lh $t8, ($t0)
  addiu $t1, $t1, 1
  slt $t3, $t7, $t8
  beq $t3, $zero, not_sorted
  j petlja

not_sorted:
  lui $t6, 0xDEAD
  ori $t6, $t6, 0xFA11
  sh $t6, ($t5)
  j kraj

sorted:
  addiu $t4, $t4, -1
  lui $t0, %hi(niz)
  ori $t0, $t0, %lo(niz)
  add $t0, $t0, $t4
  lh $t6, ($t0)
  sh $t6, ($t5)
  j kraj

kraj:
  addiu $v0, $0, 0
  jr $ra


