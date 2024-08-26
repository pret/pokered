MACRO ldhilo
    ld HIGH(\1),LOW(\2)
ENDM

SECTION "r0", ROM0[$0]
ld HIGH(af),a
ld HIGH(bc),LOW(bc)
ld LOW(bc),HIGH(bc)
ld HIGH(de),LOW(de)
ld LOW(de),HIGH(de)
    ldhilo hl, hl
ld LOW(hl),HIGH(hl)

db HIGH(label+$AB)
db LOW(label+$AB)

db HIGH($1234)
db LOW($1234)

SECTION "o",OAM
DS $10
label:
