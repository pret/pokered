; EmotionBubblesPointerTable indexes (see engine/overworld/emotion_bubbles.asm)
	const_def
	const EXCLAMATION_BUBBLE ; 0
	const QUESTION_BUBBLE    ; 1
	const SMILE_BUBBLE       ; 2

; slot symbols
SLOTS7      EQU $0200
SLOTSBAR    EQU $0604
SLOTSCHERRY EQU $0A08
SLOTSFISH   EQU $0E0C
SLOTSBIRD   EQU $1210
SLOTSMOUSE  EQU $1614

; StartSlotMachine dialogs
SLOTS_OUTOFORDER   EQU $fd
SLOTS_OUTTOLUNCH   EQU $fe
SLOTS_SOMEONESKEYS EQU $ff

; in game trades
; TradeMons indexes (see data/events/trades.asm)
	const_def
	const TRADE_FOR_TERRY
	const TRADE_FOR_MARCEL
	const TRADE_FOR_CHIKUCHIKU
	const TRADE_FOR_SAILOR
	const TRADE_FOR_DUX
	const TRADE_FOR_MARC
	const TRADE_FOR_LOLA
	const TRADE_FOR_DORIS
	const TRADE_FOR_CRINKLES
	const TRADE_FOR_SPOT

; in game trade dialog sets
; InGameTradeTextPointers indexes (see engine/events/in_game_trades.asm)
	const_def
	const TRADE_DIALOGSET_CASUAL
	const TRADE_DIALOGSET_POLITE
	const TRADE_DIALOGSET_HAPPY

; badges
; wObtainedBadges and wBeatGymFlags bits
	const_def
	const BIT_BOULDERBADGE ; 0
	const BIT_CASCADEBADGE ; 1
	const BIT_THUNDERBADGE ; 2
	const BIT_RAINBOWBADGE ; 3
	const BIT_SOULBADGE    ; 4
	const BIT_MARSHBADGE   ; 5
	const BIT_VOLCANOBADGE ; 6
	const BIT_EARTHBADGE   ; 7
NUM_BADGES EQU const_value

; OaksAideScript results
OAKS_AIDE_BAG_FULL        EQU $00
OAKS_AIDE_GOT_ITEM        EQU $01
OAKS_AIDE_NOT_ENOUGH_MONS EQU $80
OAKS_AIDE_REFUSED         EQU $ff
