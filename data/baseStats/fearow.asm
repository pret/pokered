FearowBaseStats: ; 3862a (e:462a)
db DEX_FEAROW ; pokedex id
db 65 ; base hp
db 90 ; base attack
db 65 ; base defense
db 100 ; base speed
db 61 ; base special
db NORMAL ; species type 1
db FLYING ; species type 2
db 90 ; catch rate
db 162 ; base exp yield
INCBIN "pic/bmon/fearow.pic",0,1 ; 77, sprite dimensions
dw FearowPicFront
dw FearowPicBack
; attacks known at lvl 0
db PECK
db GROWL
db LEER
db 0
db 0 ; growth rate
; learnset
db %00101010
db %01000011
db %00001000
db %11000000
db %01000010
db %00001100
db %00001010
db 0 ; padding
