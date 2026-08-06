; SGB System commands (see https://gbdev.io/pandocs/SGB_Command_Summary.html)

	const_def
	const CMD_PAL01    ; 00
	const CMD_PAL02    ; 01
	const CMD_PAL03    ; 02
	const CMD_PAL04    ; 03
	const CMD_ATTR_BLK ; 04
	const CMD_ATTR_LIN ; 05
	const CMD_ATTR_DIV ; 06
	const CMD_ATTR_CHR ; 07
	const CMD_SOUND    ; 08
	const CMD_SOU_TRN  ; 09
	const CMD_PAL_SET  ; 0a
	const CMD_PAL_TRN  ; 0b
	const CMD_ATRC_EN  ; 0c
	const CMD_TEST_EN  ; 0d
	const CMD_ICON_EN  ; 0e
	const CMD_DATA_SND ; 0f
	const CMD_DATA_TRN ; 10
	const CMD_MLT_REQ  ; 11
	const CMD_JUMP     ; 12
	const CMD_CHR_TRN  ; 13
	const CMD_PCT_TRN  ; 14
	const CMD_ATTR_TRN ; 15
	const CMD_ATTR_SET ; 16
	const CMD_MASK_EN  ; 17
	const CMD_OBJ_TRN  ; 18
	const CMD_PAL_PRI  ; 19

MACRO sgb_cmd
	IF _NARG > 1
		ASSERT 0 < (\2) && (\2) < 8, "Packet count must be 1-7"
		db (\1) << 3 | (\2)
	ELSE
		db (\1) << 3 | 1
	ENDC
ENDM

; SGB Multiplayer Joypad (see https://gbdev.io/pandocs/SGB_Command_Multiplayer.html)

DEF SGB_JOYP_ID_MASK = %11

	const_def 3, -1
	const SGB_PLAYER1 ; %11
	const SGB_PLAYER2 ; %10
	const SGB_PLAYER3 ; %01
	const SGB_PLAYER4 ; %00
