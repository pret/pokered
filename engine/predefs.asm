GetPredefPointer:
; Store the contents of the register
; pairs (hl, de, bc) at wPredefRegisters.
; Then put the bank and address of predef
; wPredefID in [wPredefBank] and hl.

	ld a,h
	ld [wPredefRegisters],a
	ld a,l
	ld [wPredefRegisters + 1],a

	ld hl,wPredefRegisters + 2
	ld a,d
	ld [hli],a
	ld a,e
	ld [hli],a

	ld a,b
	ld [hli],a
	ld [hl],c

	ld hl,PredefPointers
	ld de,0

	ld a,[wPredefID]
	ld e,a
	add a
	add e
	ld e,a
	jr nc,.next
	inc d

.next
	add hl,de
	ld d,h
	ld e,l

	; get bank of predef routine
	ld a,[de]
	ld [wPredefBank],a

	; get pointer
	inc de
	ld a,[de]
	ld l,a
	inc de
	ld a,[de]
	ld h,a

	ret

PredefPointers:: ; 4fe79 (13:7e79)
; these are pointers to ASM routines.
; they appear to be used in overworld map scripts.
	add_predef DrawPlayerHUDAndHPBar
	add_predef Func_3f0c6
	add_predef Func_3f073
	add_predef ScaleSpriteByTwo
	add_predef LoadMonBackPic
	add_predef Func_79aba
	add_predef LoadMissableObjects
	add_predef HealParty
	add_predef MoveAnimation; 08 play move animation
	add_predef DivideBCDPredef
	add_predef DivideBCDPredef2
	add_predef AddBCDPredef
	add_predef SubBCDPredef
	add_predef DivideBCDPredef3
	add_predef DivideBCDPredef4
	add_predef InitPlayerData
	add_predef FlagActionPredef
	add_predef HideObject
	add_predef IsObjectHidden
	add_predef ApplyOutOfBattlePoisonDamage
	add_predef AnyPartyAlive
	add_predef ShowObject
	add_predef ShowObject2
	add_predef ReplaceTileBlock
	add_predef InitPlayerData2
	add_predef LoadTilesetHeader
	add_predef LearnMoveFromLevelUp
	add_predef LearnMove
	add_predef IsItemInBag_
	dbw $03,CheckForHiddenObjectOrBookshelfOrCardKeyDoor ; for these two, the bank number is actually 0
	dbw $03,GiveItem
	add_predef ChangeBGPalColor0_4Frames
	add_predef FindPathToPlayer
	add_predef Func_480ff
	add_predef CalcPositionOfPlayerRelativeToNPC
	add_predef ConvertNPCMovementDirectionsToJoypadMasks
	add_predef Func_48125
	add_predef UpdateHPBar
	add_predef HPBarLength
	add_predef Diploma_TextBoxBorder
	add_predef DoubleOrHalveSelectedStats
	add_predef ShowPokedexMenu
	add_predef EvolutionAfterBattle
	add_predef SaveSAVtoSRAM0
	add_predef InitOpponent
	add_predef CableClub_Run
	add_predef DrawBadges
	add_predef Func_410f3
	add_predef BattleTransition
	add_predef CopyTileIDsFromList
	add_predef PlayIntro
	add_predef Func_79869
	add_predef FlashScreen
	add_predef GetTileAndCoordsInFrontOfPlayer
	add_predef StatusScreen
	add_predef StatusScreen2
	add_predef Func_410e2
	add_predef TrainerEngage
	add_predef IndexToPokedex
	add_predef Predef3B; 3B display pic?
	add_predef UsedCut
	add_predef ShowPokedexData
	add_predef WriteMonMoves
	add_predef SaveSAV
	add_predef LoadSGB
	add_predef MarkTownVisitedAndLoadMissableObjects
	add_predef SetPartyMonTypes
	add_predef CanLearnTM
	add_predef TMToMove
	add_predef Func_71ddf
	add_predef StarterDex ; 46
	add_predef _AddPartyMon
	add_predef UpdateHPBar2
	add_predef DrawEnemyHUDAndHPBar
	add_predef LoadTownMap_Nest
	add_predef PrintMonType
	add_predef EmotionBubble; 4C player exclamation
	add_predef EmptyFunc3; return immediately
	add_predef AskName
	add_predef PewterGuys
	add_predef SaveSAVtoSRAM2
	add_predef LoadSAVCheckSum2
	add_predef LoadSAV
	add_predef SaveSAVtoSRAM1
	add_predef DoInGameTradeDialogue ; 54 initiate trade
	add_predef HallOfFamePC
	add_predef DisplayDexRating
	dbw $1E, _LeaveMapAnim ; wrong bank
	dbw $1E, EnterMapAnim ; wrong bank
	add_predef GetTileTwoStepsInFrontOfPlayer
	add_predef CheckForCollisionWhenPushingBoulder
	add_predef PrintStrengthTxt
	add_predef PickupItem
	add_predef PrintMoveType
	add_predef LoadMovePPs
	add_predef DrawHP ; 5F
	add_predef DrawHP2
	add_predef Func_1c9c6
	add_predef OaksAideScript
