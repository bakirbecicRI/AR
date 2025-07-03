.section .data
  .globl a
  .align 0
a:
    .byte 25
  .globl d
  .align 1
d:
  .hword 40000
  .globl e
  .align 1
e:
  .hword 40000
  .globl foo
  .align 2
foo:
  .word 
  .globl i
  .align 2
i:
  .word
  .globl j
  .align 2
j:
  .word
.section .text
  .globl main
main:
  #foo=a+150
  lui $t0, %hi(a)
  ori $t0, $t0, %lo(a)
  lbu $t0, ($t0)
  lui $t1, %hi(foo)
  ori $t1, $t1, %lo(foo)
  lw $t2, ($t1)
  addiu $t2, $t0, 150
  sw $t2, ($t1)
  
    #i=d-45000
  lui $t0, %hi(d)
  ori $t0, $t0, %lo(d)
  lhu $t0, ($t0)
  lui $t1, %hi(i)
  ori $t1, $t1, %lo(i)
  lw $t2, ($t1)
  ori $t3, $0, 45000
  subu $t2, $t0, $t3
  sw $t2, ($t1)
  
    #j=e-45000
  lui $t0, %hi(e)
  ori $t0, $t0, %lo(e)
  lhu $t0, ($t0)
  lui $t1, %hi(j)
  ori $t1, $t1, %lo(j)
  lw $t2, ($t1)
  ori $t3, $0, 45000
  sub $t2, $t0, $t3
  sw $t2, ($t1)
  
  addiu $v0, $0, 0
  jr $ra
