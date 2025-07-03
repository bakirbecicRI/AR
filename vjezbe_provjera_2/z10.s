.section .rodata

.globl num
.align 1
num:
  .hword 0xC0De

  .section .bss

.globl res
  res:
  .byte

.section .text

  .globl main
main:
  lui $t0, %hi(num)
  ori $t0, $t0, %lo(num)
  lhu $t0, ($t0)

  lui $t1, 0xCAFE
  addu $t1, $t0, $t1

  lui $t2, %hi(res)
  ori $t2, $t2, %lo(res)
  sb $t1, ($t2)

  lb $v0, ($t2)
  jr $ra
  nop
