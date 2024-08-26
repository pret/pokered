SECTION "r0", ROM0[$0]
ld a,a
ld b,c
ld c,b
ld d,e
ld e,d
ld h,l
ld l,h

db ((label+$AB) >> 8) & $FF
db (label+$AB) & $FF

db ($1234 >> 8) & $FF
db $1234 & $FF

SECTION "o",OAM
DS $10
label:
