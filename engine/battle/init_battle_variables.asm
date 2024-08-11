InitBattleVariables:
	ldh a, [hTileAnimations]
	ld [wSavedTileAnimations], a
	xor a
	ld [wActionResultOrTookBattleTurn], a
	ld [wBattleResult], a
	ld hl, wPartyAndBillsPCSavedMenuItem
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wListScrollOffset], a
	ld [wCriticalHitOrOHKO], a
	ld [wBattleMonSpecies], a
	ld [wPartyGainExpFlags], a
	ld [wPlayerMonNumber], a
	ld [wEscapedFromBattle], a
	ld [wMapPalOffset], a
;;;;;;;;;; PureRGBnote: ADDED: clear various new AI-related variables.
	ld [wAIMoveSpamAvoider], a
	ld [wEnemyLastSelectedMove], a
	ld [wPlayerLastSelectedMove], a
	ld [wEnemyLastSelectedMoveDisable], a
	ld [wPlayerLastSelectedMoveDisable], a
	ld [wAITargetMonType1], a
	ld [wAITargetMonType2], a
	ld [wAITargetMonStatus], a
	ld [wPokedexDataFlags], a
	ld [wBattleFunctionalFlags], a
	ld a, [wAIWhichPokemonSentOutAlready]
	and $81	;clear bits 1 to 6 only by ANDing with 1000 0001
	ld [wAIWhichPokemonSentOutAlready], a
	xor a
;;;;;;;;;;
	ld hl, wPlayerHPBarColor
	ld [hli], a ; wPlayerHPBarColor
	ld [hl], a ; wEnemyHPBarColor
	ld hl, wCanEvolveFlags
	ld b, wMiscBattleDataEnd - wMiscBattleData
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	inc a ; POUND
	ld [wTestBattlePlayerSelectedMove], a
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	jr c, .notSafariBattle
	cp SAFARI_ZONE_CENTER_REST_HOUSE
	jr nc, .notSafariBattle
;;;;;;;;;; PureRGBnote: ADDED: we can be in the safari zone maps but without safari zone battles depending on the type of safari.
	ld a, [wSafariType]
	and a
	jr nz, .notSafariBattle ; only Classic safari type uses original safari battles
;;;;;;;;;;
	ld a, BATTLE_TYPE_SAFARI
	ld [wBattleType], a
.notSafariBattle
	jpfar PlayBattleMusic
