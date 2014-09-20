JynxBaseStats: ; 39152 (e:5152)
db DEX_JYNX ; pokedex id
db 65 ; base hp
db 50 ; base attack
db 35 ; base defense
db 95 ; base speed
db 95 ; base special
db ICE ; species type 1
db PSYCHIC ; species type 2
db 45 ; catch rate
db 137 ; base exp yield
INCBIN "pic/bmon/jynx.pic",0,1 ; 66, sprite dimensions
dw JynxPicFront
dw JynxPicBack
; attacks known at lvl 0
db POUND
db LOVELY_KISS
db 0
db 0
db 0 ; growth rate
; learnset
db %10110001
db %01111111
db %00001111
db %11110000
db %10000111
db %00101000
db %00000010
db 0 ; padding
