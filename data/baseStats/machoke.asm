MachokeBaseStats: ; 38b16 (e:4b16)
db DEX_MACHOKE ; pokedex id
db 80 ; base hp
db 100 ; base attack
db 70 ; base defense
db 45 ; base speed
db 50 ; base special
db FIGHTING ; species type 1
db FIGHTING ; species type 2
db 90 ; catch rate
db 146 ; base exp yield
INCBIN "pic/bmon/machoke.pic",0,1 ; 77, sprite dimensions
dw MachokePicFront
dw MachokePicBack
; attacks known at lvl 0
db KARATE_CHOP
db LOW_KICK
db LEER
db 0
db 3 ; growth rate
; learnset
db %10110001
db %00000011
db %00001111
db %11001110
db %10100110
db %10001000
db %00100010
db 0 ; padding
