SafariZoneCheck::
	CheckEventHL EVENT_IN_SAFARI_ZONE ; if we are not in the Safari Zone,
	jr z, SafariZoneGameStillGoing ; don't bother printing game over text
;;;;;;;;;; PureRGBnote: ADDED: free roam safari doesn't end based on steps
	ld a, [wSafariType]
	cp SAFARI_TYPE_FREE_ROAM ; in Classic and Ranger Hunt, when safari ball counter reaches 0 (which in ranger hunt is the "Rangers Left" counter essentially) we end the safari.
	jr z, SafariZoneGameStillGoing ; if we're in a Free Roam safari game, we can't game over from 0 safari balls since there aren't any.
;;;;;;;;;;
	ld a, [wNumSafariBalls]
	and a
	jr z, SafariZoneGameOver
	jr SafariZoneGameStillGoing

SafariZoneCheckSteps::
IF DEF(_DEBUG)
	call DebugPressedOrHeldB
	ret nz
ENDC
;;;;;;;;;; PureRGBnote: ADDED: free roam safari doesn't end based on steps
	ld a, [wSafariType]
	cp SAFARI_TYPE_FREE_ROAM
	ret z ; if we're in a free roam safari, there's no game over caused by step limit.
;;;;;;;;;;
	bc_deref_reverse wSafariSteps ; a = c after this
	or b
	jr z, SafariZoneGameOver
	dec bc
	ld a, b
	ld [wSafariSteps], a
	ld a, c
	ld [wSafariSteps + 1], a
SafariZoneGameStillGoing:
	xor a
	ld [wSafariZoneGameOver], a
	ret

SafariZoneGameOver:
	call EnableAutoTextBoxDrawing
	xor a
	ld [wAudioFadeOutControl], a
	dec a ; SFX_STOP_ALL_MUSIC
	rst _PlaySound
	ld c, BANK(SFX_Safari_Zone_PA)
	ld a, SFX_SAFARI_ZONE_PA
	call PlayMusic
.waitForMusicToPlay
	ld a, [wChannelSoundIDs + CHAN5]
	cp SFX_SAFARI_ZONE_PA
	jr nz, .waitForMusicToPlay
;;;;;;;;;; PureRGBnote: ADDED: special ending text if we completed ranger hunt safari game
	ld a, [wSafariType]
	and a
	jr nz, .rangerHuntDone ; if we finished a Ranger Hunt game (wSafariType = 1) we will display different ending text
.noRangerHuntSuccess	
	ld a, TEXT_SAFARI_GAME_OVER
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	jr .doneSafari
.rangerHuntDone	
	ld a, [wNumRangersLeft]
	and a
	jr nz, .noRangerHuntSuccess ; if wNumRangersLeft isn't 0, display the normal game over text
	; otherwise we've defeated all the rangers and have won the safari game
.rangerHuntSuccess
	ld a, TEXT_RANGER_SAFARI_GAME_OVER
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.doneSafari	
;;;;;;;;;;
	xor a
	ld [wPlayerMovingDirection], a
	ld a, SAFARI_ZONE_GATE
	ldh [hWarpDestinationMap], a
	ld a, $3
	ld [wDestinationWarpID], a
	ld a, SCRIPT_SAFARIZONEGATE_LEAVING_SAFARI
	ld [wSafariZoneGateCurScript], a
	SetEvent EVENT_SAFARI_GAME_OVER
	ld a, 1
	ld [wSafariZoneGameOver], a
	ret

PrintSafariGameOverText::
	xor a
	ld [wJoyIgnore], a
	ld hl, SafariGameOverText
	jp PrintText

PrintRangerSafariGameOverText::
	xor a
	ld [wJoyIgnore], a
	ld hl, SafariRangerHuntSuccessText
	jp PrintText

SafariGameOverText:
	text_asm
	ld a, [wNumSafariBalls]
	and a
	jr z, .noMoreSafariBalls
	ld hl, TimesUpText
	rst _PrintText
.noMoreSafariBalls
	ld hl, GameOverText
	rst _PrintText
	rst TextScriptEnd

SafariRangerHuntSuccessText::
	text_far _RangerHuntSuccessText
	sound_get_item_2
	text_end	

; PureRGBnote: ADDED: used when leaving the safari zone by flying, teleporting, blacking out, etc.
;                     clears all variables related to the safari game you were in
ClearSafariFlags::
	ResetEvents EVENT_SAFARI_GAME_OVER, EVENT_IN_SAFARI_ZONE
	xor a
	ld [wSafariType], a
	ld [wNumSafariBalls], a
	ld [wSafariSteps], a
	ld [wSafariZoneGameOver], a 
	ld [wSafariZoneGateCurScript], a ; SCRIPT_SAFARIZONEGATE_DEFAULT
	ret

TimesUpText:
	text_far _TimesUpText
	text_end

GameOverText:
	text_far _GameOverText
	text_end

; PureRGBnote: ADDED: decrements the number of rangers left once you beat one.
RangerPostBattle::
	ld a, [wIsInBattle] 
	cp $ff ; if you lost the battle don't decrement and return
	ret z
	ld hl, wNumRangersLeft
	dec [hl]
	xor a
	ld [wCurMapScript], a
	ret