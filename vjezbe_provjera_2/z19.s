.section .data
  .globl niz
  .align 2
niz:        .word 2, 3, 4, 5
  .globl duzina
  .align 2
duzina:     .word 4
  .globl proizvod
  .align 2
proizvod:   .word 1     # Inicijalna vrijednost proizvoda

.section .text
.globl main
main:
  la $t0, niz            # t0 = adresa niza
  lw $t1, duzina         # t1 = dužina niza
  li $t2, 1              # t2 = trenutni proizvod (početno 1)
  li $t3, 0              # t3 = brojač

petlja:
  beq $t3, $t1, kraj     # ako smo prošli sve elemente -> kraj

  lw $t4, ($t0)          # učitaj trenutni element niza
  mul $t2, $t2, $t4      # t2 *= t4

  addiu $t0, $t0, 4      # idi na sljedeći element
  addiu $t3, $t3, 1      # brojač++

  j petlja

kraj:
  la $t5, proizvod
  sw $t2, ($t5)          # spremi konačan proizvod

  li $v0, 0
  jr $ra

