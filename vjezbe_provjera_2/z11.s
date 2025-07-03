.section .text
  .globl main
main:
  lui $t0, %hi(0xDEAD)
  ori $t0, $t0, %lo(0xBEEF)
  addiu $t1, $0, 0
  ori $t2, $0, 40000
  slt $t3, $t2, $t0
  bne $t3, $0, first
  sll $t2, $t2, 1 # 80000
  slt $t3, $t2, $t0
  bne $t3, $0, second
  lui $t1, %hi(0xDEAD)
  ori $t1, $t1, %lo(0xD00D)
  j kraj

first:
  lui $t1, %hi(0xDEAD)
  ori $t1, $t1, %lo(0xC0DE)
  j kraj

second: 
  lui $t1, %hi(0xDEAD)
  ori $t1, $t1, %lo(0x2BAD)
  j kraj

kraj:
  addiu $v0, $0, 0
  jr $ra
