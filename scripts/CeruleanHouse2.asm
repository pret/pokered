CeruleanHouse2Script: ; 74e09 (1d:4e09)
	ld a, $1
	ld [$cf0c], a
	dec a
	ld [$cc3c], a
	ret

CeruleanHouse2TextPointers: ; 74e13 (1d:4e13)
	dw CeruleanHouse2Text1

CeruleanHouse2Text1: ; 74e15 (1d:4e15)
	db $8
	ld hl, UnnamedText_74e77
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.asm_74e23
	ld hl, UnnamedText_74e7c
	call PrintText
	ld hl, UnnamedText_74e6d
	call LoadItemList
	ld hl, $cf7b
	ld a, l
	ld [$cf8b], a
	ld a, h
	ld [$cf8c], a
	xor a
	ld [$cf93], a
	ld [$cc35], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .asm_74e60 ; 0x74e49 $15
	ld hl, Unknown_74e86
	ld a, [$cf91]
	sub $15
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jr .asm_74e23 ; 0x74e5e $c3
.asm_74e60
	xor a
	ld [wListScrollOffset], a
	ld hl, UnnamedText_74e81
	call PrintText
	jp TextScriptEnd

UnnamedText_74e6d: ; 74e6d (1d:4e6d)
	db $8,BOULDERBADGE,CASCADEBADGE,THUNDERBADGE,RAINBOWBADGE,SOULBADGE,MARSHBADGE,VOLCANOBADGE,EARTHBADGE,$FF

UnnamedText_74e77: ; 74e77 (1d:4e77)
	TX_FAR _UnnamedText_74e77
	db "@"

UnnamedText_74e7c: ; 74e7c (1d:4e7c)
	TX_FAR _UnnamedText_74e7c
	db "@"

UnnamedText_74e81: ; 74e81 (1d:4e81)
	TX_FAR _UnnamedText_74e81
	db "@"

Unknown_74e86: ; 74e86 (1d:4e86)
	dw UnnamedText_74e96
	dw UnnamedText_74e9b
	dw UnnamedText_74ea0
	dw UnnamedText_74ea5
	dw UnnamedText_74eaa
	dw UnnamedText_74eaf
	dw UnnamedText_74eb4
	dw UnnamedText_74eb9

UnnamedText_74e96: ; 74e96 (1d:4e96)
	TX_FAR _UnnamedText_74e96
	db "@"

UnnamedText_74e9b: ; 74e9b (1d:4e9b)
	TX_FAR _UnnamedText_74e9b
	db "@"

UnnamedText_74ea0: ; 74ea0 (1d:4ea0)
	TX_FAR _UnnamedText_74ea0
	db "@"

UnnamedText_74ea5: ; 74ea5 (1d:4ea5)
	TX_FAR _UnnamedText_74ea5
	db "@"

UnnamedText_74eaa: ; 74eaa (1d:4eaa)
	TX_FAR _UnnamedText_74eaa
	db "@"

UnnamedText_74eaf: ; 74eaf (1d:4eaf)
	TX_FAR _UnnamedText_74eaf
	db "@"

UnnamedText_74eb4: ; 74eb4 (1d:4eb4)
	TX_FAR _UnnamedText_74eb4
	db "@"

UnnamedText_74eb9: ; 74eb9 (1d:4eb9)
	TX_FAR _UnnamedText_74eb9
	db "@"
	
