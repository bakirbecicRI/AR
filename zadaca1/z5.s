.section .data
  .global .str
  .align 0
str:
  .byte 'r', 'a', 'd', 'a', 'r', 0
  .global result
result:
  .word 0

.section .text
  .globl main
main:
  lui $t0, %hi(str)
  ori $t0, $t0, %lo(str)
  #$t2-size
  addiu $t2, $0, 0
  j find_length

find_length:
  lb $t1, ($t0)
  beq $t1, $0, tijelo
  #$t2-povecanje sizea
  addiu $t2, $t2, 1
  addiu $t0, $t0, 1
  j find_length

tijelo:
  lui $t0, %hi(str)
  ori $t0, $t0, %lo(str)
  #t3 za result 
  addiu $t2, $t2, -1
  addu $t7, $0, $t2 #spremanje sizea koji nam treba u t7
  srl $t2, $t2, 1 #dijelimo umanjeni size , kako bi znali da smo dosli do srednjeg elementa
  addu $t0, $t0, $t2 #pomjeramo za size da dodjemo do srednjeg elementa
  lb $t0, ($t0) #ucitavamo u t0 srednji element niza, ako je parni onda je jedan od srednjih
  lui $t1, %hi(str)
  ori $t1, $t1, %lo(str)#za zadnji element
  lui $t8, %hi(str)
  ori $t8, $t8, %lo(str)#za prvi element
  addu $t1, $t1, $t7# pomjeranje na zadnji
  #ponovo ucitavanje
  j provjera

provjera:
  lb $t6, ($t8) #ucitavanje prvog elementa
  lb $t5, ($t1) #zadnji element
  bne $t6, $t5, not_palindrom #poredjenje prvog i zadnjeg elementa
  #ako su t1 i t5 jednaki gledamo sledece
  beq $t5, $t0, palindrom #da li je neki od clanova u ovom slucaju lijevi jednak srednjem elementu, to bi znacilo da smo dosli do kraja
  addiu $t8, $t8, 1 #pomjeranje adrese prvog karaktera
  addiu $t1, $t1, -1 #pomjeranje adrese zadnjeg karaktera
  j provjera

    
not_palindrom:
  lui $t4, %hi(result)
  ori $t4, $t4, %lo(result)
  addiu $t3, $0, 0
  sw $t3, ($t4)
  j kraj

palindrom:
  lui $t4, %hi(result)
  ori $t4, $t4, %lo(result)
  addiu $t3, $0, 1
  sw $t3, ($t4)
  j kraj

kraj:
  addiu $v0, $0, 0
  jr $ra


