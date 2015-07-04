BeachHouseScript:
	call $3c29
	ret

BeachHouseTextPointers:
	dw SurfinDudeText
	dw BeachHousePikachuText
	dw BeachHouseSign1Text
	dw BeachHouseSign2Text
	dw BeachHouseSign3Text
	dw BeachHouseSign4Text

SurfinDudeText:
	TX_ASM
	ld a,[$d471]
	bit 6,a
	jr nz,.next
	ld hl,.SurfinDudeText4
	call PrintText
	jr .done
.next
	ld hl,$d492
	bit 0,[hl]
	set 0,[hl]
	jr nz,.next2
	ld hl,.SurfinDudeText1
	jr .next3
.next2
	ld hl,.SurfinDudeText3
.next3
	call PrintText
	call YesNoChoice
	ld a,[wCurrentMenuItem]
	and a
	jr nz,.xf226b
	ld a,1
	ld [$cc3c],a
	ld b,$3e
	ld hl,$4000
	call $3e84
	ld hl,$d492
	set 1,[hl]
	jr .done
.xf226b
	ld hl,.SurfinDudeText2
	call PrintText
.done
	jp TextScriptEnd

.SurfinDudeText1
	TX_FAR _SurfinDudeText1
	db "@"
.SurfinDudeText2
	TX_FAR _SurfinDudeText2
	db "@"
.SurfinDudeText3
	TX_FAR _SurfinDudeText3
	db "@"
.SurfinDudeText4
	TX_FAR _SurfinDudeText4
	db "@"

BeachHousePikachuText:
	TX_ASM
	ld hl,.BeachHousePikachuText
	call PrintText
	ld a,PIKACHU
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

.BeachHousePikachuText
	TX_FAR _BeachHousePikachuText
	db "@"

BeachHouseSign1Text:
	TX_ASM
	ld hl,.BeachHouseSign1Text2
	ld a,[$d471]
	bit 6,a
	jr z,.next
	ld hl,.BeachHouseSign1Text1
.next
	call PrintText
	jp TextScriptEnd

.BeachHouseSign1Text1
	TX_FAR _BeachHouseSign1Text1
	db "@"
.BeachHouseSign1Text2
	TX_FAR _BeachHouseSign1Text2
	db "@"

BeachHouseSign2Text:
	TX_ASM
	ld hl,.BeachHouseSign2Text2
	ld a,[$d471]
	bit 6,a
	jr z,.next
	ld hl,.BeachHouseSign2Text1
.next
	call PrintText
	jp TextScriptEnd

.BeachHouseSign2Text1
	TX_FAR _BeachHouseSign2Text1
	db "@"
.BeachHouseSign2Text2
	TX_FAR _BeachHouseSign2Text2
	db "@"

BeachHouseSign3Text:
	TX_ASM
	ld hl,.BeachHouseSign3Text2
	ld a,[$d471]
	bit 6,a
	jr z,.next
	ld hl,.BeachHouseSign3Text1
.next
	call PrintText
	jp TextScriptEnd

.BeachHouseSign3Text1
	TX_FAR _BeachHouseSign3Text1
	db "@"
.BeachHouseSign3Text2
	TX_FAR _BeachHouseSign3Text2
	db "@"

BeachHouseSign4Text:
	TX_ASM
	ld a,1
	ld [$cc3c],a
	ld a,[$d471]
	bit 6,a
	jr z,.xf2369

	ld hl,$d492
	bit 1,[hl]
	jr z,.next2
	ld a,0
	ld [$cc3c],a
.next2
	ld hl,.BeachHousePrinterText2
	call PrintText
	ld a,[$d492]
	bit 1,a
	jr z,.xf236f

	ld a,1
	ld [$cc3c],a
	ld hl,.BeachHousePrinterText3
	call PrintText
	call YesNoChoice
	ld a,[wCurrentMenuItem]
	and a
	jp z,$63d0 ; 0xf23d0
	call $36ec
	ld hl,$d72f
	set 6,[hl]
	xor a
	ld [$cfca],a
	ld hl,$510a
	ld b,$3a
	call $3e84
	call $3852
	ld hl,$d72f
	res 6,[hl]
	call $3dd8
	call $2f83
	call $3dc2
	call $36f8
	call $3ddb
	call $3de0
	ld a,1
	ld [$cfca],a
	jr .xf236f
.xf2369
	ld hl,.BeachHousePrinterText1
	call PrintText
.xf236f
	jp TextScriptEnd

.BeachHousePrinterText1
	TX_FAR _BeachHousePrinterText1
	db $d,"@"
.BeachHousePrinterText2
	TX_FAR _BeachHousePrinterText2
	db $d,"@"
.BeachHousePrinterText3
	TX_FAR _BeachHousePrinterText3
	db "@"
.xf2383
	TX_FAR _BeachHousePrinterText4
	db "@"
