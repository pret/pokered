SetAttackAnimPal:
	call GetPredefRegisters

	ld a, $e4
	ld [wAnimPalette], a
	ld a, [wOnSGB]
	and a
	ret z
	
	ld a, $f0
	ld [wAnimPalette], a
	
	ldh a, [hGBC]
	and a
	ret z 
	
	ld a, [wIsInBattle]
	and a
	ret z

	;only continue for valid move animations
	ld a, [wAnimationID]
	and a
	ret z
	cp STRUGGLE
	jr c, .skip
	call SetAttackAnimPal_otheranims	;reset battle pals for non-move battle animations
	ret nc
.skip
	
	ld a, $e4
	ld [wAnimPalette], a
	
	push hl
	push bc
	push de
	ld a, [wcf91]
	push af
	
	call GetSpecificAnimPalettes
	jr c, .gotPalette

.checkType
	
;doing a move animation, so find its type and apply color
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveType
	jr z, .playermove
	ld hl, wEnemyMoveType
.playermove

	ld a, [hl]
	ld bc, $0000
	ld c, a
	ld hl, TypePalColorList
	add hl, bc
	ld a, [hl]
	ld b, a

.gotPalette
	;make sure to reset palette/shade data into OBP0
	;ld a, %11100100
	;ldh [rOBP0], a

	ld c, 4
.transfer
	ld d, CONVERT_OBP0
	ld e, c
	dec e
	ld a, b	
	add NUM_POKEMON_INDEXES+2
	ld [wcf91], a
	push bc
	farcall TransferMonPal
	pop bc
	dec c
	jr nz, .transfer
	
	pop af
	ld [wcf91], a
	pop de
	pop bc
	pop hl
	ret	
TypePalColorList:
	db PAL_BLACK2;normal
	db PAL_GREYMON;fighting
	db PAL_MEWMON;flying
	db PAL_PURPLEMON;poison
	db PAL_BROWNMON;ground
	db PAL_GREYMON;rock
	db PAL_BLACK2;untyped
	db PAL_GREENBAR;bug
	db PAL_PURPLEMON;ghost
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_BLACK2;unused
	db PAL_REDMON;fire
	db PAL_BLUEMON;water
	db PAL_GREENMON;grass
	db PAL_YELLOWMON;electric
	db PAL_PINKMON;psychic
	db PAL_CYANMON;ice
	db PAL_0F;dragon

GetSpecificAnimPalettes: ; animations that have specific mappings
	ld a, [wAnimationID]
	ld hl, AnimPaletteMapping
	ld de, 2
	call IsInArray ; does this move have a special color palette
	jr c, .hasPalette
	and a ; clear carry
	ret
.hasPalette
	ld a, b
	add b ; double the count to get the index
	add 1 ; second value in pair
	ld c, a
	ld b, 0
	ld hl, AnimPaletteMapping
	add hl, bc 
	ld b, [hl]
	scf
	ret

AnimPaletteMapping:
	db TOSS_ANIM, PAL_REDMON
	db GREATTOSS_ANIM, PAL_BLUEMON
	db ULTRATOSS_ANIM, PAL_ULTRABALL
	db HYPERTOSS_ANIM, PAL_GREENMON
	db MASTERTOSS_ANIM, PAL_PURPLEMON
	db SAFARITOSS_ANIM, PAL_SAFARIBALL
	db HYPER_BEAM, PAL_REDBAR
	db BURN_ANIM, PAL_REDMON
	db POUND, PAL_BLACK2
	db ABSORB, PAL_GREENMON
	db STRING_SHOT, PAL_WHITEMON
	db STUN_SPORE, PAL_YELLOWMON
	db PETAL_DANCE, PAL_PINKMON
	db PAY_DAY, PAL_YELLOWMON
	db DIZZY_PUNCH, PAL_YELLOWMON
	db TRI_ATTACK, PAL_REDBAR
	db SOFTBOILED, PAL_WHITEMON
	db CONVERSION, PAL_GREENBAR
	db -1 

IsInArrayWrapped:
	push hl
	push bc
	push de
	ld hl, AnimPaletteMapping
	ld de, 2
	call IsInArray ; does this move have a special color palette
	pop de
	pop bc
	pop hl
	ret


SetAttackAnimPal_otheranims:
	call IsInArrayWrapped
	ret c ; return if so
	call SetAttackAnimPal_resetPalettes
	and a ; clear carry
	ret

;This function copies BGP colors 0-3 into OBP colors 0-3
;It is meant to reset the object palettes on the fly
SetAttackAnimPal_resetPalettes:
	push hl
	push bc
	push de
	
	ld c, 4
.loop
	ld a, 4
	sub c
	;multiply index by 8 since each index represents 8 bytes worth of data
	add a
	add a
	add a
	ldh [rBGPI], a
	or $80 ; set auto-increment bit for writing
	ldh [rOBPI], a
	ld hl, rBGPD
	ld de, rOBPD
	
	ld b, 4
.loop2
	ldh a, [rLCDC]
	and rLCDC_ENABLE_MASK
	jr z, .lcd_dis
	;lcd in enabled otherwise
.wait1
	;wait for current blank period to end
	ldh a, [rSTAT]
	and %10 ; mask for non-V-blank/non-H-blank STAT mode
	jr z, .wait1
	;out of blank period now
.wait2
	ldh a, [rSTAT]
	and %10 ; mask for non-V-blank/non-H-blank STAT mode
	jr nz, .wait2
	;back in blank period now
.lcd_dis	
	;LCD is disabled, so safe to read/write colors directly
	ld a, [hl]
	ld [de], a
	ldh a, [rBGPI]
	inc a
	ldh [rBGPI], a
	ld a, [hl]
	ld [de], a
	ldh a, [rBGPI]
	inc a
	ldh [rBGPI], a
	dec b
	jr nz, .loop2
	
	dec c
	jr nz, .loop
	
	pop de
	pop bc
	pop hl
	ret