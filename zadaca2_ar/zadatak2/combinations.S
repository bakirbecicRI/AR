.section .data
d:
  .word 0

.section .text
.globl combinations
combinations:
  addiu $sp, $sp, -32
  sw $ra, 16($sp)          # sacuvaj povratnu adresu
  sw $a0, 20($sp)          # sacuvaj argumente
  sw $a1, 24($sp)
  sw $a2, 28($sp)
  addiu $a0, $a2, 0        # priprema za malloc
  jal malloc               # alokacija memorije
  la $t0, d
  sw $v0, ($t0)            # cuvanje pokazivaca
  lw $a0, 20($sp)          # vrati argumente
  lw $a1, 28($sp)
  lw $a2, 24($sp)
  lw $a3, 28($sp)
  jal combinations_impl    # poziv rekurzije
  lw $ra, 16($sp)
  addiu $sp, $sp, 32
  jr $ra

combinations_impl:
  addiu $sp, $sp, -40
  sw $ra, 16($sp)
  sw $a0, 20($sp)
  sw $a1, 24($sp)
  sw $a2, 28($sp)
  sw $a3, 32($sp)
  bne $a3, $0, leave_if    # ako a3 != 0, preskoci ispis
  addiu $a0, $a1, 0
  jal print_comb           # ispis kombinacije
  j leave_combinations_impl_for
leave_if:
  addiu $t0, $0, 0         # i = 0
combinations_impl_for:
  lw $a0, 20($sp)          # vrati argumente
  lw $a1, 24($sp)
  lw $a2, 28($sp)
  lw $a3, 32($sp)
  slt $t1, $t0, $a2
  beq $t1, $0, leave_combinations_impl_for
  subu $t1, $a1, $a3       # index u rezultatu
  la $t2, d
  lw $t2, ($t2)            # pokazivac na rezultat
  addu $t2, $t2, $t1       # pozicija za upis
  addu $t3, $a0, $t0       # pokazivac na ulaz
  lb $t3, ($t3)            # ucitaj karakter
  sb $t3, ($t2)            # upisi karakter
  addiu $a3, $a3, -1       # a3--
  sw $t0, 36($sp)          # sacuvaj i
  jal combinations_impl    # rekurzivni poziv
  lw $t0, 36($sp)          # vrati i
  addiu $t0, $t0, 1        # i++
  j combinations_impl_for
leave_combinations_impl_for:
  lw $ra, 16($sp)
  addiu $sp, $sp, 40
  jr $ra

.section .rodata
arg1:
  .asciiz "%c"
arg2:
  .asciiz "\n"

.section .text
.globl print_comb
print_comb:
  addiu $sp, $sp, -40
  sw $ra, 16($sp)
  sw $a0, 20($sp)
  la $t0, arg1
  sw $t0, 24($sp)          # format %c
  la $t0, arg2
  sw $t0, 28($sp)          # format \n
  addiu $t0, $0, 0         # i = 0
print_comb_for:
  lw $a0, 20($sp)
  slt $t1, $t0, $a0
  beq $t1, $0, leave_print_comb_for
  lw $a0, 24($sp)          # format string
  la $t1, d
  lw $t1, ($t1)
  addu $a1, $t1, $t0
  lb $a1, ($a1)            # ucitaj karakter iz kombinacije
  sw $t0, 32($sp)          # sacuvaj i
  jal printf               # ispis znaka
  lw $t0, 32($sp)
  addiu $t0, $t0, 1        # i++
  j print_comb_for
leave_print_comb_for:
  lw $a0, 28($sp)
  jal printf               # ispis novog reda
  lw $ra, 16($sp)
  addiu $sp, $sp, 40
  jr $ra

