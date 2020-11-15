SaffronPidgeyHouse_Script:
	jp EnableAutoTextBoxDrawing

SaffronPidgeyHouse_TextPointers:
	dw SaffronHouse1Text1
	dw SaffronHouse1Text2
	dw SaffronHouse1Text3
	dw SaffronHouse1Text4

SaffronHouse1Text1:
	text_far _SaffronHouse1Text1
	text_end

SaffronHouse1Text2:
	text_far _SaffronHouse1Text2
	text_asm
	ld a, PIDGEY
	call PlayCry
	jp TextScriptEnd

SaffronHouse1Text3:
	text_far _SaffronHouse1Text3
	text_end

SaffronHouse1Text4:
	text_far _SaffronHouse1Text4
	text_end
