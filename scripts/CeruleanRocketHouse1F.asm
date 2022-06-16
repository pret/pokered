CeruleanRocketHouse1F_Script:
	call EnableAutoTextBoxDrawing
	call CeruleanRocketHouse1F_AddStairs
	ret

CeruleanRocketHouse1F_TextPointers:
	dw CeruleanRocketHouse1FText1

CeruleanRocketHouse1F_AddStairs:
	CheckEvent EVENT_BECAME_CHAMP
	ret z
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	jr nz, .replaceTile
	ret
.replaceTile
	lb bc, 0, 1
	ld a, $08
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

CeruleanRocketHouse1FText1:
	text_far _CeruleanRocketHouse1FText
	text_end
