KabutopsBaseStats: ; 3932e (e:532e)
db DEX_KABUTOPS ; pokedex id
db 60 ; base hp
db 115 ; base attack
db 105 ; base defense
db 80 ; base speed
db 70 ; base special
db ROCK ; species type 1
db WATER ; species type 2
db 45 ; catch rate
db 201 ; base exp yield
INCBIN "pic/bmon/kabutops.pic",0,1 ; 66, sprite dimensions
dw KabutopsPicFront
dw KabutopsPicBack
; attacks known at lvl 0
db SCRATCH
db HARDEN
db ABSORB
db 0
db 0 ; growth rate
; learnset
db %10110110
db %01111111
db %00001101
db %11000000
db %10000011
db %00001000
db %00010010
db 0 ; padding
