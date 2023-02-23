; rst vectors
; PureRGBnote: CHANGED: use these rst vectors. 
; By using "rst (rst vector)" instead of "call (16-bit address)" we can reduce the size of calls to frequently used functions.

SECTION "rst0", ROM0[$0000]
_Bankswitch::
	jp Bankswitch

; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use
MartSignText::
	text_far _MartSignText
	text_end

SECTION "rst8", ROM0[$0008]
_Predef::
	jp Predef

; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use
PokemartGreetingText::
	text_far _PokemartGreetingText
	text_end

SECTION "rst10", ROM0[$0010]
_DelayFrame::
	jp DelayFrame

; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use
PokeCenterSignText::
	text_far _PokeCenterSignText
	text_end

SECTION "rst18", ROM0[$0018]
_DelayFrames::
	jp DelayFrames

; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use	
TextIDErrorText:: ; "[hSpriteIndexOrTextID] ERROR."
	text_far _TextIDErrorText
	text_end

SECTION "rst20", ROM0[$0020]
_CopyData::
	jp CopyData

; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use	
PokemonFaintedText::
	text_far _PokemonFaintedText
	text_end

SECTION "rst28", ROM0[$0028]
_PrintText::
	jp PrintText

; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use	
PlayerBlackedOutText::
	text_far _PlayerBlackedOutText
	text_end

SECTION "rst30", ROM0[$0030]
_PlaySound::
	jp PlaySound
	
; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use	
RepelWoreOffText::
	text_far _RepelWoreOffText
	text_end

SECTION "rst38", ROM0[$0038]
; PureRGBnote: MOVED: We save a lot of space by moving TextScriptEnd here and using rst TextScriptEnd to jump to it instead
TextScriptEnd:: 
	pop hl ; turn the rst call into a jp by popping off the return address
	ld hl, TextScriptEndingText
	ret
; PureRGBnote: MOVED: 3 extra bytes of space left here, may as well move something here that puts the space to some use
TMCharText:: db "TM@"



; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp VBlank

; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use	
ContCharText::
	text_far _ContCharText
	text_end

SECTION "lcd", ROM0[$0048]
; this interrupt is disabled on init, so this is a free 8 bytes to use unless we turn it on
; PureRGBnote: MOVED: 8 extra bytes of space left here, may as well move something here that puts the space to some use	
TrainerCharText:: db "TRAINER@"

SECTION "timer", ROM0[$0050]
	jp Timer
; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use	
PlacePOKeText::   db "POKé@"

SECTION "serial", ROM0[$0058]
	jp Serial
; PureRGBnote: MOVED: 5 extra bytes of space left here, may as well move something here that puts the space to some use	
TrainerFlagAction::
	predef_jump FlagActionPredef

SECTION "joypad", ROM0[$0060]
	reti


SECTION "Header", ROM0[$0100]

Start::
; Nintendo requires all Game Boy ROMs to begin with a nop ($00) and a jp ($C3)
; to the starting address.
	nop
	jp _Start

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @
