.section .rodata
threehalfs: 
  .float 1.5                # Konstantna vrijednost 1.5 (za konačnu aproksimaciju)
half: 
  .float 0.5                # Konstantna vrijednost 0.5 (koristi se u formuli)

.section .data
y:
  .float 0                  # Pomoćna varijabla y (rezultat aproksimacije)
i:
  .word 0                   # Cjelobrojna reprezentacija broja (hack dio)

.section .text
.global Q_rsqrt
Q_rsqrt:
  # Učitaj 0.5 i izračunaj x2 = 0.5 * x
  la $t0, half
  lwc1 $f6, ($t0)           # $f6 = 0.5
  mul.s $f6, $f6, $f12      # $f6 = x2 = 0.5 * x

  # Sačuvaj originalni broj x u memoriju (kao float)
  la $t0, y
  swc1 $f12, ($t0)

  # Interpretiraj isti float kao integer (bit-level manipulacija)
  la $t2, i
  lw $t0, ($t0)             # $t0 = i = reinterpret_cast<int>(x)

  # Magicni broj za početnu aproksimaciju
  lui $t1, 0x5f37
  ori $t1, $t1, 0x59df      # $t1 = 0x5f3759df (magic constant)
  srl $t0, $t0, 1           # $t0 = i >> 1
  sub $t0, $t1, $t0         # $t0 = magic - (i >> 1)
  sw $t0, ($t2)             # Spremi nazad kao novu "i"

  # Ponovo interpretiraj kao float iz i
  lwc1 $f7, ($t2)           # $f7 = reinterpret_cast<float>(i)
  la $t3, y
  swc1 $f7, ($t3)           # y = nova aproksimacija

  # Učitaj 1.5 za završnu korekciju
  la $t4, threehalfs
  lwc1 $f8, ($t4)           # $f8 = 1.5

  # Iterativna korekcija (1.5 - x2 * y * y)
  mul.s $f6, $f6, $f7       # x2 * y
  mul.s $f6, $f6, $f7       # x2 * y * y
  sub.s $f6, $f8, $f6       # 1.5 - (x2 * y * y)
  mul.s $f6, $f6, $f7       # y * (1.5 - x2 * y * y)

  # Vrati rezultat u $f0
  add.s $f0, $0, $f6
  jr $ra                    # Povratak iz funkcije

