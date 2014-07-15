RhydonBaseStats: ; 39002 (e:5002)
db DEX_RHYDON ; pokedex id
db 105 ; base hp
db 130 ; base attack
db 120 ; base defense
db 40 ; base speed
db 45 ; base special
db GROUND ; species type 1
db ROCK ; species type 2
db 60 ; catch rate
db 204 ; base exp yield
INCBIN "pic/bmon/rhydon.pic",0,1 ; 77, sprite dimensions
dw RhydonPicFront
dw RhydonPicBack
; attacks known at lvl 0
db HORN_ATTACK
db STOMP
db TAIL_WHIP
db FURY_ATTACK
db 5 ; growth rate
; learnset
db %11110001
db %11111111
db %10001111
db %11001111
db %10100010
db %10001000
db %00110010
db 0 ; padding
