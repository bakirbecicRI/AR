.section .data
  .globl num
  .align 1
num:
  .hword 0xC0DE
.section .bss
  .globl res
res:
  .byte
.section .text
.globl main
main:
  lui $t0, %hi(num)
  ori $t0, $t0, %lo(num)
  lh $t0, ($t0)
  lui $t1, %hi(0xCAFE)
  ori $t1, $t1, 0x0000
  add $t1, $t1, $t0
  lui $t0, %hi(res)
  ori $t0, $t0, %lo(res)
  sb $t1, ($t0)
  lb $v0, ($t0)
  jr $ra
  

