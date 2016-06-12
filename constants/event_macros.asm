;\1 = event index
;\2 = return result in carry instead of zero flag
CheckEvent: MACRO
event_byte = ((\1) / 8)
	ld a, [wEventFlags + event_byte]

	IF _NARG > 1
		IF ((\1) % 8) == 7
			add a
		ELSE
			REPT ((\1) % 8) + 1
				rrca
			ENDR
		ENDC
	ELSE
		bit (\1) % 8, a
	ENDC
	ENDM

;\1 = event index
CheckEventReuseA: MACRO
	IF event_byte != ((\1) / 8)
event_byte = ((\1) / 8)
		ld a, [wEventFlags + event_byte]
	ENDC

	bit (\1) % 8, a
	ENDM

;\1 = event index
;\2 = event index of the last event used before the branch
CheckEventAfterBranchReuseA: MACRO
event_byte = ((\2) / 8)
	IF event_byte != ((\1) / 8)
event_byte = ((\1) / 8)
		ld a, [wEventFlags + event_byte]
	ENDC

	bit (\1) % 8, a
	ENDM

;\1 = reg
;\2 = event index
;\3 = event index this event is relative to (optional, this is needed when there is a fixed flag address)
EventFlagBit: MACRO
	IF _NARG > 2
		ld \1, ((\3) % 8) + ((\2) - (\3))
	ELSE
		ld \1, (\2) % 8
	ENDC
	ENDM

;\1 = reg
;\2 = event index
EventFlagAddress: MACRO
event_byte = ((\2) / 8)
	ld \1, wEventFlags + event_byte
	ENDM

;\1 = event index
CheckEventHL: MACRO
event_byte = ((\1) / 8)
	ld hl, wEventFlags + event_byte
	bit (\1) % 8, [hl]
	ENDM

;\1 = event index
CheckEventReuseHL: MACRO
IF event_byte != ((\1) / 8)
event_byte = ((\1) / 8)
		ld hl, wEventFlags + event_byte
	ENDC

	bit (\1) % 8, [hl]
	ENDM

; dangerous, only use when HL is guaranteed to be the desired value
;\1 = event index
CheckEventForceReuseHL: MACRO
event_byte = ((\1) / 8)
	bit (\1) % 8, [hl]
	ENDM

;\1 = event index
;\2 = event index of the last event used before the branch
CheckEventAfterBranchReuseHL: MACRO
event_byte = ((\2) / 8)
IF event_byte != ((\1) / 8)
event_byte = ((\1) / 8)
		ld hl, wEventFlags + event_byte
	ENDC

	bit (\1) % 8, [hl]
	ENDM

;\1 = event index
CheckAndSetEvent: MACRO
event_byte = ((\1) / 8)
	ld hl, wEventFlags + event_byte
	bit (\1) % 8, [hl]
	set (\1) % 8, [hl]
	ENDM

;\1 = event index
CheckAndResetEvent: MACRO
event_byte = ((\1) / 8)
	ld hl, wEventFlags + event_byte
	bit (\1) % 8, [hl]
	res (\1) % 8, [hl]
	ENDM

;\1 = event index
CheckAndSetEventA: MACRO
	ld a, [wEventFlags + ((\1) / 8)]
	bit (\1) % 8, a
	set (\1) % 8, a
	ld [wEventFlags + ((\1) / 8)], a
	ENDM

;\1 = event index
CheckAndResetEventA: MACRO
	ld a, [wEventFlags + ((\1) / 8)]
	bit (\1) % 8, a
	res (\1) % 8, a
	ld [wEventFlags + ((\1) / 8)], a
	ENDM

;\1 = event index
SetEvent: MACRO
event_byte = ((\1) / 8)
	ld hl, wEventFlags + event_byte
	set (\1) % 8, [hl]
	ENDM

;\1 = event index
SetEventReuseHL: MACRO
	IF event_byte != ((\1) / 8)
event_byte = ((\1) / 8)
		ld hl, wEventFlags + event_byte
	ENDC

	set (\1) % 8, [hl]
	ENDM

;\1 = event index
;\2 = event index of the last event used before the branch
SetEventAfterBranchReuseHL: MACRO
event_byte = ((\2) / 8)
IF event_byte != ((\1) / 8)
event_byte = ((\1) / 8)
		ld hl, wEventFlags + event_byte
	ENDC

	set (\1) % 8, [hl]
	ENDM

; dangerous, only use when HL is guaranteed to be the desired value
;\1 = event index
SetEventForceReuseHL: MACRO
event_byte = ((\1) / 8)
	set (\1) % 8, [hl]
	ENDM

;\1 = event index
;\2 = event index
;\3, \4, ... = additional (optional) event indices
SetEvents: MACRO
	SetEvent \1
	rept (_NARG + -1)
	SetEventReuseHL \2
	shift
	endr
	ENDM

;\1 = event index
ResetEvent: MACRO
event_byte = ((\1) / 8)
	ld hl, wEventFlags + event_byte
	res (\1) % 8, [hl]
	ENDM

;\1 = event index
ResetEventReuseHL: MACRO
	IF event_byte != ((\1) / 8)
event_byte = ((\1) / 8)
		ld hl, wEventFlags + event_byte
	ENDC

	res (\1) % 8, [hl]
	ENDM

;\1 = event index
;\2 = event index of the last event used before the branch
ResetEventAfterBranchReuseHL: MACRO
event_byte = ((\2) / 8)
IF event_byte != ((\1) / 8)
event_byte = ((\1) / 8)
		ld hl, wEventFlags + event_byte
	ENDC

	res (\1) % 8, [hl]
	ENDM

; dangerous, only use when HL is guaranteed to be the desired value
;\1 = event index
ResetEventForceReuseHL: MACRO
event_byte = ((\1) / 8)
	res (\1) % 8, [hl]
	ENDM

;\1 = event index
;\2 = event index
;\3 = event index (optional)
ResetEvents: MACRO
	ResetEvent \1
	rept (_NARG + -1)
	ResetEventReuseHL \2
	shift
	endr
	ENDM

;\1 = event index
;\2 = number of bytes away from the base address (optional, for matching the ROM)
dbEventFlagBit: MACRO
	IF _NARG > 1
		db ((\1) % 8) + ((\2) * 8)
	ELSE
		db ((\1) % 8)
	ENDC
	ENDM

;\1 = event index
;\2 = number of bytes away from the base address (optional, for matching the ROM)
dwEventFlagAddress: MACRO
	IF _NARG > 1
		dw wEventFlags + ((\1) / 8) - (\2)
	ELSE
		dw wEventFlags + ((\1) / 8)
	ENDC
	ENDM

;\1 = start
;\2 = end
SetEventRange: MACRO
event_start_byte = ((\1) / 8)
event_end_byte = ((\2) / 8)

	IF event_end_byte < event_start_byte
		FAIL "Incorrect argument order in SetEventRange."
	ENDC

	IF event_start_byte == event_end_byte
		ld a, [wEventFlags + event_start_byte]
		or (1 << (((\2) % 8) + 1)) - (1 << ((\1) % 8))
		ld [wEventFlags + event_start_byte], a
	ELSE
event_fill_start = event_start_byte + 1
event_fill_count = event_end_byte - event_start_byte - 1

		IF ((\1) % 8) == 0
event_fill_start = event_fill_start + -1
event_fill_count = event_fill_count + 1
		ELSE
			ld a, [wEventFlags + event_start_byte]
			or $ff - ((1 << ((\1) % 8)) - 1)
			ld [wEventFlags + event_start_byte], a
		ENDC

		IF ((\2) % 8) == 7
event_fill_count = event_fill_count + 1
		ENDC

		IF event_fill_count == 1
			ld hl, wEventFlags + event_fill_start
			ld [hl], $ff
		ENDC

		IF event_fill_count > 1
			ld a, $ff
			ld hl, wEventFlags + event_fill_start

			REPT event_fill_count + -1
				ld [hli], a
			ENDR

			ld [hl], a
		ENDC

		IF ((\2) % 8) == 0
			ld hl, wEventFlags + event_end_byte
			set 0, [hl]
		ELSE
			IF ((\2) % 8) != 7
				ld a, [wEventFlags + event_end_byte]
				or (1 << (((\2) % 8) + 1)) - 1
				ld [wEventFlags + event_end_byte], a
			ENDC
		ENDC
	ENDC
	ENDM

;\1 = start
;\2 = end
;\3 = assume a is 0 if present
ResetEventRange: MACRO
event_start_byte = ((\1) / 8)
event_end_byte = ((\2) / 8)

	IF event_end_byte < event_start_byte
		FAIL "Incorrect argument order in ResetEventRange."
	ENDC

	IF event_start_byte == event_end_byte
		ld a, [wEventFlags + event_start_byte]
		and ~((1 << (((\2) % 8) + 1)) - (1 << ((\1) % 8))) & $ff
		ld [wEventFlags + event_start_byte], a
	ELSE
event_fill_start = event_start_byte + 1
event_fill_count = event_end_byte - event_start_byte - 1

		IF ((\1) % 8) == 0
event_fill_start = event_fill_start + -1
event_fill_count = event_fill_count + 1
		ELSE
			ld a, [wEventFlags + event_start_byte]
			and ~($ff - ((1 << ((\1) % 8)) - 1)) & $ff
			ld [wEventFlags + event_start_byte], a
		ENDC

		IF ((\2) % 8) == 7
event_fill_count = event_fill_count + 1
		ENDC

		IF event_fill_count == 1
			ld hl, wEventFlags + event_fill_start
			ld [hl], 0
		ENDC

		IF event_fill_count > 1
			ld hl, wEventFlags + event_fill_start

			; force xor a if we just to wrote to it above
			IF (_NARG < 3) || (((\1) % 8) != 0)
				xor a
			ENDC

			REPT event_fill_count + -1
				ld [hli], a
			ENDR

			ld [hl], a
		ENDC

		IF ((\2) % 8) == 0
			ld hl, wEventFlags + event_end_byte
			res 0, [hl]
		ELSE
			IF ((\2) % 8) != 7
				ld a, [wEventFlags + event_end_byte]
				and ~((1 << (((\2) % 8) + 1)) - 1) & $ff
				ld [wEventFlags + event_end_byte], a
			ENDC
		ENDC
	ENDC
	ENDM

; returns whether both events are set in Z flag
; This is counter-intuitive because the other event checks set the Z flag when
; the event is not set, but this sets the Z flag when the event is set.
;\1 = event index 1
;\2 = event index 2
;\3 = try to reuse a (optional)
CheckBothEventsSet: MACRO
	IF ((\1) / 8) == ((\2) / 8)
		IF (_NARG < 3) || (((\1) / 8) != event_byte)
event_byte = ((\1) / 8)
			ld a, [wEventFlags + ((\1) / 8)]
		ENDC
		and (1 << ((\1) % 8)) | (1 << ((\2) % 8))
		cp (1 << ((\1) % 8)) | (1 << ((\2) % 8))
	ELSE
		; This case doesn't happen in the original ROM.
		IF ((\1) % 8) == ((\2) % 8)
			push hl
			ld a, [wEventFlags + ((\1) / 8)]
			ld hl, wEventFlags + ((\2) / 8)
			and [hl]
			cpl
			bit ((\1) % 8), a
			pop hl
		ELSE
			push bc
			ld a, [wEventFlags + ((\1) / 8)]
			and (1 << ((\1) % 8))
			ld b, a
			ld a, [wEventFlags + ((\2) / 8)]
			and (1 << ((\2) % 8))
			or b
			cp (1 << ((\1) % 8)) | (1 << ((\2) % 8))
			pop bc
		ENDC
	ENDC
	ENDM

; returns the complement of whether either event is set in Z flag
;\1 = event index 1
;\2 = event index 2
CheckEitherEventSet: MACRO
	IF ((\1) / 8) == ((\2) / 8)
		ld a, [wEventFlags + ((\1) / 8)]
		and (1 << ((\1) % 8)) | (1 << ((\2) % 8))
	ELSE
		; This case doesn't happen in the original ROM.
		IF ((\1) % 8) == ((\2) % 8)
			push hl
			ld a, [wEventFlags + ((\1) / 8)]
			ld hl, wEventFlags + ((\2) / 8)
			or [hl]
			bit ((\1) % 8), a
			pop hl
		ELSE
			push bc
			ld a, [wEventFlags + ((\1) / 8)]
			and (1 << ((\1) % 8))
			ld b, a
			ld a, [wEventFlags + ((\2) / 8)]
			and (1 << ((\2) % 8))
			or b
			pop bc
		ENDC
	ENDC
	ENDM

; for handling fixed event bits when events are inserted/removed
;\1 = event index
;\2 = fixed flag bit
AdjustEventBit: MACRO
	IF ((\1) % 8) != (\2)
		add ((\1) % 8) - (\2)
	ENDC
	ENDM
