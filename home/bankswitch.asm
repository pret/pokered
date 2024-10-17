BankswitchHome::
; switches to bank # in a
; Only use this when in the home bank!
	ld [wBankswitchHomeTemp], a
	ldh a, [hLoadedROMBank]
	ld [wBankswitchHomeSavedROMBank], a
	ld a, [wBankswitchHomeTemp]
	jr SetCurBank

BankswitchBack::
; returns from BankswitchHome
	ld a, [wBankswitchHomeSavedROMBank]
	jr SetCurBank

Bankswitch::
; self-contained bankswitch, use this when not in the home bank
; switches to the bank in b
	ldh a, [hLoadedROMBank]
	push af
	ld a, b
	call SetCurBank
	call hl_caller
	pop bc
	ld a, b
BankswitchCommon:: ; shinpokerednote: audionote: gbcnote: new function jump address from yellow
SetCurBank:: ; PureRGBnote: CHANGED: a lot of functions in home bank ran the next 2 lines of code, we can save a lot of space in home by simply calling this subroutine instead.
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

hl_caller::
	jp hl
