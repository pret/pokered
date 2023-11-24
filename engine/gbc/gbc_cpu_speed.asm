; shinpokerednote: ADDED: code that sets the GBC to use 2x CPU mode when desired.

;Sets 1x CPU speed if we're on GBC
GBCSetCPU1xSpeed::
	ldh a, [hGBC]
	and a
	ret z ; double speed is only a GBC feature
	ldh a, [rKEY1]
	and %10000000
	jr nz, ToggleCPUSpeed
	ret
;Set 2x cpu speed if we're on GBC
GBCSetCPU2xSpeed::
	ldh a, [hGBC]
	and a
	ret z ; double speed is only a GBC feature
	ldh a, [rKEY1]
	and %10000000
	ret nz
	; fall through
;Toggles between 2x and 1x cpu speed
ToggleCPUSpeed:
	di
	ldh a, [rIE]
	push af
	xor a
	ldh [rIE], a
	ldh [rIF], a
	ld a, $30
	ldh [rJOYP], a
	ld a, $01
	ldh [rKEY1], a
	stop
	pop af
	ldh [rIE], a
	reti