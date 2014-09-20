PidgeottoBaseStats: ; 3859e (e:459e)
db DEX_PIDGEOTTO ; pokedex id
db 63 ; base hp
db 60 ; base attack
db 55 ; base defense
db 71 ; base speed
db 50 ; base special
db NORMAL ; species type 1
db FLYING ; species type 2
db 120 ; catch rate
db 113 ; base exp yield
INCBIN "pic/bmon/pidgeotto.pic",0,1 ; 66, sprite dimensions
dw PidgeottoPicFront
dw PidgeottoPicBack
; attacks known at lvl 0
db GUST
db SAND_ATTACK
db 0
db 0
db 3 ; growth rate
; learnset
db %00101010
db %00000011
db %00001000
db %11000000
db %01000011
db %00001100
db %00001010
db 0 ; padding
