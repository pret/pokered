; EmotionBubblesPointerTable indexes (see engine/overworld/emotion_bubbles.asm)
	const_def
	const EXCLAMATION_BUBBLE ; 0
	const QUESTION_BUBBLE    ; 1
	const SMILE_BUBBLE       ; 2

; slot symbols
DEF SLOTS7      EQU $0200
DEF SLOTSBAR    EQU $0604
DEF SLOTSCHERRY EQU $0A08
DEF SLOTSFISH   EQU $0E0C
DEF SLOTSBIRD   EQU $1210
DEF SLOTSMOUSE  EQU $1614

; StartSlotMachine dialogs
DEF SLOTS_OUTOFORDER   EQU $fd
DEF SLOTS_OUTTOLUNCH   EQU $fe
DEF SLOTS_SOMEONESKEYS EQU $ff

; in game trades
; TradeMons indexes (see data/events/trades.asm)
	const_def
	const TRADE_FOR_TERRY
	const TRADE_FOR_MARCEL
	const TRADE_FOR_CHIKUCHIKU ; unused
	const TRADE_FOR_SAILOR
	const TRADE_FOR_DUX
	const TRADE_FOR_MARC
	const TRADE_FOR_LOLA
	const TRADE_FOR_DORIS
	const TRADE_FOR_CRINKLES
	const TRADE_FOR_SPOT
DEF NUM_NPC_TRADES EQU const_value

; in game trade dialog sets
; InGameTradeTextPointers indexes (see engine/events/in_game_trades.asm)
	const_def
	const TRADE_DIALOGSET_CASUAL
	const TRADE_DIALOGSET_EVOLUTION
	const TRADE_DIALOGSET_HAPPY
DEF NUM_TRADE_DIALOGSETS EQU const_value

; OaksAideScript results
DEF OAKS_AIDE_BAG_FULL        EQU $00
DEF OAKS_AIDE_GOT_ITEM        EQU $01
DEF OAKS_AIDE_NOT_ENOUGH_MONS EQU $80
DEF OAKS_AIDE_REFUSED         EQU $ff
