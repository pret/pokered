; PureRGBnote: ADDED: checks if we can use strength when pressing A on a boulder and asks the player whether to do so if it's possible
CheckStrengthUsage::
	ld a, [wd728]
	bit 0, a
	jr nz, .boulderTextActive ; already using it
	ld a, [wObtainedBadges]
	bit BIT_RAINBOWBADGE, a
	jr z, .noStrength ; cant use it if no rainbowbadge
	ld hl, wPartyMon1Moves
	ld e, 0 ; which pokemon has strength
.nextPoke
	ld b, NUM_MOVES
.moveloop
	ld a, [hl]
	cp STRENGTH
	jr z, .foundStrength
	inc hl
	dec b
	ld a, b
	and a
	jr nz, .moveloop
	inc e
	ld a, [wPartyCount]
	cp e
	jr z, .noStrength
	ld a, e
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	jr .nextPoke
.foundStrength
	push de
	ld hl, BoulderTextInit
	rst _PrintText
	pop de
	ld a, e
	push de
	ld hl, wPartyMonNicks
	call GetPartyMonName
	pop de
	ld a, e
	ld hl, wPartyMon1Species
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld a, [hl]
	ld [wcf91], a
	ld hl, wd728
	set 0, [hl]
	ld hl, UsedStrengthText2
	rst _PrintText
	ld a, [wcf91]
	call PlayCry
	call Delay3
	ld hl, CanMoveBouldersText2
	jp PrintText
.boulderTextActive
	ld hl, BoulderTextActive
	jp PrintText
.declineStrength
	ld hl, StrengthDecline
	jp PrintText
.noStrength
	ld hl, BoulderTextNoStrength
	jp PrintText

BoulderTextNoStrength::
	text_far _BoulderText
	text_end

BoulderTextInit::
	text_far _BoulderText
	text_promptbutton
	text_end

BoulderTextActive::
	text_far _StrengthActive
	text_end

StrengthDecline::
	text_far _PokemonMansion1FSwitchNotPressedText
	text_end

UsedStrengthText2:
	text_far _UsedStrengthText
	text_end

CanMoveBouldersText2:
	text_far _CanMoveBouldersText
	text_end

