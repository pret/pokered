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
	const TRADE_FOR_LOLA
	const TRADE_FOR_MARCEL
	const TRADE_FOR_CHIKUCHIKU ; unused
	const TRADE_FOR_HARRY
	const TRADE_FOR_DUX
	const TRADE_FOR_JIMBO
	const TRADE_FOR_MICHELLE
	const TRADE_FOR_JENNY
	const TRADE_FOR_CRINKLES
	const TRADE_FOR_RICKY 
	const TRADE_WITH_SELF ; Celadon University
	const TRADE_FOR_RATICATE_A ; LGPE Trade references - Viridian
	const TRADE_FOR_GOLEM_A ; Pewter
	const TRADE_FOR_NINETALES_A ; Cerulean
	const TRADE_FOR_PERSIAN_A ; Vermillion
	const TRADE_FOR_DUGTRIO_A ; Lavender
	const TRADE_FOR_SANDSLASH_A ; Celadon
	const TRADE_FOR_RAICHU_A ; Saffron
	const TRADE_FOR_MAROWAK_A ; Fuschia
	const TRADE_FOR_MUK_A ; Cinnabar
	const TRADE_FOR_EXEGGUTOR_A ; Indigo
	const TRADE_FOR_TAUROS_C ; S.S. Anne Trades begin here
	const TRADE_FOR_TAUROS_A
	const TRADE_FOR_TAUROS_B
	const TRADE_FOR_RAPIDASH_G
	const TRADE_FOR_SLOWBRO_G
	const TRADE_FOR_SLOWKING_G
	const TRADE_FOR_WEEZING_G
	const TRADE_FOR_MR_RIME
	const TRADE_FOR_PERRSERKER
	const TRADE_FOR_SIRFETCHD
DEF NUM_NPC_TRADES EQU const_value

; in game trade dialog sets
; InGameTradeTextPointers indexes (see engine/events/in_game_trades.asm)
	const_def
	const TRADE_DIALOGSET_CASUAL
	const TRADE_DIALOGSET_EVOLUTION
	const TRADE_DIALOGSET_HAPPY
	const TRADE_DIALOGSET_SELF
	const TRADE_DIALOGSET_REGION ; consistency with LGPE
	const TRADE_DIALOGSET_TAUROSC ; Fighting Tauros lovers
	const TRADE_DIALOGSET_TAUROSA
	const TRADE_DIALOGSET_TAUROSB

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
DEF NUM_BADGES EQU const_value

; OaksAideScript results
DEF OAKS_AIDE_BAG_FULL        EQU $00
DEF OAKS_AIDE_GOT_ITEM        EQU $01
DEF OAKS_AIDE_NOT_ENOUGH_MONS EQU $80
DEF OAKS_AIDE_REFUSED         EQU $ff
