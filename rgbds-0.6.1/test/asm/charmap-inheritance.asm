SECTION "test", ROM0

	newcharmap foo

	charmap "<START>",  $00
	charmap "<RAM>",    $01
	charmap "<WAIT>",   $02
	charmap "<ASM>",    $03
	charmap "<NUM>",    $04
	charmap "<EXIT>",   $05
	charmap "<SOUND>",  $06
	charmap "<DAY>",    $07
	charmap "<FAR>",    $08

	; At this point, enough nodes were allocated for 'foo' to be reallocated.
	; Its value in the charmaps' hashmap should have been updated too,
	; so that usages of 'foo' will not segfault.

	; This uses 'foo; by switching to it.
	setcharmap foo

	; This uses 'foo' by deriving another charmap from it.
	newcharmap bar, foo
