DEF text   EQUS "db TX_START,"    ; Start writing text.
DEF next   EQUS "db \"<NEXT>\","  ; Move a line down.
DEF line   EQUS "db \"<LINE>\","  ; Start writing at the bottom line.
DEF para   EQUS "db \"<PARA>\","  ; Start a new paragraph.
DEF cont   EQUS "db \"<CONT>\","  ; Scroll to the next line.
DEF done   EQUS "db \"<DONE>\""   ; End a text box.
DEF prompt EQUS "db \"<PROMPT>\"" ; Prompt the player to end a text box (initiating some other event).

DEF page   EQUS "db \"<PAGE>\","         ; Start a new Pokédex page.
DEF dex    EQUS "db \"<DEXEND>\", \"@\"" ; End a Pokédex entry.


; TextCommandJumpTable indexes (see home/text.asm)
	const_def

	const TX_START ; $00
MACRO text_start
	db TX_START
ENDM

	const TX_RAM ; $01
MACRO text_ram
	db TX_RAM
	dw \1 ; address to read from
ENDM

	const TX_BCD ; $02
MACRO text_bcd
	db TX_BCD
	dw \1 ; address to read from
	db \2 ; number of bytes + print flags
ENDM

	const TX_MOVE ; $03
MACRO text_move
	db TX_MOVE
	dw \1 ; address of the new location
ENDM

	const TX_BOX ; $04
MACRO text_box
; draw box
	db TX_BOX
	dw \1 ; address of upper left corner
	db \2, \3 ; height, width
ENDM

	const TX_LOW ; $05
MACRO text_low
	db TX_LOW
ENDM

	const TX_PROMPT_BUTTON ; $06
MACRO text_promptbutton
	db TX_PROMPT_BUTTON
ENDM

	const TX_SCROLL ; $07
MACRO text_scroll
	db TX_SCROLL
ENDM

	const TX_START_ASM ; $08
MACRO text_asm
	db TX_START_ASM
ENDM

	const TX_NUM ; $09
MACRO text_decimal
; print a big-endian decimal number.
	db TX_NUM
	dw \1 ; address to read from
	dn \2, \3 ; number of bytes to read, number of digits to display
ENDM

	const TX_PAUSE ; $0a
MACRO text_pause
	db TX_PAUSE
ENDM

	const TX_SOUND_GET_ITEM_1 ; $0b
MACRO sound_get_item_1
	db TX_SOUND_GET_ITEM_1
ENDM

DEF TX_SOUND_LEVEL_UP EQU TX_SOUND_GET_ITEM_1
DEF sound_level_up EQUS "sound_get_item_1"

	const TX_DOTS ; $0c
MACRO text_dots
	db TX_DOTS
	db \1 ; number of ellipses to draw
ENDM

	const TX_WAIT_BUTTON ; $0d
MACRO text_waitbutton
	db TX_WAIT_BUTTON
ENDM

	const TX_SOUND_POKEDEX_RATING ; $0e
MACRO sound_pokedex_rating
	db TX_SOUND_POKEDEX_RATING
ENDM

	const TX_SOUND_GET_ITEM_1_DUPLICATE ; $0f
MACRO sound_get_item_1_duplicate
	db TX_SOUND_GET_ITEM_1_DUPLICATE
ENDM

	const TX_SOUND_GET_ITEM_2 ; $10
MACRO sound_get_item_2
	db TX_SOUND_GET_ITEM_2
ENDM

	const TX_SOUND_GET_KEY_ITEM ; $11
MACRO sound_get_key_item
	db TX_SOUND_GET_KEY_ITEM
ENDM

	const TX_SOUND_CAUGHT_MON ; $12
MACRO sound_caught_mon
	db TX_SOUND_CAUGHT_MON
ENDM

	const TX_SOUND_DEX_PAGE_ADDED ; $13
MACRO sound_dex_page_added
	db TX_SOUND_DEX_PAGE_ADDED
ENDM

	const TX_SOUND_CRY_NIDORINO ; $14
MACRO sound_cry_nidorino
	db TX_SOUND_CRY_NIDORINO
ENDM

	const TX_SOUND_CRY_PIDGEOT ; $15
MACRO sound_cry_pidgeot
	db TX_SOUND_CRY_PIDGEOT
ENDM

	const TX_SOUND_CRY_DEWGONG ; $16
MACRO sound_cry_dewgong
	db TX_SOUND_CRY_DEWGONG
ENDM

	const TX_FAR ; $17
MACRO text_far
	db TX_FAR
	dab \1 ; address of text commands
ENDM


	const_next $50

	const TX_END ; $50
MACRO text_end
	db TX_END
ENDM


; Text script IDs (see home/text_script.asm)
	const_def -1, -1

	const TX_SCRIPT_POKECENTER_NURSE ; $ff
MACRO script_pokecenter_nurse
	db TX_SCRIPT_POKECENTER_NURSE
ENDM

	const TX_SCRIPT_MART ; $fe
MACRO script_mart
	db TX_SCRIPT_MART
	db _NARG ; number of items
	IF _NARG
		db \# ; all item ids
	ENDC
	db -1 ; end
ENDM

	const TX_SCRIPT_BILLS_PC ; $fd
MACRO script_bills_pc
	db TX_SCRIPT_BILLS_PC
ENDM

	const TX_SCRIPT_PLAYERS_PC ; $fc
MACRO script_players_pc
	db TX_SCRIPT_PLAYERS_PC
ENDM

	const_skip ; $fb

	const_skip ; $fa

	const TX_SCRIPT_POKECENTER_PC ; $f9
MACRO script_pokecenter_pc
	db TX_SCRIPT_POKECENTER_PC
ENDM

	const_skip ; $f8

	const TX_SCRIPT_PRIZE_VENDOR ; $f7
MACRO script_prize_vendor
	db TX_SCRIPT_PRIZE_VENDOR
ENDM

	const TX_SCRIPT_CABLE_CLUB_RECEPTIONIST ; $f6
MACRO script_cable_club_receptionist
	db TX_SCRIPT_CABLE_CLUB_RECEPTIONIST
ENDM

	const TX_SCRIPT_VENDING_MACHINE ; $f5
MACRO script_vending_machine
	db TX_SCRIPT_VENDING_MACHINE
ENDM
