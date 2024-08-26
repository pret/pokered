CONSTANT equ 42
PRINTLN $ff00 + CONSTANT

SECTION "Overreading much?", ROM0[0]

	jp $ff00 + CONSTANT
	jp $ff00 + carryOnPlease
	jp $ff00+CONSTANT
	jp $ff00+carryOnPlease

carryOnPlease:
