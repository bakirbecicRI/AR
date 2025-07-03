.section .globl
  .globl a
a:
  .byte 5
  .globl b
b:
  .byte 7
  .globl c
c:
  .byte 0

.section .text
  .globl main

main:
  #t0 lokalna varijabla
  lui $t1, %hi(a)
  ori $t1, $t1, %lo(a)
  lui $t2, %hi(b)
  ori $t2, $t2, %lo(b)
  lbu $t3, ($t1) #ucitavamo a u t3
  lbu $t4, ($t2) #ucitavamo b u t4
  beq $t4, $t3, iftrue
  j ifnottrue
iftrue:
add $t0, $0, $t3 #t0=a
  j kraj

ifnottrue:
add $t0, $0, $t4 #t0=b
  j kraj


kraj:
  lui $t1, %hi(c)
  ori $t1, $t1, %lo(c)
  lb $t5, ($t1)
  add $t5, $t3, $t4
  sll $t5, $t5, 1
  sb $t5, ($t1) #upisujemo u c rezultat
  addiu $v0, $0, 0
  jr $ra
