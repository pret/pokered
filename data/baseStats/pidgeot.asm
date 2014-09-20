PidgeotBaseStats: ; 385ba (e:45ba)
db DEX_PIDGEOT ; pokedex id
db 83 ; base hp
db 80 ; base attack
db 75 ; base defense
db 91 ; base speed
db 70 ; base special
db NORMAL ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 172 ; base exp yield
INCBIN "pic/bmon/pidgeot.pic",0,1 ; 77, sprite dimensions
dw PidgeotPicFront
dw PidgeotPicBack
; attacks known at lvl 0
db GUST
db SAND_ATTACK
db QUICK_ATTACK
db 0
db 3 ; growth rate
; learnset
db %00101010
db %01000011
db %00001000
db %11000000
db %01000011
db %00001100
db %00001010
db 0 ; padding
