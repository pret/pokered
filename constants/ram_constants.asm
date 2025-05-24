; wSlotMachineFlags
	const_def 6
	const BIT_SLOTS_CAN_WIN               ; 6
	const BIT_SLOTS_CAN_WIN_WITH_7_OR_BAR ; 7

; wMiscFlags
; wMiscFlagsDef:
	const_def
	const BIT_SEEN_BY_TRAINER      ; 0
	const BIT_BOULDER_DUST         ; 1
	const BIT_TURNING              ; 2
	const BIT_USING_GENERIC_PC     ; 3
	const BIT_NO_SPRITE_UPDATES    ; 4
	const BIT_NO_MENU_BUTTON_SOUND ; 5
	const BIT_TRIED_PUSH_BOULDER   ; 6
	const BIT_PUSHED_BOULDER       ; 7

; wAutoTextBoxDrawingControl
DEF BIT_NO_AUTO_TEXT_BOX EQU 0

; wTextPredefFlag
DEF BIT_TEXT_PREDEF EQU 0

; wFontLoaded
DEF BIT_FONT_LOADED EQU 0

; wCurrentMapScriptFlags
	const_def 3
	const BIT_MAP_LOADED_AFTER_BATTLE ; 3
	const BIT_CROSSED_MAP_CONNECTION ; 4
	const BIT_CUR_MAP_LOADED_1 ; 5
	const BIT_CUR_MAP_LOADED_2 ; 6
	const BIT_CUR_MAP_USED_ELEVATOR ; 7

;;;;;;;;;; PureRGBnote: CHANGED: increased the speed of each text speed option
; wOptions
DEF TEXT_DELAY_FAST    EQU %00 ; 0
DEF TEXT_DELAY_MEDIUM  EQU %01 ; 1
DEF TEXT_DELAY_SLOW    EQU %11 ; 3
DEF TEXT_DELAY_MASK    EQU %11 ; which bits in wOptions are assigned to text speed value (first two currently)

	const_def 2 ; first two bits are the text delay options above
	; unused bit 2
	; unused bit 3
	; unused bit 4
	; unused bit 5
	const_skip 4
	const BIT_BATTLE_SHIFT     ; 6
	const BIT_BATTLE_ANIMATION ; 7
;;;;;;;;;

; wLetterPrintingDelayFlags
	const_def
	const BIT_FAST_TEXT_DELAY ; 0
	const BIT_TEXT_DELAY      ; 1

; wCurMapTileset
DEF BIT_NO_PREVIOUS_MAP EQU 7

; wCurrentBoxNum
DEF BIT_HAS_CHANGED_BOXES EQU 7

; wObtainedBadges, wBeatGymFlags
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

; wStatusFlags1
	const_def
	const BIT_STRENGTH_ACTIVE           ; 0
	const BIT_SURF_ALLOWED              ; 1
	const BIT_AUTOSURF                  ; 2 ; PureRGBnote: ADDED: 
	const BIT_GOT_OLD_ROD               ; 3
	const BIT_GOT_GOOD_ROD              ; 4
	const BIT_GOT_SUPER_ROD             ; 5
	const BIT_GAVE_SAFFRON_GUARDS_DRINK ; 6
	const BIT_UNUSED_CARD_KEY           ; 7

; wStatusFlags2
	const_def
	const BIT_WILD_ENCOUNTER_COOLDOWN ; 0
	const BIT_NO_AUDIO_FADE_OUT       ; 1

; wStatusFlags3
	const_def
	const BIT_INIT_TRADE_CENTER_FACING ; 0
	const_skip 2                       ; 1-2 ; unused
	const BIT_WARP_FROM_CUR_SCRIPT     ; 3
	const BIT_ON_DUNGEON_WARP          ; 4
	const BIT_NO_NPC_FACE_PLAYER       ; 5
	const BIT_TALKED_TO_TRAINER        ; 6
	const BIT_PRINT_END_BATTLE_TEXT    ; 7

; wStatusFlags4
	const_def
	const BIT_GOT_SILPH_CO_LAPRAS_OR_ITEM  ; 0
	const BIT_UNKNOWN_4_1                  ; 1
	const BIT_USED_POKECENTER              ; 2
	const BIT_GOT_STARTER                  ; 3
	const BIT_NO_BATTLES                   ; 4
	const BIT_BATTLE_OVER_OR_BLACKOUT      ; 5
	const BIT_LINK_CONNECTED               ; 6
	const BIT_INIT_SCRIPTED_MOVEMENT       ; 7

; wStatusFlags5
	const_def
	const BIT_SCRIPTED_NPC_MOVEMENT   ; 0
	const BIT_UNKNOWN_5_1             ; 1
	const BIT_UNKNOWN_5_2             ; 2
	const_skip                        ; 3 ; unused
	const BIT_UNKNOWN_5_4             ; 4
	const BIT_DISABLE_JOYPAD          ; 5
	const BIT_NO_TEXT_DELAY           ; 6
	const BIT_SCRIPTED_MOVEMENT_STATE ; 7 ; TODO: check if it's set when scripting NPC movement but not player

; wStatusFlags6
	const_def
	const BIT_GAME_TIMER_COUNTING ; 0
	const BIT_DEBUG_MODE          ; 1
	const BIT_FLY_OR_DUNGEON_WARP ; 2
	const BIT_FLY_WARP            ; 3
	const BIT_DUNGEON_WARP        ; 4
	const BIT_ALWAYS_ON_BIKE      ; 5
	const BIT_ESCAPE_WARP         ; 6

; wStatusFlags7
	const_def
	const BIT_TEST_BATTLE        ; 0
	const BIT_NO_MAP_MUSIC       ; 1
	const BIT_FORCED_WARP        ; 2
	const BIT_TRAINER_BATTLE     ; 3
	const BIT_USE_CUR_MAP_SCRIPT ; 4
	const_skip 2                 ; 5-6 ; unused
	const BIT_USED_FLY           ; 7

; wElite4Flags
	const_def
	const BIT_UNUSED_BEAT_ELITE_4 ; 0
	const BIT_STARTED_ELITE_4     ; 1

; wMovementFlags
	const_def
	const BIT_STANDING_ON_DOOR ; 0
	const BIT_EXITING_DOOR     ; 1
	const BIT_STANDING_ON_WARP ; 2
	const_skip 3               ; 3-5 ; unused
	const BIT_LEDGE_OR_FISHING ; 6
	const BIT_SPINNING         ; 7

; hFindPathFlags
	const_def
	const BIT_PATH_FOUND_Y ; 0
	const BIT_PATH_FOUND_X ; 1

; hNPCPlayerRelativePosFlags
	const_def
	const BIT_PLAYER_LOWER_Y ; 0
	const BIT_PLAYER_LOWER_X ; 1

;;;;;;;;;; PureRGBnote: ADDED: New constants for all the new options that appear in the new options menus. 
;;;;;;;;;;                     Controls which bits they use in the options wram variables.

; wOptions2

DEF PALETTES_DEFAULT    EQU  %00 ; 0 
DEF PALETTES_SGB        EQU  %01 ; 1
DEF PALETTES_SGB2       EQU  %01000001
DEF PALETTES_YELLOW     EQU  %11 ; 3
DEF PALETTES_YELLOW2    EQU  %01000011

	const_def 2 ; first two bits are the palette options above
	const BIT_ALT_PKMN_PALETTES  ; 2
	const BIT_AUDIO_PAN          ; 3
	const BIT_BIKE_MUSIC         ; 4
	const BIT_GBC_FADE           ; 5
	const BIT_SECONDARY_PALETTES ; 6 ; if set, changes SGB to SGB2, or Yellow to Yellow2 palettes.
	const BIT_MUSIC              ; 7

; wOptions3
	const_def
	const BIT_GHOST_PSYCHIC    ; 0
	const BIT_ICE_FIRE         ; 1
	const BIT_BUG_PSN          ; 2
	const BIT_PSN_BUG          ; 3
	const BIT_EXP_BAR          ; 4
	const BIT_NPC_STAT_EXP     ; 5
	const BIT_NPC_PP           ; 6
	; unused bit 7

; wSpriteOptions
	const_def
	const BIT_SQUIRTLE_SPRITE  ; 0
	const BIT_BLASTOISE_SPRITE ; 1
	const BIT_PIDGEOT_SPRITE   ; 2
	const BIT_BULBASAUR_SPRITE ; 3
	const BIT_GOLBAT_SPRITE    ; 4
	const BIT_MANKEY_SPRITE    ; 5
	const BIT_ARCANINE_SPRITE  ; 6
	const BIT_MEWTWO_SPRITE    ; 7

; wSpriteOptions2
	const_def  
	const BIT_BACK_SPRITES     ; 0
	const BIT_NIDORINO_SPRITE  ; 1
	const BIT_EXEGGUTOR_SPRITE ; 2
	const BIT_MENU_ICON_SPRITES ; 3
	const BIT_ELECTABUZZ_SPRITE ; 4
	const BIT_RATICATE_SPRITE   ; 5
	const BIT_NEW_TITLE_SCREEN ; 6 ; TODO: not implemented yet
	const BIT_SKIP_INTRO       ; 7 ; TODO: not implemented yet 

; wSpriteOptions3
	const_def
	const BIT_PIDGEOTTO_SPRITE  ; 0
	const BIT_BUTTERFREE_SPRITE ; 1
	const BIT_GENGAR_SPRITE     ; 2
	const BIT_ONIX_SPRITE       ; 3
	const BIT_VOLTORB_SPRITE    ; 4
	const BIT_KOFFING_SPRITE    ; 5
	const BIT_ABRA_SPRITE       ; 6
	const BIT_EXEGGCUTE_SPRITE  ; 7

; wSpriteOptions4
	const_def
	const BIT_KADABRA_SPRITE    ; 0
	const BIT_TENTACRUEL_SPRITE ; 1
	const BIT_GRAVELER_SPRITE   ; 2
	const BIT_MACHOP_SPRITE     ; 3
	const BIT_PINSIR_SPRITE     ; 4
	const BIT_ZAPDOS_SPRITE     ; 5
	const BIT_CLOYSTER_SPRITE   ; 6
	const BIT_STARMIE_SPRITE    ; 7


; wNewInGameFlags
	const_def
	const IN_GAME
	const IN_POKEMART_MENU

;;;;;;;;;;