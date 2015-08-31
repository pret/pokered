TextBoxBorder::
; Draw a cxb text box at hl.

	; top row
	push hl
	ld a, "┌"
	ld [hli], a
	inc a ; ─
	call NPlaceChar
	inc a ; ┐
	ld [hl], a
	pop hl

	ld de, 20
	add hl, de

	; middle rows
.next
	push hl
	ld a, "│"
	ld [hli],a
	ld a, " "
	call NPlaceChar
	ld [hl], "│"
	pop hl

	ld de, 20
	add hl, de
	dec b
	jr nz, .next

	; bottom row
	ld a, "└"
	ld [hli], a
	ld a, "─"
	call NPlaceChar
	ld [hl], "┘"
	ret

NPlaceChar::
; Place char a c times.
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

PlaceString:: ; 1955 (0:1955)
	push hl
PlaceNextChar:: ; 1956 (0:1956)
	ld a,[de]

	cp "@"
	jr nz,.PlaceText
	ld b,h
	ld c,l
	pop hl
	ret

.PlaceText
	cp $4E
	jr nz,.next
	ld bc,SCREEN_WIDTH * 2
	ld a,[hFlags_0xFFF6]
	bit 2,a
	jr z,.next2
	ld bc,SCREEN_WIDTH
.next2
	pop hl
	add hl,bc
	push hl
	jp PlaceNextChar_inc

.next
	cp $4F
	jr nz,.next3
	pop hl
	coord hl, 1, 16
	push hl
	jp PlaceNextChar_inc

.next3 ; Check against a dictionary
	and a
	jp z,Char00
	cp $4C
	jp z,Char4C
	cp $4B
	jp z,Char4B
	cp $51
	jp z,Char51
	cp $49
	jp z,Char49
	cp $52
	jp z,Char52
	cp $53
	jp z,Char53
	cp $54
	jp z,Char54
	cp $5B
	jp z,Char5B
	cp $5E
	jp z,Char5E
	cp $5C
	jp z,Char5C
	cp $5D
	jp z,Char5D
	cp $55
	jp z,Char55
	cp $56
	jp z,Char56
	cp $57
	jp z,Char57
	cp $58
	jp z,Char58
	cp $4A
	jp z,Char4A
	cp $5F
	jp z,Char5F
	cp $59
	jp z,Char59
	cp $5A
	jp z,Char5A
	ld [hli],a
	call PrintLetterDelay
PlaceNextChar_inc:: ; 19e8 (0:19e8)
	inc de
	jp PlaceNextChar

Char00:: ; 19ec (0:19ec)
	ld b,h
	ld c,l
	pop hl
	ld de,Char00Text
	dec de
	ret

Char00Text:: ; 0x19f4 “%d ERROR.”
	TX_FAR _Char00Text
	db "@"

Char52:: ; 0x19f9 player’s name
	push de
	ld de,wPlayerName
	jr FinishDTE

Char53:: ; 19ff (0:19ff) ; rival’s name
	push de
	ld de,wRivalName
	jr FinishDTE

Char5D:: ; 1a05 (0:1a05) ; TRAINER
	push de
	ld de,Char5DText
	jr FinishDTE

Char5C:: ; 1a0b (0:1a0b) ; TM
	push de
	ld de,Char5CText
	jr FinishDTE

Char5B:: ; 1a11 (0:1a11) ; PC
	push de
	ld de,Char5BText
	jr FinishDTE

Char5E:: ; 1a17 (0:1a17) ; ROCKET
	push de
	ld de,Char5EText
	jr FinishDTE

Char54:: ; 1a1d (0:1a1d) ; POKé
	push de
	ld de,Char54Text
	jr FinishDTE

Char56:: ; 1a23 (0:1a23) ; ……
	push de
	ld de,Char56Text
	jr FinishDTE

Char4A:: ; 1a29 (0:1a29) ; PKMN
	push de
	ld de,Char4AText
	jr FinishDTE

Char59:: ; 1a2f (0:1a2f)
; depending on whose turn it is, print
; enemy active monster’s name, prefixed with “Enemy ”
; or
; player active monster’s name
; (like Char5A but flipped)
	ld a,[H_WHOSETURN]
	xor 1
	jr MonsterNameCharsCommon

Char5A:: ; 1a35 (0:1a35)
; depending on whose turn it is, print
; player active monster’s name
; or
; enemy active monster’s name, prefixed with “Enemy ”
	ld a,[H_WHOSETURN]
MonsterNameCharsCommon:: ; 1a37 (0:1a37)
	push de
	and a
	jr nz,.Enemy
	ld de,wBattleMonNick ; player active monster name
	jr FinishDTE

.Enemy
	; print “Enemy ”
	ld de,Char5AText
	call PlaceString

	ld h,b
	ld l,c
	ld de,wEnemyMonNick ; enemy active monster name

FinishDTE:: ; 1a4b (0:1a4b)
	call PlaceString
	ld h,b
	ld l,c
	pop de
	inc de
	jp PlaceNextChar

Char5CText:: ; 1a55 (0:1a55)
	db "TM@"
Char5DText:: ; 1a58 (0:1a58)
	db "TRAINER@"
Char5BText:: ; 1a60 (0:1a60)
	db "PC@"
Char5EText:: ; 1a63 (0:1a63)
	db "ROCKET@"
Char54Text:: ; 1a6a (0:1a6a)
	db "POKé@"
Char56Text:: ; 1a6f (0:1a6f)
	db "……@"
Char5AText:: ; 1a72 (0:1a72)
	db "Enemy @"
Char4AText:: ; 1a79 (0:1a79)
	db $E1,$E2,"@" ; PKMN

Char55:: ; 1a7c (0:1a7c)
	push de
	ld b,h
	ld c,l
	ld hl,Char55Text
	call TextCommandProcessor
	ld h,b
	ld l,c
	pop de
	inc de
	jp PlaceNextChar

Char55Text:: ; 1a8c (0:1a8c)
; equivalent to Char4B
	TX_FAR _Char55Text
	db "@"

Char5F:: ; 1a91 (0:1a91)
; ends a Pokédex entry
	ld [hl],"."
	pop hl
	ret

Char58:: ; 1a95 (0:1a95)
	ld a,[wLinkState]
	cp LINK_STATE_BATTLING
	jp z,Next1AA2
	ld a,$EE
	Coorda 18, 16
Next1AA2:: ; 1aa2 (0:1aa2)
	call ProtectedDelay3
	call ManualTextScroll
	ld a, " "
	Coorda 18, 16
Char57:: ; 1aad (0:1aad)
	pop hl
	ld de,Char58Text
	dec de
	ret

Char58Text:: ; 1ab3 (0:1ab3)
	db "@"

Char51:: ; 1ab4 (0:1ab4)
	push de
	ld a,$EE
	Coorda 18, 16
	call ProtectedDelay3
	call ManualTextScroll
	coord hl, 1, 13
	lb bc, 4, 18
	call ClearScreenArea
	ld c,20
	call DelayFrames
	pop de
	coord hl, 1, 14
	jp PlaceNextChar_inc

Char49:: ; 1ad5 (0:1ad5)
	push de
	ld a,$EE
	Coorda 18, 16
	call ProtectedDelay3
	call ManualTextScroll
	coord hl, 1, 10
	lb bc, 7, 18
	call ClearScreenArea
	ld c,20
	call DelayFrames
	pop de
	pop hl
	coord hl, 1, 11
	push hl
	jp PlaceNextChar_inc

Char4B:: ; 1af8 (0:1af8)
	ld a,$EE
	Coorda 18, 16
	call ProtectedDelay3
	push de
	call ManualTextScroll
	pop de
	ld a, " "
	Coorda 18, 16
	;fall through
Char4C:: ; 1b0a (0:1b0a)
	push de
	call Next1B18
	call Next1B18
	coord hl, 1, 16
	pop de
	jp PlaceNextChar_inc

Next1B18:: ; 1b18 (0:1b18)
	coord hl, 0, 14
	coord de, 0, 13
	ld b,60
.next
	ld a,[hli]
	ld [de],a
	inc de
	dec b
	jr nz,.next
	coord hl, 1, 16
	ld a, " "
	ld b,SCREEN_WIDTH - 2
.next2
	ld [hli],a
	dec b
	jr nz,.next2

	; wait five frames
	ld b,5
.WaitFrame
	call DelayFrame
	dec b
	jr nz,.WaitFrame

	ret

ProtectedDelay3:: ; 1b3a (0:1b3a)
	push bc
	call Delay3
	pop bc
	ret

TextCommandProcessor:: ; 1b40 (0:1b40)
	ld a,[wLetterPrintingDelayFlags]
	push af
	set 1,a
	ld e,a
	ld a,[$fff4]
	xor e
	ld [wLetterPrintingDelayFlags],a
	ld a,c
	ld [wUnusedCC3A],a
	ld a,b
	ld [wUnusedCC3B],a

NextTextCommand:: ; 1b55 (0:1b55)
	ld a,[hli]
	cp a, "@" ; terminator
	jr nz,.doTextCommand
	pop af
	ld [wLetterPrintingDelayFlags],a
	ret
.doTextCommand
	push hl
	cp a,$17
	jp z,TextCommand17
	cp a,$0e
	jp nc,TextCommand0B ; if a != 0x17 and a >= 0xE, go to command 0xB
; if a < 0xE, use a jump table
	ld hl,TextCommandJumpTable
	push bc
	add a
	ld b,$00
	ld c,a
	add hl,bc
	pop bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp [hl]

; draw box
; 04AAAABBCC
; AAAA = address of upper left corner
; BB = height
; CC = width
TextCommand04:: ; 1b78 (0:1b78)
	pop hl
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld c,a
	push hl
	ld h,d
	ld l,e
	call TextBoxBorder
	pop hl
	jr NextTextCommand

; place string inline
; 00{string}
TextCommand00:: ; 1b8a (0:1b8a)
	pop hl
	ld d,h
	ld e,l
	ld h,b
	ld l,c
	call PlaceString
	ld h,d
	ld l,e
	inc hl
	jr NextTextCommand

; place string from RAM
; 01AAAA
; AAAA = address of string
TextCommand01:: ; 1b97 (0:1b97)
	pop hl
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	push hl
	ld h,b
	ld l,c
	call PlaceString
	pop hl
	jr NextTextCommand

; print BCD number
; 02AAAABB
; AAAA = address of BCD number
; BB
; bits 0-4 = length in bytes
; bits 5-7 = unknown flags
TextCommand02:: ; 1ba5 (0:1ba5)
	pop hl
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	push hl
	ld h,b
	ld l,c
	ld c,a
	call PrintBCDNumber
	ld b,h
	ld c,l
	pop hl
	jr NextTextCommand

; repoint destination address
; 03AAAA
; AAAA = new destination address
TextCommand03:: ; 1bb7 (0:1bb7)
	pop hl
	ld a,[hli]
	ld [wUnusedCC3A],a
	ld c,a
	ld a,[hli]
	ld [wUnusedCC3B],a
	ld b,a
	jp NextTextCommand

; repoint destination to second line of dialogue text box
; 05
; (no arguments)
TextCommand05:: ; 1bc5 (0:1bc5)
	pop hl
	coord bc, 1, 16 ; address of second line of dialogue text box
	jp NextTextCommand

; blink arrow and wait for A or B to be pressed
; 06
; (no arguments)
TextCommand06:: ; 1bcc (0:1bcc)
	ld a,[wLinkState]
	cp a,LINK_STATE_BATTLING
	jp z,TextCommand0D
	ld a,$ee ; down arrow
	Coorda 18, 16 ; place down arrow in lower right corner of dialogue text box
	push bc
	call ManualTextScroll ; blink arrow and wait for A or B to be pressed
	pop bc
	ld a," "
	Coorda 18, 16 ; overwrite down arrow with blank space
	pop hl
	jp NextTextCommand

; scroll text up one line
; 07
; (no arguments)
TextCommand07:: ; 1be7 (0:1be7)
	ld a," "
	Coorda 18, 16 ; place blank space in lower right corner of dialogue text box
	call Next1B18 ; scroll up text
	call Next1B18
	pop hl
	coord bc, 1, 16 ; address of second line of dialogue text box
	jp NextTextCommand

; execute asm inline
; 08{code}
TextCommand08:: ; 1bf9 (0:1bf9)
	pop hl
	ld de,NextTextCommand
	push de ; return address
	jp [hl]

; print decimal number (converted from binary number)
; 09AAAABB
; AAAA = address of number
; BB
; bits 0-3 = how many digits to display
; bits 4-7 = how long the number is in bytes
TextCommand09:: ; 1bff (0:1bff)
	pop hl
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	push hl
	ld h,b
	ld l,c
	ld b,a
	and a,$0f
	ld c,a
	ld a,b
	and a,$f0
	swap a
	set BIT_LEFT_ALIGN,a
	ld b,a
	call PrintNumber
	ld b,h
	ld c,l
	pop hl
	jp NextTextCommand

; wait half a second if the user doesn't hold A or B
; 0A
; (no arguments)
TextCommand0A:: ; 1c1d (0:1c1d)
	push bc
	call Joypad
	ld a,[hJoyHeld]
	and a,A_BUTTON | B_BUTTON
	jr nz,.skipDelay
	ld c,30
	call DelayFrames
.skipDelay
	pop bc
	pop hl
	jp NextTextCommand

; plays sounds
; this actually handles various command ID's, not just 0B
; (no arguments)
TextCommand0B:: ; 1c31 (0:1c31)
	pop hl
	push bc
	dec hl
	ld a,[hli]
	ld b,a ; b = command number that got us here
	push hl
	ld hl,TextCommandSounds
.loop
	ld a,[hli]
	cp b
	jr z,.matchFound
	inc hl
	jr .loop
.matchFound
	cp a,$14
	jr z,.pokemonCry
	cp a,$15
	jr z,.pokemonCry
	cp a,$16
	jr z,.pokemonCry
	ld a,[hl]
	call PlaySound
	call WaitForSoundToFinish
	pop hl
	pop bc
	jp NextTextCommand
.pokemonCry
	push de
	ld a,[hl]
	call PlayCry
	pop de
	pop hl
	pop bc
	jp NextTextCommand

; format: text command ID, sound ID or cry ID
TextCommandSounds:: ; 1c64 (0:1c64)
	db $0B,SFX_GET_ITEM_1
	db $12,SFX_CAUGHT_MON
	db $0E,SFX_POKEDEX_RATING
	db $0F,SFX_GET_ITEM_1
	db $10,SFX_GET_ITEM_2
	db $11,SFX_GET_KEY_ITEM
	db $13,SFX_DEX_PAGE_ADDED
	db $14,NIDORINA ; used in OakSpeech
	db $15,PIDGEOT  ; used in SaffronCityText12
	db $16,DEWGONG  ; unused?

; draw ellipses
; 0CAA
; AA = number of ellipses to draw
TextCommand0C:: ; 1c78 (0:1c78)
	pop hl
	ld a,[hli]
	ld d,a
	push hl
	ld h,b
	ld l,c
.loop
	ld a,$75 ; ellipsis
	ld [hli],a
	push de
	call Joypad
	pop de
	ld a,[hJoyHeld] ; joypad state
	and a,A_BUTTON | B_BUTTON
	jr nz,.skipDelay ; if so, skip the delay
	ld c,10
	call DelayFrames
.skipDelay
	dec d
	jr nz,.loop
	ld b,h
	ld c,l
	pop hl
	jp NextTextCommand

; wait for A or B to be pressed
; 0D
; (no arguments)
TextCommand0D:: ; 1c9a (0:1c9a)
	push bc
	call ManualTextScroll ; wait for A or B to be pressed
	pop bc
	pop hl
	jp NextTextCommand

; process text commands in another ROM bank
; 17AAAABB
; AAAA = address of text commands
; BB = bank
TextCommand17:: ; 1ca3 (0:1ca3)
	pop hl
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	ld [H_LOADEDROMBANK],a
	ld [MBC1RomBank],a
	push hl
	ld l,e
	ld h,d
	call TextCommandProcessor
	pop hl
	pop af
	ld [H_LOADEDROMBANK],a
	ld [MBC1RomBank],a
	jp NextTextCommand

TextCommandJumpTable:: ; 1cc1 (0:1cc1)
	dw TextCommand00
	dw TextCommand01
	dw TextCommand02
	dw TextCommand03
	dw TextCommand04
	dw TextCommand05
	dw TextCommand06
	dw TextCommand07
	dw TextCommand08
	dw TextCommand09
	dw TextCommand0A
	dw TextCommand0B
	dw TextCommand0C
	dw TextCommand0D
