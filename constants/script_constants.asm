; emotion bubbles
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

; in game trade dialog sets
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
