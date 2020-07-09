text   EQUS "db TX_START,"    ; Start writing text.
next   EQUS "db \"<NEXT>\","  ; Move a line down.
line   EQUS "db \"<LINE>\","  ; Start writing at the bottom line.
para   EQUS "db \"<PARA>\","  ; Start a new paragraph.
cont   EQUS "db \"<CONT>\","  ; Scroll to the next line.
done   EQUS "db \"<DONE>\""   ; End a text box.
prompt EQUS "db \"<PROMPT>\"" ; Prompt the player to end a text box (initiating some other event).

page   EQUS "db \"<PAGE>\","         ; Start a new Pokédex page.
dex    EQUS "db \"<DEXEND>\", \"@\"" ; End a Pokédex entry.


; TextCommandJumpTable indexes (see home/text.asm)
	const_def

	const TX_START ; $00
text_start: MACRO
	db TX_START
ENDM

	const TX_RAM ; $01
text_ram: MACRO
	db TX_RAM
	dw \1 ; address to read from
ENDM

	const TX_BCD ; $02
text_bcd: MACRO
	db TX_BCD
	dw \1 ; address to read from
	db \2 ; number of bytes + print flags
ENDM

	const TX_MOVE ; $03
text_move: MACRO
	db TX_MOVE
	dw \1 ; address of the new location
ENDM

	const TX_BOX ; $04
text_box: MACRO
; draw box
	db TX_BOX
	dw \1 ; address of upper left corner
	db \2, \3 ; height, width
ENDM

	const TX_LOW ; $05
text_low: MACRO
	db TX_LOW
ENDM

	const TX_PROMPT_BUTTON ; $06
text_promptbutton: MACRO
	db TX_PROMPT_BUTTON
ENDM

	const TX_SCROLL ; $07
text_scroll: MACRO
	db TX_SCROLL
ENDM

	const TX_START_ASM ; $08
text_asm: MACRO
	db TX_START_ASM
ENDM

	const TX_NUM ; $09
text_decimal: MACRO
; print a big-endian decimal number.
	db TX_NUM
	dw \1 ; address to read from
	dn \2, \3 ; number of bytes to read, number of digits to display
ENDM

	const TX_PAUSE ; $0a
text_pause: MACRO
	db TX_PAUSE
ENDM

	const TX_SOUND_GET_ITEM_1 ; $0b
sound_get_item_1: MACRO
	db TX_SOUND_GET_ITEM_1
ENDM

TX_SOUND_LEVEL_UP EQU TX_SOUND_GET_ITEM_1
sound_level_up EQUS "sound_get_item_1"

	const TX_DOTS ; $0c
text_dots: MACRO
	db TX_DOTS
	db \1 ; number of ellipses to draw
ENDM

	const TX_WAIT_BUTTON ; $0d
text_waitbutton: MACRO
	db TX_WAIT_BUTTON
ENDM

	const TX_SOUND_POKEDEX_RATING ; $0e
sound_pokedex_rating: MACRO
	db TX_SOUND_POKEDEX_RATING
ENDM

	const TX_SOUND_GET_ITEM_1_DUPLICATE ; $0f
sound_get_item_1_duplicate: MACRO
	db TX_SOUND_GET_ITEM_1_DUPLICATE
ENDM

	const TX_SOUND_GET_ITEM_2 ; $10
sound_get_item_2: MACRO
	db TX_SOUND_GET_ITEM_2
ENDM

	const TX_SOUND_GET_KEY_ITEM ; $11
sound_get_key_item: MACRO
	db TX_SOUND_GET_KEY_ITEM
ENDM

	const TX_SOUND_CAUGHT_MON ; $12
sound_caught_mon: MACRO
	db TX_SOUND_CAUGHT_MON
ENDM

	const TX_SOUND_DEX_PAGE_ADDED ; $13
sound_dex_page_added: MACRO
	db TX_SOUND_DEX_PAGE_ADDED
ENDM

	const TX_SOUND_CRY_NIDORINA ; $14
sound_cry_nidorina: MACRO
	db TX_SOUND_CRY_NIDORINA
ENDM

	const TX_SOUND_CRY_PIDGEOT ; $15
sound_cry_pidgeot: MACRO
	db TX_SOUND_CRY_PIDGEOT
ENDM

	const TX_SOUND_CRY_DEWGONG ; $16
sound_cry_dewgong: MACRO
	db TX_SOUND_CRY_DEWGONG
ENDM

	const TX_FAR ; $17
text_far: MACRO
	db TX_FAR
	dab \1 ; address of text commands
ENDM


	const_next $50

	const TX_END ; $50
text_end: MACRO
	db TX_END
ENDM


; Text script IDs (see home/text_script.asm)
	const_def -1, -1

	const TX_SCRIPT_POKECENTER_NURSE ; $ff
script_pokecenter_nurse: MACRO
	db TX_SCRIPT_POKECENTER_NURSE
ENDM

	const TX_SCRIPT_MART ; $fe
script_mart: MACRO
	db TX_SCRIPT_MART
	db _NARG ; number of items
REPT _NARG
	db \1 ; item id
	SHIFT
ENDR
	db -1 ; end
ENDM

	const TX_SCRIPT_BILLS_PC ; $fd
script_bills_pc: MACRO
	db TX_SCRIPT_BILLS_PC
ENDM

	const TX_SCRIPT_PLAYERS_PC ; $fc
script_players_pc: MACRO
	db TX_SCRIPT_PLAYERS_PC
ENDM

	const_skip ; $fb

	const_skip ; $fa

	const TX_SCRIPT_POKECENTER_PC ; $f9
script_pokecenter_pc: MACRO
	db TX_SCRIPT_POKECENTER_PC
ENDM

	const_skip ; $f8

	const TX_SCRIPT_PRIZE_VENDOR ; $f7
script_prize_vendor: MACRO
	db TX_SCRIPT_PRIZE_VENDOR
ENDM

	const TX_SCRIPT_CABLE_CLUB_RECEPTIONIST ; $f6
script_cable_club_receptionist: MACRO
	db TX_SCRIPT_CABLE_CLUB_RECEPTIONIST
ENDM

	const TX_SCRIPT_VENDING_MACHINE ; $f5
script_vending_machine: MACRO
	db TX_SCRIPT_VENDING_MACHINE
ENDM
