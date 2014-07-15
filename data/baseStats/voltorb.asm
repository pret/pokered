VoltorbBaseStats: ; 38eb2 (e:4eb2)
db DEX_VOLTORB ; pokedex id
db 40 ; base hp
db 30 ; base attack
db 50 ; base defense
db 100 ; base speed
db 55 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 190 ; catch rate
db 103 ; base exp yield
INCBIN "pic/bmon/voltorb.pic",0,1 ; 55, sprite dimensions
dw VoltorbPicFront
dw VoltorbPicBack
; attacks known at lvl 0
db TACKLE
db SCREECH
db 0
db 0
db 0 ; growth rate
; learnset
db %00100000
db %00000001
db %10001000
db %11100001
db %01001011
db %01011000
db %01000010
db 0 ; padding
