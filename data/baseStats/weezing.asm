WeezingBaseStats: ; 38fca (e:4fca)
db DEX_WEEZING ; pokedex id
db 65 ; base hp
db 90 ; base attack
db 120 ; base defense
db 60 ; base speed
db 85 ; base special
db POISON ; species type 1
db POISON ; species type 2
db 60 ; catch rate
db 173 ; base exp yield
INCBIN "pic/bmon/weezing.pic",0,1 ; 77, sprite dimensions
dw WeezingPicFront
dw WeezingPicBack
; attacks known at lvl 0
db TACKLE
db SMOG
db SLUDGE
db 0
db 0 ; growth rate
; learnset
db %00100000
db %01000000
db %10001000
db %11000001
db %00101010
db %01001000
db %00000010
db 0 ; padding
