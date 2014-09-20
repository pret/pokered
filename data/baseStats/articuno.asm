ArticunoBaseStats: ; 39382 (e:5382)
db DEX_ARTICUNO ; pokedex id
db 90 ; base hp
db 85 ; base attack
db 100 ; base defense
db 85 ; base speed
db 125 ; base special
db ICE ; species type 1
db FLYING ; species type 2
db 3 ; catch rate
db 215 ; base exp yield
INCBIN "pic/bmon/articuno.pic",0,1 ; 77, sprite dimensions
dw ArticunoPicFront
dw ArticunoPicBack
; attacks known at lvl 0
db PECK
db ICE_BEAM
db 0
db 0
db 5 ; growth rate
; learnset
db %00101010
db %01111111
db %00001000
db %11000000
db %01000011
db %00001100
db %00001010
db 0 ; padding
