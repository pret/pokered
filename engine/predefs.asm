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

PredefPointers: ; 4fe79 (13:7e79)
; these are pointers to ASM routines.
; they appear to be used in overworld map scripts.
	dbw BANK(Func_3cd60),Func_3cd60
	dbw BANK(Func_3f0c6),Func_3f0c6
	dbw BANK(Func_3f073),Func_3f073
	dbw BANK(ScaleSpriteByTwo), ScaleSpriteByTwo
	dbw BANK(LoadMonBackPic), LoadMonBackPic
	dbw BANK(Func_79aba),Func_79aba
	dbw BANK(Func_f132),Func_f132
HealPartyPredef: ; 4fe8e (13:7e8e)
	dbw BANK(HealParty),HealParty
MoveAnimationPredef: ; 4fe91 (13:7e91)
	dbw BANK(MoveAnimation),MoveAnimation; 08 play move animation
	dbw BANK(DivideBCDPredef),DivideBCDPredef
	dbw BANK(DivideBCDPredef),DivideBCDPredef
	dbw BANK(AddBCDPredef), AddBCDPredef
	dbw BANK(SubBCDPredef), SubBCDPredef
	dbw BANK(DivideBCDPredef),DivideBCDPredef
	dbw BANK(DivideBCDPredef),DivideBCDPredef
	dbw BANK(InitPlayerData), InitPlayerData
	dbw BANK(FlagActionPredef),FlagActionPredef
	dbw BANK(HideObject), HideObject
	dbw BANK(IsObjectHidden), IsObjectHidden
	dbw BANK(Func_c69c),Func_c69c
	dbw BANK(AnyPartyAlive), AnyPartyAlive
	dbw BANK(ShowObject), ShowObject
	dbw BANK(ShowObject), ShowObject
	dbw BANK(Func_ee9e),Func_ee9e
	dbw BANK(InitPlayerData), InitPlayerData
	dbw BANK(Func_c754),Func_c754
	dbw BANK(Func_3af5b),Func_3af5b
	dbw BANK(LearnMove),LearnMove
	dbw BANK(IsItemInBag_),IsItemInBag_ ; 1C, used in Pokémon Tower
	dbw $03,Func_3eb5 ; for these two, the bank number is actually 0
	dbw $03,GiveItem
	dbw BANK(Func_480eb),Func_480eb
	dbw BANK(Func_f8ba),Func_f8ba
	dbw BANK(Func_480ff),Func_480ff
	dbw BANK(Func_f929),Func_f929
	dbw BANK(Func_f9a0),Func_f9a0
	dbw BANK(Func_48125),Func_48125
	dbw BANK(UpdateHPBar),UpdateHPBar
	dbw BANK(HPBarLength), HPBarLength
	dbw BANK(Func_5ab0),Func_5ab0
	dbw BANK(Func_3ed02),Func_3ed02
	dbw BANK(ShowPokedexMenu), ShowPokedexMenu
	dbw BANK(Func_3ad1c),Func_3ad1c
	dbw BANK(SaveSAVtoSRAM0),SaveSAVtoSRAM0
	dbw BANK(InitOpponent),InitOpponent
	dbw BANK(Func_5a5f),Func_5a5f
	dbw BANK(DrawBadges), DrawBadges
	dbw BANK(Func_410f3),Func_410f3
	dbw BANK(BattleTransition),BattleTransition
	dbw BANK(Func_79dda),Func_79dda
	dbw BANK(PlayIntro),PlayIntro
	dbw BANK(Func_79869),Func_79869
	dbw BANK(FlashScreen), FlashScreen
	dbw BANK(Func_c586),Func_c586
	dbw BANK(StatusScreen),StatusScreen ; 37 0x12953
	dbw BANK(StatusScreen2),StatusScreen2 ; 38
	dbw BANK(Func_410e2),Func_410e2
	dbw BANK(TrainerEngage), TrainerEngage
	dbw BANK(IndexToPokedex),IndexToPokedex
	dbw BANK(Predef3B),Predef3B; 3B display pic?
	dbw BANK(UsedCut),UsedCut
	dbw BANK(ShowPokedexData),ShowPokedexData
	dbw BANK(WriteMonMoves),WriteMonMoves
	dbw BANK(SaveSAV),SaveSAV
	dbw BANK(LoadSGB), LoadSGB
	dbw BANK(Func_f113),Func_f113
	dbw BANK(SetPartyMonTypes),SetPartyMonTypes
	dbw BANK(CanLearnTM), CanLearnTM
	dbw BANK(TMToMove),TMToMove
	dbw BANK(Func_71ddf),Func_71ddf
	dbw BANK(StarterDex), StarterDex ; 46
	dbw BANK(_AddPartyMon), _AddPartyMon
	dbw BANK(UpdateHPBar),UpdateHPBar
	dbw BANK(Func_3cdec),Func_3cdec
	dbw BANK(LoadTownMap_Nest),LoadTownMap_Nest
	dbw BANK(Func_27d6b),Func_27d6b
	dbw BANK(EmotionBubble), EmotionBubble; 4C player exclamation
	dbw BANK(Func_5aaf),Func_5aaf; return immediately
	dbw BANK(AskName), AskName
	dbw BANK(PewterGuys),PewterGuys
	dbw BANK(SaveSAVtoSRAM2),SaveSAVtoSRAM2
	dbw BANK(LoadSAVCheckSum2),LoadSAVCheckSum2
	dbw BANK(LoadSAV),LoadSAV
	dbw BANK(SaveSAVtoSRAM1),SaveSAVtoSRAM1
	dbw BANK(Predef54),Predef54 ; 54 initiate trade
	dbw BANK(HallOfFamePC), HallOfFamePC
	dbw BANK(DisplayDexRating),DisplayDexRating
	dbw $1E, _LeaveMapAnim ; wrong bank
	dbw $1E, Func_70510 ; wrong bank
	dbw BANK(Func_c5be),Func_c5be
	dbw BANK(Func_c60b),Func_c60b
	dbw BANK(PrintStrengthTxt), PrintStrengthTxt
	dbw BANK(PickupItem),PickupItem
	dbw BANK(Func_27d98),Func_27d98
	dbw BANK(LoadMovePPs),LoadMovePPs
DrawHPBarPredef: ; 4ff96 (13:7f96)
	dbw BANK(Func_128ef),Func_128ef ; 5F draw HP bar
	dbw BANK(Func_128f6),Func_128f6
	dbw BANK(Func_1c9c6),Func_1c9c6
	dbw BANK(OaksAideScript),OaksAideScript
