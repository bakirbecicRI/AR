.section .data
.globl niz
.align 2
niz: .word 3, 5, 7, 33, 22, 14, 23, 2, 9, 5
.globl broj_parnih
.align 2
broj_parnih:
 .word 0
.section .text
.globl main
main: lui $t0, %hi(niz)
ori $t0, $t0, %lo(niz)
addiu $t1, $0, 0 #brojac
addiu $t8, $0, 0 #brojac za parne
petlja:
addiu $t5, $t0, 0
slti $t2, $t1, 10
beq $t2, $0, kraj
sll $t3, $t1, 2
add $t6, $t5, $t3
lw $t7, ($t6)
addiu $t1, $t1, 1
andi $t2, $t7, 1
beq $t2, $0, suma_parnih
j petlja

suma_parnih: addiu $t8, $t8, 1
j petlja

kraj: lui $t0, %hi(broj_parnih)
ori $t0, $t0, %lo(broj_parnih)
sw $t8, ($t0)
addiu $v0, $0, 0
jr $ra 
