MagnemiteBaseStats: ; 38c9e (e:4c9e)
db DEX_MAGNEMITE ; pokedex id
db 25 ; base hp
db 35 ; base attack
db 70 ; base defense
db 45 ; base speed
db 95 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 190 ; catch rate
db 89 ; base exp yield
INCBIN "pic/bmon/magnemite.pic",0,1 ; 55, sprite dimensions
dw MagnemitePicFront
dw MagnemitePicBack
; attacks known at lvl 0
db TACKLE
db 0
db 0
db 0
db 0 ; growth rate
; learnset
db %00100000
db %00000011
db %10001000
db %11100001
db %01000011
db %00011000
db %01000010
db 0 ; padding
