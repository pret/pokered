PersianBaseStats: ; 3898e (e:498e)
db DEX_PERSIAN ; pokedex id
db 65 ; base hp
db 70 ; base attack
db 60 ; base defense
db 115 ; base speed
db 65 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 90 ; catch rate
db 148 ; base exp yield
INCBIN "pic/bmon/persian.pic",0,1 ; 77, sprite dimensions
dw PersianPicFront
dw PersianPicBack
; attacks known at lvl 0
db SCRATCH
db GROWL
db BITE
db SCREECH
db 0 ; growth rate
; learnset
db %10100000
db %11001111
db %10001000
db %11000001
db %11000010
db %00001000
db %00000010
db 0 ; padding
