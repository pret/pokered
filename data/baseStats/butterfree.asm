ButterfreeBaseStats: ; 38512 (e:4512)
db DEX_BUTTERFREE ; pokedex id
db 60 ; base hp
db 45 ; base attack
db 50 ; base defense
db 70 ; base speed
db 80 ; base special
db BUG ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 160 ; base exp yield
INCBIN "pic/bmon/butterfree.pic",0,1 ; 77, sprite dimensions
dw ButterfreePicFront
dw ButterfreePicBack
; attacks known at lvl 0
db CONFUSION
db 0
db 0
db 0
db 0 ; growth rate
; learnset
db %00101010
db %01000011
db %00111000
db %11110000
db %01000011
db %00101000
IF !_YELLOW
	db %00000010
ENDC
IF _YELLOW
	db %01000010
ENDC
db 0 ; padding
