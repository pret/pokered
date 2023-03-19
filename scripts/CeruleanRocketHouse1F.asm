; PureRGBnote: ADDED: secret house in cerulean
CeruleanRocketHouse1F_Script:
	call EnableAutoTextBoxDrawing
	call CeruleanRocketHouse1F_AddStairs
	ret

CeruleanRocketHouse1F_TextPointers:
; PureRGBnote: ADDED: Rocket who shows up in this building after getting the DIG tm from him. He goes downstairs after becoming champ.
	dw CeruleanRocketHouse1FText1 


; after becoming champ a stairway opens up in the house that wasn't present before, allowing you to descend.
CeruleanRocketHouse1F_AddStairs:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_BECAME_CHAMP
	ret z
	lb bc, 0, 1
	ld a, $08
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

CeruleanRocketHouse1FText1:
	text_far _CeruleanRocketHouse1FText
	text_end
