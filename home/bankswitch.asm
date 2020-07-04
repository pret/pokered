BankswitchHome::
; switches to bank # in a
; Only use this when in the home bank!
	ld [wBankswitchHomeTemp], a
	ld a, [hLoadedROMBank]
	ld [wBankswitchHomeSavedROMBank], a
	ld a, [wBankswitchHomeTemp]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

BankswitchBack::
; returns from BankswitchHome
	ld a, [wBankswitchHomeSavedROMBank]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

Bankswitch::
; self-contained bankswitch, use this when not in the home bank
; switches to the bank in b
	ld a, [hLoadedROMBank]
	push af
	ld a, b
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld bc, .Return
	push bc
	jp hl
.Return
	pop bc
	ld a, b
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret
