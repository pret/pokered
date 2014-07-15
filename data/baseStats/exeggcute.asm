ExeggcuteBaseStats: ; 38eea (e:4eea)
db DEX_EXEGGCUTE ; pokedex id
db 60 ; base hp
db 40 ; base attack
db 80 ; base defense
db 40 ; base speed
db 60 ; base special
db GRASS ; species type 1
db PSYCHIC ; species type 2
db 90 ; catch rate
db 98 ; base exp yield
INCBIN "pic/bmon/exeggcute.pic",0,1 ; 77, sprite dimensions
dw ExeggcutePicFront
dw ExeggcutePicBack
; attacks known at lvl 0
db BARRAGE
db HYPNOSIS
db 0
db 0
db 5 ; growth rate
; learnset
db %00100000
db %00000011
db %00001000
db %11110000
db %00011011
db %01101000
db %00000010
db 0 ; padding
