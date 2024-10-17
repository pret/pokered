; PureRGBnote: CHANGED: some of this script was optimized a bit.
MrFujisHouse_Script:
	call CheckHideMrFujiInPokemonTower
	jp EnableAutoTextBoxDrawing

MrFujisHouse_TextPointers:
	def_text_pointers
	dw_const MrFujisHouseSuperNerdText,     TEXT_MRFUJISHOUSE_SUPER_NERD
	dw_const MrFujisHouseLittleGirlText,    TEXT_MRFUJISHOUSE_LITTLE_GIRL
	dw_const MrFujisHousePsyduckText,       TEXT_MRFUJISHOUSE_PSYDUCK
	dw_const MrFujisHouseNidorinoText,      TEXT_MRFUJISHOUSE_NIDORINO
	dw_const MrFujisHouseMrFujiText,        TEXT_MRFUJISHOUSE_MR_FUJI
	dw_const MrFujisHouseMrFujiPokedexText, TEXT_MRFUJISHOUSE_POKEDEX

;;;;;;;;;; PureRGBnote: MOVED: moved this hiding routine here because it looks weird that mr fuji gets hidden before we warp to his house
CheckHideMrFujiInPokemonTower:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	CheckEvent EVENT_RESCUED_MR_FUJI
	ret z
	ld a, HS_POKEMON_TOWER_7F_MR_FUJI
	ld [wMissableObjectIndex], a
	predef_jump HideObject
;;;;;;;;;;

MrFujisHouseSuperNerdText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	ld hl, .MrFujiHadBeenPrayingText
	jr nz, .printDone
	ld hl, .MrFujiIsntHereText
.printDone
	rst _PrintText
	rst TextScriptEnd

.MrFujiIsntHereText:
	text_far _MrFujisHouseSuperNerdMrFujiIsntHereText
	text_end

.MrFujiHadBeenPrayingText:
	text_far _MrFujisHouseSuperNerdMrFujiHadBeenPrayingText
	text_end

MrFujisHouseLittleGirlText:
	text_asm
	CheckEvent EVENT_RESCUED_MR_FUJI
	ld hl, .PokemonAreNiceToHugText
	jr nz, .printDone
	ld hl, .ThisIsMrFujisHouseText
.printDone
	rst _PrintText
	rst TextScriptEnd

.ThisIsMrFujisHouseText:
	text_far _MrFujisHouseLittleGirlThisIsMrFujisHouseText
	text_end

.PokemonAreNiceToHugText:
	text_far _MrFujisHouseLittleGirlPokemonAreNiceToHugText
	text_end

MrFujisHousePsyduckText:
	text_far _MrFujisHousePsyduckText
	text_asm
	ld a, PSYDUCK
	jr MrFujisHousePlayCryDone

MrFujisHouseNidorinoText:
	text_far _MrFujisHouseNidorinoText
	text_asm
	ld a, NIDORINO
	; fall through
MrFujisHousePlayCryDone:
	call PlayCry
	rst TextScriptEnd

MrFujisHouseMrFujiText:
	text_asm
	CheckEvent EVENT_GOT_POKE_FLUTE
	ld hl, .HasMyFluteHelpedYouText
	jr nz, .printDone
	ld hl, .IThinkThisMayHelpYourQuestText
	rst _PrintText
	lb bc, POKE_FLUTE, 1
	call GiveItem
	ld hl, .PokeFluteNoRoomText
	jr nc, .printDone
	ld hl, .ReceivedPokeFluteText
	rst _PrintText
	SetEvent EVENT_GOT_POKE_FLUTE
	rst TextScriptEnd
.printDone
	rst _PrintText
	rst TextScriptEnd

.IThinkThisMayHelpYourQuestText:
	text_far _MrFujisHouseMrFujiIThinkThisMayHelpYourQuestText
	text_end

.ReceivedPokeFluteText:
	text_far _MrFujisHouseMrFujiReceivedPokeFluteText
	sound_get_key_item
	text_far _MrFujisHouseMrFujiPokeFluteExplanationText
	text_end

.PokeFluteNoRoomText:
	text_far _MrFujisHouseMrFujiPokeFluteNoRoomText
	text_end

.HasMyFluteHelpedYouText:
	text_far _MrFujisHouseMrFujiHasMyFluteHelpedYouText
	text_end

MrFujisHouseMrFujiPokedexText:
	text_far _MrFujisHouseMrFujiPokedexText
	text_end
