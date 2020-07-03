; This function appears to never be used.
; It is likely a debugging feature to give the player Tsunekazu Ishihara's
; favorite Pokemon. This is indicated by the overpowered Exeggutor, which
; Ishihara (president of Creatures Inc.) said was his favorite Pokemon in an ABC
; interview on February 8, 2000.
; "Exeggutor is my favorite. That's because I was always using this character
; while I was debugging the program."
; http://www.ign.com/articles/2000/02/09/abc-news-pokamon-chat-transcript

SetIshiharaTeam:
	ld de, IshiharaTeam
.loop
	ld a, [de]
	cp $ff
	ret z
	ld [wcf91], a
	inc de
	ld a, [de]
	ld [wCurEnemyLVL], a
	inc de
	call AddPartyMon
	jr .loop

IshiharaTeam:
	db EXEGGUTOR,90
	db MEW,20
	db JOLTEON,56
	db DUGTRIO,56
	db ARTICUNO,57
	db $FF

EmptyFunc:
	ret
