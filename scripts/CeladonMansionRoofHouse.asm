CeladonMansionRoofHouse_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansionRoofHouse_TextPointers:
	dw CeladonMansion5Text1
	dw CeladonMansion5Text2

CeladonMansion5Text1:
	text_far _CeladonMansion5Text1
	text_end

CeladonMansion5Text2:
	text_asm
	lb bc, EEVEE, 25
	
	; Because Eevee is a starter, we don't want it to be rendered redundant by this.
	; So when the player has one, we'll give them something else.
	; I chose Pikachu, which matches how in Yellow, the Eevee matches the rival.
	; It doesn't entirely make sense given RB, but I think it's ok, and gives a similar power spike.
	ld a, [wPlayerStarter] ; Load the player's starter after Eevee loads.
	cp EEVEE ; Was your starter Eevee?
	jr nz, .skip ; If not, skip this.
	lb bc, PIKACHU, 25 ; Load in Pikachu if true.

.skip ; Return to usual functioning.
	call GivePokemon
	jr nc, .party_full
	ld a, HS_CELADON_MANSION_EEVEE_GIFT
	ld [wMissableObjectIndex], a
	predef HideObject
.party_full
	jp TextScriptEnd
