; PureRGBnote: ADDED: code for the new basement below the viridian schoolhouse. Contains a couple of classrooms.

ViridianSchoolHouseB1F_Script:
	jp EnableAutoTextBoxDrawing

ViridianSchoolHouseB1F_TextPointers:
	dw SchoolB1FGuyNearStairs
	dw SchoolB1FRightTeacher
	dw SchoolB1FLittleGirl
	dw SchoolB1FNerd
	dw SchoolB1FLeftTeacher
	dw SchoolB1FStudentTeacher
	dw SchoolB1FDaisyTutor
	dw SchoolB1FTuteeLeft
	dw SchoolB1FTuteeRight
	dw SchoolB1FRocker
	dw SchoolB1FBrunetteGirl
	dw SchoolB1FGameboyKid
	dw SchoolB1FBottomLeftNotebook
	dw SchoolB1FBottomCenterNotebook
	dw SchoolB1FLeftTuteeNotebook
	dw SchoolB1FTutorNotebook
	dw SchoolB1FRockerNotebook
	dw SchoolB1FBrunetteGirlNotebook
	dw SchoolB1FNerdNotebook
	dw SchoolB1FBottomRightNotebook
	dw SchoolB1FLeftBlackboard
	dw SchoolB1FRightBlackboard
	dw SchoolB1FLeftClassroomSign
	dw SchoolB1FRightClassroomSign
	dw SchoolB1FLeftPoster
	dw SchoolB1FRightPoster

SchoolB1FGuyNearStairs:
	text_far _SchoolB1FGuyNearStairs
	text_end

SchoolB1FRightTeacher:
	text_far _SchoolB1FRightTeacher
	text_end

SchoolB1FLittleGirl:
	text_far _SchoolB1FLittleGirlProdigy
	text_end

SchoolB1FNerd:
	text_asm
	ld a, 3
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld hl, SchoolB1FNerdText
	call PrintText
	ld a, 3
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld a, [wSpriteOptions2]
  	bit 4, a
  	ld hl, SchoolB1FLittleGirlRetort2Text
  	jr z, .ghostWeak
  	ld hl, SchoolB1FLittleGirlRetortText
 .ghostWeak
  	call PrintText
	ld a, 4
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld c, 20
  	call DelayFrames
	ld a, 4
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld a, 3
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld hl, SchoolB1FNerdSilence
  	call PrintText
	ld a, 3
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld hl, SchoolB1FLittleGirlBro
  	call PrintText
	ld a, 4
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld hl, SchoolB1FNerdAck
  	call PrintText
  	jp TextScriptEnd

SchoolB1FNerdText:
	text_far _SchoolB1FNerd
	text_end

SchoolB1FLittleGirlRetortText:
	text_far _SchoolB1FLittleGirlRetort
	text_end

SchoolB1FLittleGirlRetort2Text:
	text_far _SchoolB1FLittleGirlRetort2
	text_end

SchoolB1FNerdSilence:
	text_far _SchoolB1FNerdSilence
	text_end

SchoolB1FLittleGirlBro:
	text_far _SchoolB1FLittleGirlBro
	text_end

SchoolB1FNerdAck:
	text_far _SchoolB1FNerdAck
	text_end



SchoolB1FLeftTeacher:
	text_asm
	ld hl, SchoolB1FLeftTeacherInit
	CheckEvent EVENT_GOT_OAKS_PARCEL
	jr z, .noParcel
	CheckEvent EVENT_GOT_POKEDEX
	jr z, .noPokedex
	CheckEvent EVENT_CHECKED_AROUND_SCHOOLHOUSE
	jp z, .checkFirst
	CheckEvent EVENT_GOT_MOVEDEX
	jr nz, .gotMoveDex
	call SaveScreenTilesToBuffer2
	ld hl, SchoolB1FLeftTeacherReadyStart
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .notReady

	ld c, BANK(Music_MuseumGuy)
	ld a, MUSIC_MUSEUM_GUY
	call PlayMusic

	ld hl, SchoolB1FLeftTeacherReadyYes
	call PrintText

	call SchoolB1FMovedexTest
	jp c, .doneResetMusic
	call LoadScreenTilesFromBuffer2
	ld hl, SchoolB1FLeftTeacherQuizFinish
	call PrintText
	call StopAllMusic
	ld hl, ReceivedMovedexText
	call PrintText
	SetEvent EVENT_GOT_MOVEDEX
	call PlayDefaultMusic
	ld hl, SchoolB1FLeftTeacherQuizFinalInfo
	call PrintText
	jr .done
.noParcel
	call PrintText
	ld hl, SchoolB1FLeftTeacherNoParcel
	call PrintText
	jr .later
.noPokedex
	call PrintText
	ld hl, SchoolB1FLeftTeacherNoPokedex
	call PrintText
	jr .later
.gotMoveDex
	ld hl, SchoolB1FLeftTeacherQuizFinalInfoPrompt
	call PrintText
	ld hl, SchoolB1FLeftTeacherEnd
	call PrintText
	jr .done
.notReady
	ld hl, SchoolB1FLeftTeacherReadyNo
	call PrintText
	jr .done
.checkFirst
	ld hl, SchoolB1FLeftTeacherFirst
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .faffing
	ld hl, SchoolB1FLeftTeacherYes
	call PrintText
	SetEvent EVENT_CHECKED_AROUND_SCHOOLHOUSE
	jr .done
.faffing
	ld hl, SchoolB1FLeftTeacherNo
	call PrintText
	jr .done
.later
	ld hl, SchoolB1FLeftTeacherLater
	call PrintText
	jr .done
.doneResetMusic
	call PlayDefaultMusic
.done
	jp TextScriptEnd


SchoolB1FLeftTeacherInit:
	text_far _SchoolB1FLeftTeacherInit
	text_end

SchoolB1FLeftTeacherNoParcel:
	text_far _SchoolB1FLeftTeacherNoParcel
	text_end

SchoolB1FLeftTeacherNoPokedex:
	text_far _SchoolB1FLeftTeacherNoPokedex
	text_end

SchoolB1FLeftTeacherLater:
	text_far _SchoolB1FLeftTeacherLater
	text_end

SchoolB1FLeftTeacherFirst:
	text_far _SchoolB1FLeftTeacherFirst
	text_end

SchoolB1FLeftTeacherNo:
	text_far _SchoolB1FLeftTeacherNo
	text_end

SchoolB1FLeftTeacherYes:
	text_far _SchoolB1FLeftTeacherYes
	text_end

SchoolB1FLeftTeacherReadyStart:
	text_far _SchoolB1FLeftTeacherReadyStart
	text_end

SchoolB1FLeftTeacherReadyYes:
	text_far _SchoolB1FLeftTeacherReadyYes
	text_end

SchoolB1FLeftTeacherReadyNo:
	text_far _SchoolB1FLeftTeacherReadyNo
	text_end



SchoolB1FStudentTeacher:
	text_far _SchoolB1FStudentTeacher
	text_end

SchoolB1FDaisyTutor:
	text_far _SchoolB1FTutorText
	text_end

SchoolB1FTuteeLeft:
	text_far _SchoolB1FLeftTuteeText
	text_end

SchoolB1FTuteeRight:
	text_far _SchoolB1FRightTuteeText
	text_end




SchoolB1FRocker:
	text_asm
	call SaveScreenTilesToBuffer2
	ld hl, SchoolB1FRockerText
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, SchoolB1FRockerYesText
	jr z, .yes
	ld hl, SchoolB1FRockerNoText
.yes
	call PrintText

	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic

	ld c, 160
	call DelayFrames

	ld c, BANK(Music_TrainerBattle)
	ld a, MUSIC_TRAINER_BATTLE
	call PlayMusic

	predef BattleTransition

	ld c, 120
	call DelayFrames
	call LoadScreenTilesFromBuffer2
	call StopAllMusic
	call GBPalNormal
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	call UpdateSprites

	ld c, BANK(SFX_Safari_Zone_PA)
	ld a, SFX_SAFARI_ZONE_PA
	call PlayMusic

	ld c, 60
	call DelayFrames
	ld hl, SchoolB1FRockerDetentionText
	call PrintText


	call GBFadeOutToWhite
	ld c, 20
	call DelayFrames
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_DETENTION
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_DETENTION2
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_B1F_DETENTION
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_B1F_DETENTION2
	ld [wMissableObjectIndex], a
	predef ShowObject
	SetEvent EVENT_GUS_IN_DETENTION
	call UpdateSprites
	call GBFadeInFromWhite

	call PlayDefaultMusic

	jp TextScriptEnd

SchoolB1FRockerText:
	text_far _SchoolB1FRocker
	text_end

SchoolB1FRockerYesText:
	text_far _SchoolB1FRockerYes
	text_end

SchoolB1FRockerNoText:
	text_far _SchoolB1FRockerNo
	text_end

SchoolB1FRockerDetentionText:
	text_far _SchoolB1FDetentionText
	text_end




SchoolB1FBrunetteGirl:
	text_asm
	ld b, 2
.loop
	push bc
	ld a, 11
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	call UpdateSprites
  	ld c, 20
  	call DelayFrames
	ld a, 11
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	call UpdateSprites
  	ld c, 20
  	call DelayFrames
  	pop bc
  	dec b
  	jr nz, .loop

	ld a, 11
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection

  	ld hl, SchoolB1FBrunetteGirlText
  	call PrintText

	ld c, 60
	call DelayFrames

	ld c, BANK(SFX_Safari_Zone_PA)
	ld a, SFX_SAFARI_ZONE_PA
	call PlayMusic

	ld c, 60
	call DelayFrames
	ld hl, SchoolB1FDetention2Text
	call PrintText
	ld a, 11
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld hl, SchoolB1FNotAgainText
	call PrintText
	ld c, 20
	call DelayFrames

	call GBFadeOutToWhite
	ld c, 20
	call DelayFrames
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_DETENTION
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_DETENTION2
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_B1F_DETENTION
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_B1F_DETENTION2
	ld [wMissableObjectIndex], a
	predef HideObject
	ResetEvent EVENT_GUS_IN_DETENTION
	call UpdateSprites
	call GBFadeInFromWhite

	jp TextScriptEnd

SchoolB1FBrunetteGirlText:
	text_far _SchoolB1FBrunetteGirl
	text_end

SchoolB1FDetention2Text:
	text_far _SchoolB1FDetention2Text
	text_end

SchoolB1FNotAgainText:
	text_far _SchoolB1FNotAgainText
	text_end

SchoolB1FGameboyKid:
	text_far _SchoolB1FCornerGameboyKid
	text_end

; objects in the room that generate text

SchoolB1FBottomLeftNotebook:
	text_far _SchoolB1FBottomLeftNotebook
	text_end

SchoolB1FLeftTuteeNotebook:
	text_far _SchoolB1FLeftTuteeNotebook
	text_end

SchoolB1FTutorNotebook:
	text_far _SchoolB1FTutorNotebook
	text_end

SchoolB1FLeftBlackboard:
	text_far _SchoolB1FLeftBlackboard
	text_end

SchoolB1FRightBlackboard:
	text_far _SchoolB1FRightBlackboard
	text_end

SchoolB1FNerdNotebook:
	text_asm
	ld hl, SchoolB1FNerdNotebookInit
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
.loop
	ld hl, SchoolB1FNerdNotebookRepeat
	call PrintText
	ld hl, StatTextList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	callfar DisplayMultiChoiceMenu
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jr nz, .done
	ld hl, SchoolB1FNerdNotebookTextPointers
	ld a, [wCurrentMenuItem]
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jr .loop
.done
	ld hl, SchoolB1FDone
	call PrintText
	jp TextScriptEnd

SchoolB1FNerdNotebookInit:
	text_far _SchoolB1FNerdTextbook
	text_end

SchoolB1FNerdNotebookRepeat:
	text_far _SchoolB1FNerdNotebookRepeat
	text_end

SchoolB1FNerdNotebookTextPointers:
	dw SchoolB1FNerdNotebookHP
	dw SchoolB1FNerdNotebookAttack
	dw SchoolB1FNerdNotebookDefense
	dw SchoolB1FNerdNotebookSpeed
	dw SchoolB1FNerdNotebookSpecial

SchoolB1FNerdNotebookHP:
	text_far _SchoolB1FNerdNotebookHP
	text_end

SchoolB1FNerdNotebookAttack:
	text_far _SchoolB1FNerdNotebookAttack
	text_end

SchoolB1FNerdNotebookDefense:
	text_far _SchoolB1FNerdNotebookDefense
	text_end

SchoolB1FNerdNotebookSpeed:
	text_far _SchoolB1FNerdNotebookSpeed
	text_end

SchoolB1FNerdNotebookSpecial:
	text_far _SchoolB1FNerdNotebookSpecial
	text_end

SchoolB1FDone:
	text_far _VendingMachineText8
	text_end

SchoolB1FBottomRightNotebook:
	text_far _SchoolB1FBottomRightNotebook
	text_end

SchoolB1FBottomCenterNotebook:
	text_far _SchoolB1FBottomCenterNotebook
	text_end

SchoolB1FRockerNotebook:
	text_far _SchoolB1FRockerNotebook
	text_end

SchoolB1FBrunetteGirlNotebook:
	text_far _SchoolB1FBrunetteGirlNotebook
	text_end

SchoolB1FLeftClassroomSign:
	text_far _SchoolB1FLeftClassroomSign
	text_end

SchoolB1FRightClassroomSign:
	text_far _SchoolB1FRightClassroomSign
	text_end

SchoolB1FRightPoster:
	text_far _SchoolB1FRightPoster
	text_end

SchoolB1FLeftPoster:
	text_far _SchoolB1FLeftPoster
	text_end

SchoolB1FMovedexTest:
	ld hl, MovedexTestQuestionList
.questionLoop
	push hl
	call LoadScreenTilesFromBuffer2
	pop hl
	xor a
	ld [wCurrentMenuItem], a
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	pop hl
	call DoMoveDexTestQuestion
	jr nz, .incorrect
	push hl
	call WaitForSoundToFinish
	ld a, SFX_GET_ITEM_1
	call PlaySound
	call WaitForSoundToFinish
	ld hl, SchoolB1FLeftTeacherQuizCorrect
	call PrintText 
	pop hl
	inc hl
	ld a, [hl]
	cp $fe
	jr z, .quickAttackComment
	cp $ff
	jr nz, .questionLoop
	and a
	ret
.quickAttackComment
	inc hl
	push hl
	ld hl, SchoolB1FLeftTeacherQuizQuickAttack
	call PrintText
	pop hl
	jr .questionLoop
.incorrect
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	ld hl, SchoolB1FLeftTeacherQuizIncorrect
	call PrintText
	scf
	ret

; returns z if they got the right answer
DoMoveDexTestQuestion:
	inc hl
	inc hl
	ld a, A_BUTTON
	ld [wMenuWatchedKeys], a
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	callfar DisplayMultiChoiceMenu
	ld a, [wCurrentMenuItem]
	ld b, a
	pop hl
	inc hl
	inc hl
	ld a, [hl] ; answer number
	dec a ; answer menu index
	cp b
	ret

MovedexTestQuestionList:
	dw SchoolB1FLeftTeacherQuizQuestion1
	dw MoveDexQuestion1
	db 3 ; answer
	dw SchoolB1FLeftTeacherQuizQuestion2
	dw MoveDexQuestion2
	db 2 ; answer
	db $fe
	dw SchoolB1FLeftTeacherQuizQuestion3
	dw MoveDexQuestion3
	db 1 ; answer
	dw SchoolB1FLeftTeacherQuizQuestion4
	dw MoveDexQuestion4
	db 2 ; answer
	dw SchoolB1FLeftTeacherQuizQuestion5
	dw MoveDexQuestion5
	db 4 ; answer
	db -1

SchoolB1FLeftTeacherQuizQuestion1:
	text_far _SchoolB1FLeftTeacherQuizQuestion1
	text_end

SchoolB1FLeftTeacherQuizQuestion2:
	text_far _SchoolB1FLeftTeacherQuizQuestion2
	text_end

SchoolB1FLeftTeacherQuizQuickAttack:
	text_far _SchoolB1FLeftTeacherQuizQuickAttack
	text_end

SchoolB1FLeftTeacherQuizQuestion3:
	text_far _SchoolB1FLeftTeacherQuizQuestion3
	text_end

SchoolB1FLeftTeacherQuizQuestion4:
	text_far _SchoolB1FLeftTeacherQuizQuestion4
	text_end

SchoolB1FLeftTeacherQuizQuestion5:
	text_far _SchoolB1FLeftTeacherQuizQuestion5
	text_end

SchoolB1FLeftTeacherQuizCorrect:
	text_far _SchoolB1FLeftTeacherQuizCorrect
	text_end

SchoolB1FLeftTeacherQuizIncorrect:
	text_far _SchoolB1FLeftTeacherQuizWrong
	text_end

SchoolB1FLeftTeacherQuizFinish:
	text_far _SchoolB1FLeftTeacherQuizFinish
	text_end

ReceivedMovedexText:
	text_far _ReceivedMovedexText
	sound_get_item_2
	text_promptbutton
	text_end

SchoolB1FLeftTeacherQuizFinalInfo:
	text_far _SchoolB1FLeftTeacherQuizFinalInfo
	text_end


SchoolB1FLeftTeacherQuizFinalInfoPrompt:
	text_far _SchoolB1FLeftTeacherQuizFinalInfo
	text_promptbutton
	text_end

SchoolB1FLeftTeacherEnd:
	text_far _SchoolB1FLeftTeacherEnd
	text_end

