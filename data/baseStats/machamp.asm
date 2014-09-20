MachampBaseStats: ; 38b32 (e:4b32)
db DEX_MACHAMP ; pokedex id
db 90 ; base hp
db 130 ; base attack
db 80 ; base defense
db 55 ; base speed
db 65 ; base special
db FIGHTING ; species type 1
db FIGHTING ; species type 2
db 45 ; catch rate
db 193 ; base exp yield
INCBIN "pic/bmon/machamp.pic",0,1 ; 77, sprite dimensions
dw MachampPicFront
dw MachampPicBack
; attacks known at lvl 0
db KARATE_CHOP
db LOW_KICK
db LEER
db 0
db 3 ; growth rate
; learnset
db %10110001
db %01000011
db %00001111
db %11001110
db %10100110
db %10001000
db %00100010
db 0 ; padding
