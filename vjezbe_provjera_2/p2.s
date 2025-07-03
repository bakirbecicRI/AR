.section .rodata
  .globl str
  .align 0
str:
  .asciiz "Hello world"
.section .data
  .globl res
res:
  .space 40

.section .text
  .globl main
main:
  lui $t0, %hi(str)
  ori $t0, $t0, %lo(str)
  lui $t4, %hi(res)
  ori $t4, $t4, %lo(res)
  addiu $t2, $0, 0 #brojac
  j petlja

petlja:
  lb $t1, ($t0) # element char* niza
  lb $t5, ($t4) # element res-a
  beq $t1, $0, kraj
  slti $t3, $t1, 98   # provjera da li je s>97
  bne $t3, $0, promjena_adr
  slti $t3, $t1, 123  # provjera da li je s<123
  beq $t3, $0, promjena_adr
  addi $t5, $t1, -32
  sb $t5, ($t4)
  addiu $t4, $t4, 1 #i++
  addiu $t0, $t0, 1 #s++
  j petlja

promjena_adr:
  sb $t1, ($t4)
  addiu $t0, $t0, 1
  addiu $t4, $t4, 1
  j petlja

kraj:

  addiu $v0, $0, 0
  jr $ra
