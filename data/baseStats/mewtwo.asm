MewtwoBaseStats: ; 3942a (e:542a)
db DEX_MEWTWO ; pokedex id
db 106 ; base hp
db 110 ; base attack
db 90 ; base defense
db 130 ; base speed
db 154 ; base special
db PSYCHIC ; species type 1
db PSYCHIC ; species type 2
db 3 ; catch rate
db 220 ; base exp yield
INCBIN "pic/bmon/mewtwo.pic",0,1 ; 77, sprite dimensions
dw MewtwoPicFront
dw MewtwoPicBack
; attacks known at lvl 0
db CONFUSION
db DISABLE
db SWIFT
db PSYCHIC_M
db 5 ; growth rate
; learnset
db %10110001
db %11111111
db %10101111
db %11110001
db %10101111
db %00111000
db %01100011
db 0 ; padding
