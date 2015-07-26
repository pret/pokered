MrMimeBaseStats: ; 3911a (e:511a)
db DEX_MR_MIME ; pokedex id
db 40 ; base hp
db 45 ; base attack
db 65 ; base defense
db 90 ; base speed
db 100 ; base special
db PSYCHIC ; species type 1
db PSYCHIC ; species type 2
db 45 ; catch rate
db 136 ; base exp yield
INCBIN "pic/bmon/mr.mime.pic",0,1 ; 66, sprite dimensions
dw MrMimePicFront
dw MrMimePicBack
; attacks known at lvl 0
db CONFUSION
db BARRIER
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,15
	tmlearn 17,18,19,20,22,24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,35,40
	tmlearn 44,45,46
	tmlearn 50,55
db 0 ; padding
