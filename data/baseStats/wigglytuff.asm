WigglytuffBaseStats: ; 38822 (e:4822)
db DEX_WIGGLYTUFF ; pokedex id
db 140 ; base hp
db 70 ; base attack
db 45 ; base defense
db 45 ; base speed
db 50 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 50 ; catch rate
db 109 ; base exp yield
INCBIN "pic/bmon/wigglytuff.pic",0,1 ; 66, sprite dimensions
dw WigglytuffPicFront
dw WigglytuffPicBack
; attacks known at lvl 0
db SING
db DISABLE
db DEFENSE_CURL
db DOUBLESLAP
db 4 ; growth rate
; learnset
db %10110001
db %01111111
db %10101111
db %11110001
db %10100011
db %00111000
db %01100011
db 0 ; padding
