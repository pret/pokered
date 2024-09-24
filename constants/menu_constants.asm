DEF BAG_ITEM_CAPACITY EQU 20
DEF PC_ITEM_CAPACITY  EQU 50

; text box IDs
	const_def 1
	const MESSAGE_BOX                       ; $01
	const_skip                              ; $02
	const MENU_TEMPLATE_03                  ; $03 unused
	const FIELD_MOVE_MON_MENU               ; $04
	const JP_MOCHIMONO_MENU_TEMPLATE        ; $05
	const USE_TOSS_MENU_TEMPLATE            ; $06
	const MENU_TEMPLATE_07                  ; $07 unused
	const JP_SAVE_MESSAGE_MENU_TEMPLATE     ; $08
	const JP_SPEED_OPTIONS_MENU_TEMPLATE    ; $09
	const_skip                              ; $0a
	const BATTLE_MENU_TEMPLATE              ; $0b
	const SWITCH_STATS_CANCEL_MENU_TEMPLATE ; $0c
	const LIST_MENU_BOX                     ; $0d
	const BUY_SELL_QUIT_MENU_TEMPLATE       ; $0e
	const MONEY_BOX_TEMPLATE                ; $0f
	const MENU_TEMPLATE_10                  ; $10 unused
	const MON_SPRITE_POPUP                  ; $11
	const JP_AH_MENU_TEMPLATE               ; $12
	const MONEY_BOX                         ; $13
	const TWO_OPTION_MENU                   ; $14
	const BUY_SELL_QUIT_MENU                ; $15
	const_skip                              ; $16
	const_skip                              ; $17
	const_skip                              ; $18
	const_skip                              ; $19
	const JP_POKEDEX_MENU_TEMPLATE          ; $1a
	const SAFARI_BATTLE_MENU_TEMPLATE       ; $1b

; two option menu constants
; TwoOptionMenuStrings indexes (see data/yes_no_menu_strings.asm)
	const_def
	const YES_NO_MENU       ; 0
	const NORTH_WEST_MENU   ; 1
	const SOUTH_EAST_MENU   ; 2
	const WIDE_YES_NO_MENU  ; 3
	const NORTH_EAST_MENU   ; 4
	const TRADE_CANCEL_MENU ; 5
	const HEAL_CANCEL_MENU  ; 6
	const NO_YES_MENU       ; 7
DEF NUM_TWO_OPTION_MENUS EQU const_value

; wTwoOptionMenuID
DEF BIT_SECOND_MENU_OPTION_DEFAULT EQU 7

; menu exit method constants for list menus and the buy/sell/quit menu
DEF CHOSE_MENU_ITEM   EQU 1 ; pressed A
DEF CANCELLED_MENU    EQU 2 ; pressed B

; menu exit method constants for two-option menus
DEF CHOSE_FIRST_ITEM  EQU 1
DEF CHOSE_SECOND_ITEM EQU 2

; move mon constants
	const_def
	const BOX_TO_PARTY     ; 0
	const PARTY_TO_BOX     ; 1
	const DAYCARE_TO_PARTY ; 2
	const PARTY_TO_DAYCARE ; 3

; party menu types
; PartyMenuMessagePointers indexes (see engine/menus/party_menu.asm)
	const_def
	const NORMAL_PARTY_MENU    ; $00
	const USE_ITEM_PARTY_MENU  ; $01
	const BATTLE_PARTY_MENU    ; $02
	const TMHM_PARTY_MENU      ; $03
	const SWAP_MONS_PARTY_MENU ; $04
	const EVO_STONE_PARTY_MENU ; $05
; party menu message IDs
; PartyMenuItemUseMessagePointers indexes (see engine/menus/party_menu.asm)
	const_next $F0
DEF FIRST_PARTY_MENU_TEXT_ID EQU const_value
	const ANTIDOTE_MSG         ; $F0
	const BURN_HEAL_MSG        ; $F1
	const ICE_HEAL_MSG         ; $F2
	const AWAKENING_MSG        ; $F3
	const PARALYZ_HEAL_MSG     ; $F4
	const POTION_MSG           ; $F5
	const FULL_HEAL_MSG        ; $F6
	const REVIVE_MSG           ; $F7
	const RARE_CANDY_MSG       ; $F8

; naming screen types
	const_def
	const NAME_PLAYER_SCREEN ; 0
	const NAME_RIVAL_SCREEN  ; 1
	const NAME_MON_SCREEN    ; 2
