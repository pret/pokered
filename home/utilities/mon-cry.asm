; plays the cry of a pokemon
; INPUT:
; a = pokemon ID
PlayCry:: ; 13d0 (0:13d0)
	call GetCryData
	call PlaySound ; play cry
	jp WaitForSoundToFinish ; wait for sound to be done playing

; gets a pokemon's cry data
; INPUT:
; a = pokemon ID
GetCryData:: ; 13d9 (0:13d9)
	dec a
	ld c,a
	ld b,0
	ld hl,CryData
	add hl,bc
	add hl,bc
	add hl,bc
	ld a,Bank(CryData)
	call BankswitchHome
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld [wc0f1],a
	ld a,[hl]
	ld [wc0f2],a
	call BankswitchBack
	ld a,b ; a = cryID
	ld c,$14 ; base sound ID for pokemon cries
	rlca
	add b ; a = cryID * 3
	add c ; a = $14 + cryID * 3
	ret