; PureRGBnote: ADDED: secret house in cerulean
CeruleanRocketHouse1F_Script:
	call EnableAutoTextBoxDrawing
	jp CeruleanRocketHouse1F_AddStairs

CeruleanRocketHouse1F_TextPointers:
	def_text_pointers
; PureRGBnote: ADDED: Rocket who shows up in this building after getting the DIG tm from him. He goes downstairs after becoming champ.
	dw_const CeruleanRocketHouse1FRocketText,  TEXT_CERULEANROCKETHOUSE1F_ROCKET


; after becoming champ a stairway opens up in the house that wasn't present before, allowing you to descend.
CeruleanRocketHouse1F_AddStairs:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_BECAME_CHAMP
	ret z
	lb bc, 0, 1
	ld a, $08 ; stair block
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

CeruleanRocketHouse1FRocketText:
	text_far _CeruleanRocketHouse1FRocketText
	text_end
