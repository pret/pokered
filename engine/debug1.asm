; This function appears to never be used.
; It is likely a debugging feature to give the player Tsunekazu Ishihara's
; favorite Pokemon. This is indicated by the overpowered Exeggutor, which
; Ishihara (president of Creatures Inc.) said was his favorite Pokemon in an ABC
; interview on February 8, 2000.
; "Exeggutor is my favorite. That's because I was always using this character
; while I was debugging the program."
; http://www.ign.com/articles/2000/02/09/abc-news-pokamon-chat-transcript

SetIshiharaTeam: ; 64ca (1:64ca)
	ld de, IshiharaTeam
.loop
	ld a, [de]
	cp $ff
	jr nz, .addMon
	inc de
	ld a, [de]
	cp $ff
	ret z
	dec de
.addMon
	ld a, [de]
	ld [wcf91], a
	inc de
	ld a, [de]
	ld [wcf91 + 1], a
	inc de
	ld a, [de]
	ld [wCurEnemyLVL], a
	inc de
	call AddPartyMon
	jr .loop

IshiharaTeam: ; 64df (1:64df)
	dwb EXEGGUTOR,90
	dwb MEW,20
	dwb JOLTEON,56
	dwb DUGTRIO,56
	dwb ARTICUNO,57
	dw $FF, $FF

EmptyFunc:
	ret
