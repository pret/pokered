GolduckBaseStats: ; 389c6 (e:49c6)
db DEX_GOLDUCK ; pokedex id
db 80 ; base hp
db 82 ; base attack
db 78 ; base defense
db 85 ; base speed
db 80 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 75 ; catch rate
db 174 ; base exp yield
INCBIN "pic/bmon/golduck.pic",0,1 ; 77, sprite dimensions
dw GolduckPicFront
dw GolduckPicBack
; attacks known at lvl 0
db SCRATCH
db TAIL_WHIP
db DISABLE
db 0
db 0 ; growth rate
; learnset
db %10110001
db %11111111
db %00001111
db %11001000
db %11000010
db %00001000
db %00110010
db 0 ; padding
