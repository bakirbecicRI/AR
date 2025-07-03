.section .rodata
.align 3
.globl nums
nums: .double 1., 5.7, 9.4, 14.8, 7.1, 8.2, 10.5
.globl str
str: .asciiz "MyMax: %f\n"
.section .text
.globl mymax
mymax:
  // start - $f12, $f13
  // nums - $a2
  // size - $a3
 
  addiu $t0, $0, 0 // i
forin:
  sltu $t1, $t0, $a3
  beq $t1, $0, forout

  sll $t2, $t0, 3
  addu $t3, $a2, $t2
  l.d $f4, 0($t3)
ifin:
  c.lt.d $f12, $f4
  bc1f ifout
  mov.d $f12, $f4
ifout:
  addiu $t0, $t0, 1
  j forin
forout:
  mov.d $f0, $f12
  jr $ra
.globl main
main:
  addiu $sp, $sp, -32
  sw $ra, 28($sp)

  la $a2, nums  
  l.d $f12, 0($a2)
  addiu $a3, $0, 7

  jal mymax
 
  la $a0, str
    
  mfc1 $a2, $f0
  mfc1 $a3, $f1
  jal printf

  lw $ra, 28($sp)
  addiu $sp, $sp, 32

  addiu $v0, $0, 0
  jr $ra

