GrowlitheBaseStats: ; 38a1a (e:4a1a)
db DEX_GROWLITHE ; pokedex id
db 55 ; base hp
db 70 ; base attack
db 45 ; base defense
db 60 ; base speed
db 50 ; base special
db FIRE ; species type 1
db FIRE ; species type 2
db 190 ; catch rate
db 91 ; base exp yield
INCBIN "pic/bmon/growlithe.pic",0,1 ; 55, sprite dimensions
dw GrowlithePicFront
dw GrowlithePicBack
; attacks known at lvl 0
db BITE
db ROAR
db 0
db 0
db 5 ; growth rate
; learnset
db %10100000
db %00000011
db %01001000
db %11001000
db %11100011
db %00001000
db %00000010
db 0 ; padding
