; PureRGBnote: ADDED: code for the new basement below the viridian schoolhouse. Contains a couple of classrooms.

ViridianSchoolHouseB1F_Script:
	call CheckGusGLeaves
	jp EnableAutoTextBoxDrawing

CheckGusGLeaves:
	CheckEvent EVENT_DETENTION_TOGGLER
	ret z
	ResetEvent EVENT_DETENTION_TOGGLER
	; show jen
	call GBFadeOutToWhite
	ld c, 20
	rst _DelayFrames
	call SetDetentionHideShows
	call UpdateSprites
	call Delay3
	call GBFadeInFromWhite
	CheckEvent EVENT_GUS_IN_DETENTION
	ret z
	jp PlayDefaultMusic

SetDetentionHideShows::
	CheckEvent EVENT_GUS_IN_DETENTION
	jr z, .hideGus
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_DETENTION
	ld [wMissableObjectIndex], a
	predef ShowExtraObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_DETENTION2
	ld [wMissableObjectIndex], a
	predef HideExtraObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_B1F_DETENTION
	ld [wMissableObjectIndex], a
	predef ShowExtraObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_B1F_DETENTION2
	ld [wMissableObjectIndex], a
	predef HideExtraObject
	ResetEvent EVENT_GUS_IN_DETENTION
	ret
.hideGus
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_DETENTION
	ld [wMissableObjectIndex], a
	predef HideExtraObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_DETENTION2
	ld [wMissableObjectIndex], a
	predef ShowExtraObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_B1F_DETENTION
	ld [wMissableObjectIndex], a
	predef HideExtraObject
	ld a, HS_VIRIDIAN_SCHOOL_HOUSE_B1F_DETENTION2
	ld [wMissableObjectIndex], a
	predef ShowExtraObject
	SetEvent EVENT_GUS_IN_DETENTION
	ret

ViridianSchoolHouseB1F_TextPointers:
	def_text_pointers
	dw_const SchoolB1FGuyNearStairs,         TEXT_SCHOOLB1F_GUY_NEAR_STAIRS
	dw_const SchoolB1FRightTeacher,          TEXT_SCHOOLB1F_RIGHT_TEACHER
	dw_const SchoolB1FLittleGirl,            TEXT_SCHOOLB1F_LITTLE_GIRL
	dw_const SchoolB1FNerd,                  TEXT_SCHOOLB1F_NERD
	dw_const SchoolB1FLeftTeacher,           TEXT_SCHOOLB1F_LEFT_TEACHER
	dw_const SchoolB1FStudentTeacher,        TEXT_SCHOOLB1F_STUDENT_TEACHER
	dw_const SchoolB1FDaisyTutor,            TEXT_SCHOOLB1F_DAISY_TUTOR
	dw_const SchoolB1FTuteeLeft,             TEXT_SCHOOLB1F_TUTEE_LEFT
	dw_const SchoolB1FTuteeRight,            TEXT_SCHOOLB1F_TUTEE_RIGHT
	dw_const SchoolB1FRocker,                TEXT_SCHOOLB1F_ROCKER
	dw_const SchoolB1FBrunetteGirl,          TEXT_SCHOOLB1F_BRUNETTE_GIRL
	dw_const SchoolB1FGameboyKid,            TEXT_SCHOOLB1F_GAMEBOY_KID
	dw_const SchoolB1FBottomLeftNotebook,    TEXT_SCHOOLB1F_BOTTOM_LEFT_NOTEBOOK
	dw_const SchoolB1FBottomCenterNotebook,  TEXT_SCHOOLB1F_BOTTOM_CENTER_NOTEBOOK
	dw_const SchoolB1FLeftTuteeNotebook,     TEXT_SCHOOLB1F_LEFT_TUTEE_NOTEBOOK
	dw_const SchoolB1FTutorNotebook,         TEXT_SCHOOLB1F_TUTOR_NOTEBOOK
	dw_const SchoolB1FRockerNotebook,        TEXT_SCHOOLB1F_ROCKER_NOTEBOOK
	dw_const SchoolB1FBrunetteGirlNotebook,  TEXT_SCHOOLB1F_BRUNETTE_GIRL_NOTEBOOK
	dw_const SchoolB1FNerdNotebook,          TEXT_SCHOOLB1F_NERD_NOTEBOOK
	dw_const SchoolB1FBottomRightNotebook,   TEXT_SCHOOLB1F_BOTTOM_RIGHT_NOTEBOOK
	dw_const SchoolB1FLeftBlackboard,        TEXT_SCHOOLB1F_LEFT_BLACKBOARD
	dw_const SchoolB1FRightBlackboard,       TEXT_SCHOOLB1F_RIGHT_BLACKBOARD
	dw_const SchoolB1FLeftClassroomSign,     TEXT_SCHOOLB1F_LEFT_CLASSROOM_SIGN
	dw_const SchoolB1FRightClassroomSign,    TEXT_SCHOOLB1F_RIGHT_CLASSROOM_SIGN
	dw_const SchoolB1FLeftPoster,            TEXT_SCHOOLB1F_LEFT_POSTER
	dw_const SchoolB1FRightPoster,           TEXT_SCHOOLB1F_RIGHT_POSTER

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
	ld a, SCHOOLB1F_LITTLE_GIRL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld hl, SchoolB1FNerdText
	rst _PrintText
	ld a, SCHOOLB1F_LITTLE_GIRL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld a, [wOptions3]
  	bit BIT_GHOST_PSYCHIC, a
  	ld hl, SchoolB1FLittleGirlRetort2Text
  	jr z, .ghostWeak
  	ld hl, SchoolB1FLittleGirlRetortText
 .ghostWeak
  	rst _PrintText
	ld a, SCHOOLB1F_NERD
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld c, 20
  	rst _DelayFrames
	ld a, SCHOOLB1F_NERD
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld a, SCHOOLB1F_LITTLE_GIRL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld hl, SchoolB1FNerdSilence
  	rst _PrintText
	ld a, SCHOOLB1F_LITTLE_GIRL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld hl, SchoolB1FLittleGirlBro
  	rst _PrintText
	ld a, SCHOOLB1F_NERD
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	ld hl, SchoolB1FNerdAck
  	rst _PrintText
  	rst TextScriptEnd

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
	rst _PrintText
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
	rst _PrintText

	call SchoolB1FMovedexTest
	jp c, .doneResetMusic
	call LoadScreenTilesFromBuffer2
	ld hl, SchoolB1FLeftTeacherQuizFinish
	rst _PrintText
	call StopAllMusic
	ld hl, ReceivedMovedexText
	rst _PrintText
	SetEvent EVENT_GOT_MOVEDEX
	call PlayDefaultMusic
	ld hl, SchoolB1FLeftTeacherQuizFinalInfo
	rst _PrintText
	jr .done
.noParcel
	rst _PrintText
	ld hl, SchoolB1FLeftTeacherNoParcel
	rst _PrintText
	jr .later
.noPokedex
	rst _PrintText
	ld hl, SchoolB1FLeftTeacherNoPokedex
	rst _PrintText
	jr .later
.gotMoveDex
	ld hl, SchoolB1FLeftTeacherQuizFinalInfoPrompt
	rst _PrintText
	ld hl, SchoolB1FLeftTeacherEnd
	rst _PrintText
	jr .done
.notReady
	ld hl, SchoolB1FLeftTeacherReadyNo
	rst _PrintText
	jr .done
.checkFirst
	ld hl, SchoolB1FLeftTeacherFirst
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .faffing
	ld hl, SchoolB1FLeftTeacherYes
	rst _PrintText
	SetEvent EVENT_CHECKED_AROUND_SCHOOLHOUSE
	jr .done
.faffing
	ld hl, SchoolB1FLeftTeacherNo
	rst _PrintText
	jr .done
.later
	ld hl, SchoolB1FLeftTeacherLater
	rst _PrintText
	jr .done
.doneResetMusic
	call PlayDefaultMusic
.done
	rst TextScriptEnd


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
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, SchoolB1FRockerYesText
	jr z, .yes
	ld hl, SchoolB1FRockerNoText
.yes
	rst _PrintText

	ld c, BANK(Music_MeetMaleTrainer)
	ld a, MUSIC_MEET_MALE_TRAINER
	call PlayMusic

	ld c, 160
	rst _DelayFrames

	ld c, BANK(Music_TrainerBattle)
	ld a, MUSIC_TRAINER_BATTLE
	call PlayMusic

	predef BattleTransition

	ld c, 120
	rst _DelayFrames
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
	rst _DelayFrames
	ld hl, SchoolB1FRockerDetentionText
	rst _PrintText
	SetEvent EVENT_DETENTION_TOGGLER
	rst TextScriptEnd

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
	ld a, SCHOOLB1F_BRUNETTE_GIRL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	call UpdateSprites
  	ld c, 20
  	rst _DelayFrames
	ld a, SCHOOLB1F_BRUNETTE_GIRL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	call UpdateSprites
  	ld c, 20
  	rst _DelayFrames
  	pop bc
  	dec b
  	jr nz, .loop

	ld a, SCHOOLB1F_BRUNETTE_GIRL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection

  	ld hl, SchoolB1FBrunetteGirlText
  	rst _PrintText

	ld c, 60
	rst _DelayFrames

	ld c, BANK(SFX_Safari_Zone_PA)
	ld a, SFX_SAFARI_ZONE_PA
	call PlayMusic

	ld c, 60
	rst _DelayFrames
	ld hl, SchoolB1FDetention2Text
	rst _PrintText
	ld a, SCHOOLB1F_BRUNETTE_GIRL
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_UP
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ld hl, SchoolB1FNotAgainText
	rst _PrintText
	SetEvent EVENT_DETENTION_TOGGLER
	rst TextScriptEnd

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
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
.loop
	ld hl, SchoolB1FNerdNotebookRepeat
	rst _PrintText
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
	rst _PrintText
	jr .loop
.done
	ld hl, SchoolB1FDone
	rst _PrintText
	rst TextScriptEnd

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
	rst _PrintText
	pop hl
	call DoMoveDexTestQuestion
	jr nz, .incorrect
	push hl
	call WaitForSoundToFinish
	ld a, SFX_GET_ITEM_1
	rst _PlaySound
	call WaitForSoundToFinish
	ld hl, SchoolB1FLeftTeacherQuizCorrect
	rst _PrintText
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
	rst _PrintText
	pop hl
	jr .questionLoop
.incorrect
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	rst _PlaySound
	call WaitForSoundToFinish
	ld hl, SchoolB1FLeftTeacherQuizIncorrect
	rst _PrintText
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

