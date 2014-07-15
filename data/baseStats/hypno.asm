HypnoBaseStats: ; 38e5e (e:4e5e)
db DEX_HYPNO ; pokedex id
db 85 ; base hp
db 73 ; base attack
db 70 ; base defense
db 67 ; base speed
db 115 ; base special
db PSYCHIC ; species type 1
db PSYCHIC ; species type 2
db 75 ; catch rate
db 165 ; base exp yield
INCBIN "pic/bmon/hypno.pic",0,1 ; 77, sprite dimensions
dw HypnoPicFront
dw HypnoPicBack
; attacks known at lvl 0
db POUND
db HYPNOSIS
db DISABLE
db CONFUSION
db 0 ; growth rate
; learnset
db %10110001
db %01000011
db %00001111
db %11110000
db %10000111
db %00111010
db %01000011
db 0 ; padding
