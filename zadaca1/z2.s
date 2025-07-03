.section .data
  number:
    .word 7
  result:
    .word 0
.section .text
.globl main
main:
  lw $t0, number
  andi $t1, $t0, 1
  beq $t1, $0, paran

neparan:
  li $t2, 1
  sw $t2, result
  j multiply22

paran:
  li $t2, 0
  sw $t2, result
  
  # broj * 22
multiply22:
sll $t3, $t0, 4 # t3=broj*16
sll $t4, $t0, 2 # t4=broj*4
sll $t5, $t0, 1 # t5=broj*2
add $t3, $t3, $t4
add $t3, $t3, $t5
sw $t3, result

multiply7:
sll $t3, $t0, 2
sll $t4, $t0, 1
add $t3, $t3, $t4
add $t3, $t3, $t0
sw $t3, result

mod8:
  andi $t3, $t0, 7
  sw $t3, result

mod32:
  andi $t3, $t0, 31
  sw $t3, result

end:
  addiu $v0, $0, 0
  jr $ra

