MagnetonBaseStats: ; 38cba (e:4cba)
db DEX_MAGNETON ; pokedex id
db 50 ; base hp
db 60 ; base attack
db 95 ; base defense
db 70 ; base speed
db 120 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 60 ; catch rate
db 161 ; base exp yield
INCBIN "pic/bmon/magneton.pic",0,1 ; 66, sprite dimensions
dw MagnetonPicFront
dw MagnetonPicBack
; attacks known at lvl 0
db TACKLE
db SONICBOOM
db THUNDERSHOCK
db 0
db 0 ; growth rate
; learnset
db %00100000
db %01000011
db %10001000
db %11100001
db %01000011
db %00011000
db %01000010
db 0 ; padding
