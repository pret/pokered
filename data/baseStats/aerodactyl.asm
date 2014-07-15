AerodactylBaseStats: ; 3934a (e:534a)
db DEX_AERODACTYL ; pokedex id
db 80 ; base hp
db 105 ; base attack
db 65 ; base defense
db 130 ; base speed
db 60 ; base special
db ROCK ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 202 ; base exp yield
INCBIN "pic/bmon/aerodactyl.pic",0,1 ; 77, sprite dimensions
dw AerodactylPicFront
dw AerodactylPicBack
; attacks known at lvl 0
db WING_ATTACK
db AGILITY
db 0
db 0
db 5 ; growth rate
; learnset
db %00101010
db %01000011
db %01001000
db %11000000
db %01100011
db %00001100
db %00001010
db 0 ; padding
