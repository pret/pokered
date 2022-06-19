IndigoPlateauLobby_Script:
	call SetLastBlackoutMap
	call Serial_TryEstablishingExternallyClockedConnection
	call EnableAutoTextBoxDrawing
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	ret z
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ld hl, wBeatLorelei
	bit 1, [hl]
	res 1, [hl]
	ret z
	; Elite 4 events
	ResetEventRange ELITE4_EVENTS_START, EVENT_LANCES_ROOM_LOCK_DOOR
	ret

IndigoPlateauLobby_TextPointers:
	dw IndigoHealNurseText
	dw IndigoPlateauGymGuideText
	dw IndigoPlateauLobbyText3
	dw IndigoCashierText
	dw IndigoTradeNurseText
	dw IndigoGymGuideSonText

IndigoHealNurseText:
	script_pokecenter_nurse

IndigoPlateauGymGuideText:
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt
	ld hl, IndigoPlateauLobbyText2getPrompt
	call PrintText
	ld hl, IndigoPlateauApexChipsAfterChamp
	call PrintText
	jr .done
.afterChamp
	CheckEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	jr nz, .quickGreet
	SetEvent EVENT_TALKED_GYM_GUIDE_AFTER_CHAMP
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt2
	ld hl, IndigoPlateauGymGuideChampGreetingPrompt
	call PrintText
	ld hl, IndigoPlateauGymGuideChampApexChips
	call PrintText
	jr .sellChips
.quickGreet
	CheckEvent EVENT_GOT_PEWTER_APEX_CHIPS ; have to hear about apex chips to receive them after that
	jr z, .donePrompt3
	ld hl, IndigoPlateauGymGuideChampAfterGreetPrompt
	call PrintText
.sellChips
	ld hl, IndigoGymGuideShop
	call DisplayPokemartNoGreeting
.done
	jp TextScriptEnd
.donePrompt
	ld hl, IndigoPlateauLobbyText2get
	call PrintText
	jr .done
.donePrompt2
	ld hl, IndigoPlateauGymGuideChampGreeting
	call PrintText
	jr .done
.donePrompt3
	ld hl, IndigoPlateauGymGuideChampAfterGreet
	call PrintText
	jr .done

IndigoGymGuideSonText:
	text_asm
	CheckEvent EVENT_BECAME_CHAMP
	jr nz, .afterChamp
	ld hl, IndigoPlateauGymGuideSonText
	call PrintText
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call nz, .noIntroduce
	call .checkIntroduce
	jr .shop1
.checkIntroduce
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call z, .introduce
	ret
.introduce
	ld hl, IndigoPlateauGymGuideSonIntro
	call PrintText
	ret
.noIntroduce
	ld hl, IndigoPlateauGymGuideSonShopStart
	call PrintText
	ret
.moreTMs
	CheckEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	ret nz
	ld hl, IndigoPlateauGymGuideSonMoreTMs
	call PrintText
	ret
.afterChamp
	ld hl, IndigoPlateauGymGuideSonChampText
	call PrintText
	call .checkIntroduce
	CheckEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	call nz, .noIntroduce 
	CheckEvent EVENT_MET_GYM_GUIDE_SON
	call nz, .moreTMs 
	SetEvent EVENT_TALKED_GYM_GUIDE_SON_AFTER_CHAMP
	jr .shop2
.shop2
	ld hl, IndigoGymGuideSonShop2
	jr .done
.shop1
	ld hl, IndigoGymGuideSonShop1
.done
	call DisplayPokemartNoGreeting
	SetEvent EVENT_MET_GYM_GUIDE_SON
	jp TextScriptEnd

IndigoPlateauLobbyText2get:
	text_far _IndigoPlateauLobbyText2
	text_end

IndigoPlateauLobbyText2getPrompt:
	text_far _IndigoPlateauLobbyText2
	text_promptbutton
	text_end

IndigoPlateauApexChipsAfterChamp:
	text_far _IndigoPlateauApexChipsAfterChamp
	text_end

IndigoPlateauLobbyText3:
	text_far _IndigoPlateauLobbyText3
	text_end

IndigoPlateauGymGuideChampGreeting:
	text_far _IndigoPlateauGymGuideChampGreeting
	text_end

IndigoPlateauGymGuideChampGreetingPrompt:
	text_far _IndigoPlateauGymGuideChampGreeting
	text_promptbutton
	text_end

IndigoPlateauGymGuideChampApexChips:
	text_far _IndigoPlateauGymGuideChampApexChips
	text_end

IndigoPlateauGymGuideChampAfterGreet:
	text_far _IndigoPlateauGymGuideChampAfterGreet
	text_end

IndigoPlateauGymGuideChampAfterGreetPrompt:
	text_far _IndigoPlateauGymGuideChampAfterGreet
	text_promptbutton
	text_end

IndigoTradeNurseText:
	text_asm
	SetEvent EVENT_BECAME_CHAMP
	jp TextScriptEnd
	;script_cable_club_receptionist
	
IndigoCashierText:
	script_mart ULTRA_BALL, GREAT_BALL, FULL_RESTORE, MAX_POTION, FULL_HEAL, REVIVE, MAX_REPEL

IndigoPlateauGymGuideSonText:
	text_far _IndigoPlateauGymGuideSonText
	text_end

IndigoPlateauGymGuideSonChampText:
	text_far _IndigoPlateauGymGuideSonChampText
	text_end

IndigoPlateauGymGuideSonIntro:
	text_far _IndigoPlateauGymGuideSonIntro
	text_end

IndigoPlateauGymGuideSonShopStart:
	text_far _IndigoPlateauGymGuideSonShopStart
	text_end

IndigoPlateauGymGuideSonMoreTMs:
	text_far _IndigoPlateauGymGuideSonMoreTMs
	text_end

IndigoGymGuideShop:
	script_mart APEX_CHIP

IndigoGymGuideSonShop1:
	script_mart TM_ICE_BEAM, TM_THUNDERBOLT, TM_EARTHQUAKE, TM_FLAMETHROWER, TM_HI_JUMP_KICK, TM_PSYCHIC_M, TM_RAZOR_LEAF, TM_ROCK_SLIDE, TM_SLUDGE, TM_DOUBLE_EDGE


IndigoGymGuideSonShop2: ; all TMs
	script_mart \
	TM_ICE_PUNCH, \
	TM_RAZOR_WIND, \
	TM_LEECH_SEED, \
	TM_PIN_MISSILE, \
	TM_FIRE_PUNCH, \
	TM_TOXIC, \
	TM_HORN_DRILL, \
	TM_BODY_SLAM, \
	TM_SLASH, \
	TM_DOUBLE_EDGE, \
	TM_BUBBLEBEAM, \
	TM_AURORA_BEAM, \
	TM_ICE_BEAM, \
	TM_BLIZZARD, \
	TM_HYPER_BEAM, \
	TM_AMNESIA, \
	TM_HI_JUMP_KICK, \
	TM_THUNDERPUNCH, \
	TM_ROLLING_KICK, \
	TM_BARRIER, \
	TM_RAZOR_LEAF, \
	TM_SOLARBEAM, \
	TM_DRAGON_RAGE, \
	TM_THUNDERBOLT, \
	TM_THUNDER, \
	TM_EARTHQUAKE, \
	TM_CRABHAMMER, \
	TM_DIG, \
	TM_PSYCHIC_M, \
	TM_MEGA_DRAIN, \
	TM_KINESIS, \
	TM_SWORDS_DANCE, \
	TM_REFLECT, \
	TM_BIDE, \
	TM_AGILITY, \
	TM_BARRAGE, \
	TM_FIRE_BLAST, \
	TM_FLAMETHROWER, \
	TM_SLAM, \
	TM_KARATE_CHOP, \
	TM_MEDITATE, \
	TM_LOVELY_KISS, \
	TM_SKY_ATTACK, \
	TM_LIGHT_SCREEN, \
	TM_THUNDER_WAVE, \
	TM_PSYBEAM, \
	TM_SLUDGE, \
	TM_ROCK_SLIDE, \
	TM_GLARE, \
	TM_SUBSTITUTE