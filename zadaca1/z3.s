#0111 0111 1111 1111 1011 1111 1111 1110 - broj koji na pozicijama 0,14,27 i 31 ima nule
#0111 0111 1111 1111 1011 1111 1111 1110 - 0x77FFBFEE
.section .data
resetter:
  .word 0
.section .text
.globl main
  main:
  lw $t1, resetter
  lui $t1, 0x77FF
  ori $t1, $t1, 0xBFEE
  and $v0, $t1, $t0
    
  jr $ra


