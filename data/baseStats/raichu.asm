RaichuBaseStats: ; 3869a (e:469a)
db DEX_RAICHU ; pokedex id
db 60 ; base hp
db 90 ; base attack
db 55 ; base defense
db 100 ; base speed
db 90 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 75 ; catch rate
db 122 ; base exp yield
INCBIN "pic/bmon/raichu.pic",0,1 ; 77, sprite dimensions
dw RaichuPicFront
dw RaichuPicBack
; attacks known at lvl 0
db THUNDERSHOCK
db GROWL
db THUNDER_WAVE
db 0
db 0 ; growth rate
; learnset
db %10110001
db %11000011
db %10001101
db %11000001
db %11000011
db %00011000
db %01000010
db 0 ; padding
