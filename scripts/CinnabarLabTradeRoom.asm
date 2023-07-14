CinnabarLabTradeRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabTradeRoom_TextPointers:
	def_text_pointers
	dw_const CinnabarLabTradeRoomSuperNerdText, TEXT_CINNABARLABTRADEROOM_SUPER_NERD
	dw_const CinnabarLabTradeRoomGrampsText,    TEXT_CINNABARLABTRADEROOM_GRAMPS
	dw_const CinnabarLabTradeRoomBeautyText,    TEXT_CINNABARLABTRADEROOM_BEAUTY

CinnabarLabTradeRoomSuperNerdText:
	text_far _CinnabarLabTradeRoomSuperNerdText
	text_end

CinnabarLabTradeRoomGrampsText:
	text_asm
	ld a, TRADE_FOR_DORIS
	ld [wWhichTrade], a
	jr CinnabarLabTradeRoomDoTrade

CinnabarLabTradeRoomBeautyText:
	text_asm
	ld a, TRADE_FOR_CRINKLES
	ld [wWhichTrade], a
CinnabarLabTradeRoomDoTrade:
	predef DoInGameTradeDialogue
	jp TextScriptEnd
