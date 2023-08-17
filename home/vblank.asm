VBlank::

	push af
	push bc
	push de
	push hl

	ldh a, [hLoadedROMBank]
	ld [wVBlankSavedROMBank], a

;;;;;;;;;; shinpokerednote: ADDED: set the correct backed-up bank if vblank happened during a DelayFrame function
	ld a, [wDelayFrameBank]
	and a
	jr z, .no_delay_bank
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
.no_delay_bank
;;;;;;;;;;

	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a

	ld a, [wDisableVBlankWYUpdate]
	and a
	jr nz, .ok
	ldh a, [hWY]
	ldh [rWY], a
.ok
	ld a, [hFlagsFFFA]	;see if BGMap skip has been enabled (such as when updating color )
	bit 1, a
	jr nz, .skipBGMap
	call AutoBgMapTransfer
	call VBlankCopyBgMap
	call RedrawRowOrColumn
	call VBlankCopy
	call VBlankCopyDouble
	call UpdateMovingBgTiles
.skipBGMap
	ldh a, [hFlagsFFFA]	; shinpokerednote: FIXED: see if OAM skip has been enabled (such as while overworld sprites are updating)
	bit 0, a
	jr nz, .skipOAM
	call hDMARoutine
	;shinpokerednote: FIXED: doing this in DelayFrame instead - helps avoid sprites wobbling
	;ld a, BANK(PrepareOAMData)
	;ldh [hLoadedROMBank], a
	;ld [MBC1RomBank], a
	;call PrepareOAMData

	; VBlank-sensitive operations end.
.skipOAM
	call Random

	ldh a, [hVBlankOccurred]
	and a
	jr z, .skipZeroing
	xor a
	ldh [hVBlankOccurred], a

.skipZeroing
	ldh a, [hFrameCounter]
	and a
	jr z, .skipDec
	dec a
	ldh [hFrameCounter], a

.skipDec
;;;;;;;;;; shinpokerednote: audionote: these funcs were duplicated in home/audio.asm in yellow so just call them
	farcall FadeOutAudio
	callbs Music_DoLowHealthAlarm
	callbs Audio1_UpdateMusic
;;;;;;;;;;

	farcall TrackPlayTime ; keep track of time played

	ldh a, [hDisableJoypadPolling]
	and a
	call z, ReadJoypad

	ld a, [wVBlankSavedROMBank]
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a

	pop hl
	pop de
	pop bc
	pop af
	reti


DelayFrame::
; Wait for the next vblank interrupt.
; As a bonus, this saves battery.

DEF NOT_VBLANKED EQU 1

	ld a, NOT_VBLANKED
	ldh [hVBlankOccurred], a

;;;;;;;;;; shinpokerednote FIXED: If you want to run functions in DelayFrame, then there is a need to back up the loaded bank.
; This is because it's originally assumed that you don't switch banks in DelayFrame.
	ldh a, [hLoadedROMBank]
	ld [wDelayFrameBank], a
	
	call home_PrepareOAMData
	
	xor a
	ld [wDelayFrameBank], a

	ldh a, [rLCDC]
	bit 7, a
	jp z, VBlank ;You will never enter the vblank interrupt if the LCD is disabled, so call it manually
.halt
	halt
	nop	;joenote - due to a processor bug, nop after halt is best practice
	ldh a, [hVBlankOccurred]
	and a
	jr nz, .halt
	ret
;;;;;;;;;;

home_PrepareOAMData::
;;;;;;;;;; shinpokerednote: FIXED: moved where we do PrepareOAMData to help with avoiding sprite wobble when scrolling screen
;First preserve the registers.
    push bc
    push de
    push hl
;I've labeled a free byte and utilized one of its bits as a flag for skipping OAM stuff.
    ld hl, hFlagsFFFA
;See if OAM skip has been enabled.
    bit 0, [hl]
    jr nz, .skipOAM
;If disabled, then enable it for now.
;This is so DMA transfer is skipped in case vblank triggers while PrepareOAMData is running.
    set 0, [hl]
;Now prepare the OAM data. 
    farcall PrepareOAMData
;Re-disable the OAM skip flag.
    ld hl, hFlagsFFFA
    res 0, [hl]
;Finally, pop the registers.
.skipOAM
    pop hl
    pop de
    pop bc
;Notes: 
; - A good place to test this is the row of four trainers on route 8.
; - There may be a rare 1-frame flicker due to instances where DMA transfer gets skipped for 1 frame.
; --> But trying to do DMA transfer here is worse because audio noise gets injected when drawing the screen.
; --> A real gameboy's TFT screen might be able to hide this.
;;;;;;;;;;
	ret
	