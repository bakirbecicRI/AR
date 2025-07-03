.section .text
roundToTick:
  # Ucitaj vrijednost iz *p u $f4
  ldc1 $f4, ($a0)

  # Konvertuj precision iz int u double ($f6)
  mtc1 $a1, $f6
  cvt.d.w $f6, $f6

  # Pomnozi vrijednost s precision
  mul.d $f4, $f4, $f6

  # Zaokruzi prema nuli
  trunc.w.d $f8, $f4
  cvt.d.w $f8, $f8

  # Podijeli nazad sa precision
  div.d $f4, $f8, $f6

  # Upisi nazad rezultat u *p
  sdc1 $f4, ($a0)
  jr $ra

.section .rodata
.align 3
return1:
  .double 0.001
return2:
  .double 0.01
return3:
  .double 0.1

.section .text
getTick:
  # f4 = 0.0
  addiu $t0, $0, 0
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4

  # Ako je num == 0, vrati num
  c.eq.d $f12, $f4
  bc1f second_if
  mov.d $f0, $f12
  jr $ra

second_if:
  # Ako je num < 10, vrati 0.001
  addiu $t0, $0, 10
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  c.lt.d $f12, $f4
  bc1f third_if
  l.d $f0, return1
  jr $ra

third_if:
  # Ako je num < 100, vrati 0.01
  addiu $t0, $0, 100
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  c.lt.d $f12, $f4
  bc1f forth_if
  l.d $f0, return2
  jr $ra

forth_if:
  # Ako je num < 1000, vrati 0.1
  addiu $t0, $0, 1000
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4
  c.lt.d $f12, $f4
  bc1f finalReturn
  l.d $f0, return3
  jr $ra

finalReturn:
  # Inace, vrati 1.0
  addiu $t0, $0, 1
  mtc1 $t0, $f0
  cvt.d.w $f0, $f0
  jr $ra

.globl calculateAmount
calculateAmount:
  # Sacuvaj stanje na steku
  addiu $sp, $sp, -16
  sw $ra, 12($sp)
  sw $a2, 8($sp)
  sdc1 $f12, ($sp)         # sacuvaj price

  # getTick(price)
  jal getTick

  # $a0 = &price
  addu $a0, $sp, $0

  # $f4 = 1.0
  addiu $t0, $0, 1
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4

  # 1.0 / tick
  div.d $f4, $f4, $f0

  # Zaokruzi prema nuli i prebaci u $a1
  trunc.w.d $f4, $f4
  mfc1 $a1, $f4

  # roundToTick(&price, precision)
  jal roundToTick

  # Vrati stanje sa steka
  lw $ra, 12($sp)
  lw $t0, 8($sp)
  ldc1 $f0, ($sp)
  addiu $sp, $sp, 16

  # Konverzija quantity iz int u double
  mtc1 $t0, $f4
  cvt.d.w $f4, $f4

  # return price * quantity
  mul.d $f0, $f0, $f4
  jr $ra

