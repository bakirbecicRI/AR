.section .rodata
.globl arg
arg:
  .asciiz "foo(%d, %d), %hd\n"

.section .text
.globl main
main:
  addiu $sp, $sp, -32        # Alociraj prostor na steku
  sw $ra, 16($sp)            # Sačuvaj povratnu adresu

  # Postavi i = 2
  addiu $t0, $0, 2

for1_cond:
  # Provjera uslova: i < 6
  slti $t1, $t0, 6
  beq $t1, $0, leave_for1    # Ako nije ispunjeno, izađi iz petlje

  # Postavi j = 3
  addiu $t1, $0, 3

for2_cond:
  # Provjera uslova: j < 7
  slti $t2, $t1, 7
  beq $t2, $0, leave_for2    # Ako nije ispunjeno, izađi iz unutrašnje petlje

  # Sačuvaj i i j na stek prije poziva funkcije
  sw $t0, 20($sp)
  sw $t1, 24($sp)

  # Priprema argumenata za poziv foo(i, j)
  addiu $a0, $t0, 0
  addiu $a1, $t1, 0
  jal foo                    # Pozovi funkciju foo(i, j)

  # Vrati i i j sa steka nakon poziva
  lw $t0, 20($sp)
  lw $t1, 24($sp)

  # Priprema argumenata za printf("foo(%d, %d), %hd\n", i, j, foo(i, j))
  lui $a0, %hi(arg)          # Gornji 16-bitni dio adrese stringa
  ori $a0, $a0, %lo(arg)     # Donji 16-bitni dio adrese stringa
  addu $a1, $t0, $0          # i kao drugi argument
  addu $a2, $t1, $0          # j kao treći argument
  addiu $a3, $v0, 0          # povratna vrijednost iz foo kao četvrti argument
  jal printf                 # Poziv printf

  # Ponovno vraćanje i i j nakon printf-a
  lw $t0, 20($sp)
  lw $t1, 24($sp)

  # j++
  addiu $t1, $t1, 1
  j for2_cond                # Povratak na uslov unutrašnje petlje

leave_for2:
  # i++
  addiu $t0, $t0, 1
  j for1_cond                # Povratak na uslov vanjske petlje

leave_for1:
  lw $ra, 16($sp)            # Vrati povratnu adresu sa steka
  addiu $sp, $sp, 32         # Oslobodi prostor sa steka
  jr $ra                     # Povratak iz main funkcije

