.section .data
number: .word 7
result: .word 0
#ucitava broj sa memorijske lokacije number, ispituje da li 
# je broj paran ili neparan koristeci striktno bitwise operatore
# te rezultat smjesta na memorijsku lokaciju result
# obje memorijske lokacije trebaju biti u data ili rodata
# sekciji programa
.section .text
.globl main
main:
  # ucitavanje broja iz memorije u registar
  lw $t0, number

  andi $t1, $t0, 1
  beq $t1, $0, paran

neparan:
  li $t2, 1
  sw $t2, result
  j end

paran:
  li $t2, 0
  sw $t2, result
end:
  addiu $v0, $0, 0
  jr $ra
