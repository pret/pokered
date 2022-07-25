;gbcnote - new functions
UpdateGBCPal_BGP::
	push af
	ldh a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ldh a, [rBGP]
	ld b, a
	ld a, [wLastBGP]
	cp b
	jr z, .noChangeInBGP
	farcall _UpdateGBCPal_BGP
.noChangeInBGP
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret
	
UpdateGBCPal_OBP0::
	push af
	ldh a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ldh a, [rOBP0]
	ld b, a
	ld a, [wLastOBP0]
	cp b
	jr z, .noChangeInOBP0
	ld d, CONVERT_OBP0
	farcall _UpdateGBCPal_OBP
.noChangeInOBP0
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret
	
UpdateGBCPal_OBP1::
	push af
	ldh a, [hGBC]
	and a
	jr z, .notGBC
	push bc
	push de
	push hl
	ldh a, [rOBP1]
	ld b, a
	ld a, [wLastOBP1]
	cp b
	jr z, .noChangeInOBP1
	ld d, CONVERT_OBP1
	farcall _UpdateGBCPal_OBP
.noChangeInOBP1
	pop hl
	pop de
	pop bc
.notGBC
	pop af
	ret

Func_3082:: ;added from pokeyellow - update audio so it doesn't "lag"
	ldh a, [hLoadedROMBank]
	push af
	farcall FadeOutAudio
	callbs Music_DoLowHealthAlarm
	callbs Audio1_UpdateMusic
	pop af
	call BankswitchCommon
	ret