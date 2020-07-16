SSAnneKitchen_Script:
	call EnableAutoTextBoxDrawing
	ret

SSAnneKitchen_TextPointers:
	dw SSAnne6Text1
	dw SSAnne6Text2
	dw SSAnne6Text3
	dw SSAnne6Text4
	dw SSAnne6Text5
	dw SSAnne6Text6
	dw SSAnne6Text7

SSAnne6Text1:
	text_far _SSAnne6Text1
	text_end

SSAnne6Text2:
	text_far _SSAnne6Text2
	text_end

SSAnne6Text3:
	text_far _SSAnne6Text3
	text_end

SSAnne6Text4:
	text_far _SSAnne6Text4
	text_end

SSAnne6Text5:
	text_far _SSAnne6Text5
	text_end

SSAnne6Text6:
	text_far _SSAnne6Text6
	text_end

SSAnne6Text7:
	text_asm
	ld hl, SSAnne6Text_61807
	call PrintText
	ldh a, [hRandomAdd]
	bit 7, a
	jr z, .not_dialog_1
	ld hl, SSAnne6Text_6180c
	jr .done
.not_dialog_1
	bit 4, a
	jr z, .not_dialog_2
	ld hl, SSAnne6Text_61811
	jr .done
.not_dialog_2
	ld hl, SSAnne6Text_61816
.done
	call PrintText
	jp TextScriptEnd

SSAnne6Text_61807:
	text_far _SSAnne6Text_61807
	text_end

SSAnne6Text_6180c:
	text_far _SSAnne6Text_6180c
	text_end

SSAnne6Text_61811:
	text_far _SSAnne6Text_61811
	text_end

SSAnne6Text_61816:
	text_far _SSAnne6Text_61816
	text_end
