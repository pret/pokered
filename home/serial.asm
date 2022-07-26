Serial::
	push af
	push bc
	push de
	push hl
	ldh a, [hSerialConnectionStatus]
	inc a
	jr z, .connectionNotYetEstablished
	ldh a, [rSB]
	ldh [hSerialReceiveData], a
	ldh a, [hSerialSendData]
	ldh [rSB], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .done
; using external clock
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ldh [rSC], a
	jr .done
.connectionNotYetEstablished
	ldh a, [rSB]
	ldh [hSerialReceiveData], a
	ldh [hSerialConnectionStatus], a
	cp USING_INTERNAL_CLOCK
	jr z, .usingInternalClock
; using external clock
	xor a
	ldh [rSB], a
	ld a, $3
	ldh [rDIV], a
.waitLoop
	ldh a, [rDIV]
	bit 7, a
	jr nz, .waitLoop
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ldh [rSC], a
	jr .done
.usingInternalClock
	xor a
	ldh [rSB], a
.done
	ld a, $1
	ldh [hSerialReceivedNewData], a
	ld a, SERIAL_NO_DATA_BYTE
	ldh [hSerialSendData], a
	pop hl
	pop de
	pop bc
	pop af
	reti

; hl = send data
; de = receive data
; bc = length of data
Serial_ExchangeBytes::
	ld a, 1
	ldh [hSerialIgnoringInitialData], a
.loop
	ld a, [hl]
	ldh [hSerialSendData], a
	call Serial_ExchangeByte
	push bc
	ld b, a
	inc hl
	ld a, 48
.waitLoop
	dec a
	jr nz, .waitLoop
	ldh a, [hSerialIgnoringInitialData]
	and a
	ld a, b
	pop bc
	jr z, .storeReceivedByte
	dec hl
	cp SERIAL_PREAMBLE_BYTE
	jr nz, .loop
	xor a
	ldh [hSerialIgnoringInitialData], a
	jr .loop
.storeReceivedByte
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Serial_ExchangeByte::
	xor a
	ldh [hSerialReceivedNewData], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .loop
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ldh [rSC], a
.loop
	ldh a, [hSerialReceivedNewData]
	and a
	jr nz, .ok
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr nz, .doNotIncrementUnknownCounter
	call IsUnknownCounterZero
	jr z, .doNotIncrementUnknownCounter
	call WaitLoop_15Iterations
	push hl
	ld hl, wUnknownSerialCounter + 1
	inc [hl]
	jr nz, .noCarry
	dec hl
	inc [hl]
.noCarry
	pop hl
	call IsUnknownCounterZero
	jr nz, .loop
	jp SetUnknownCounterToFFFF
.doNotIncrementUnknownCounter
	ldh a, [rIE]
	and (1 << SERIAL) | (1 << TIMER) | (1 << LCD_STAT) | (1 << VBLANK)
	cp (1 << SERIAL)
	jr nz, .loop
	ld a, [wUnknownSerialCounter2]
	dec a
	ld [wUnknownSerialCounter2], a
	jr nz, .loop
	ld a, [wUnknownSerialCounter2 + 1]
	dec a
	ld [wUnknownSerialCounter2 + 1], a
	jr nz, .loop
	ldh a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .ok
	ld a, 255
.waitLoop
	dec a
	jr nz, .waitLoop
.ok
	xor a
	ldh [hSerialReceivedNewData], a
	ldh a, [rIE]
	and (1 << SERIAL) | (1 << TIMER) | (1 << LCD_STAT) | (1 << VBLANK)
	sub (1 << SERIAL)
	jr nz, .skipReloadingUnknownCounter2
	ld [wUnknownSerialCounter2], a
	ld a, $50
	ld [wUnknownSerialCounter2 + 1], a
.skipReloadingUnknownCounter2
	ldh a, [hSerialReceiveData]
	cp SERIAL_NO_DATA_BYTE
	ret nz
	call IsUnknownCounterZero
	jr z, .done
	push hl
	ld hl, wUnknownSerialCounter + 1
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .noBorrow
	dec [hl]
.noBorrow
	pop hl
	call IsUnknownCounterZero
	jr z, SetUnknownCounterToFFFF
.done
	ldh a, [rIE]
	and (1 << SERIAL) | (1 << TIMER) | (1 << LCD_STAT) | (1 << VBLANK)
	cp (1 << SERIAL)
	ld a, SERIAL_NO_DATA_BYTE
	ret z
	ld a, [hl]
	ldh [hSerialSendData], a
	call DelayFrame
	jp Serial_ExchangeByte

WaitLoop_15Iterations::
	ld a, 15
.waitLoop
	dec a
	jr nz, .waitLoop
	ret

IsUnknownCounterZero::
	push hl
	ld hl, wUnknownSerialCounter
	ld a, [hli]
	or [hl]
	pop hl
	ret

; a is always 0 when this is called
SetUnknownCounterToFFFF::
	dec a
	ld [wUnknownSerialCounter], a
	ld [wUnknownSerialCounter + 1], a
	ret

; This is used to exchange the button press and selected menu item on the link menu.
; The data is sent thrice and read twice to increase reliability.
Serial_ExchangeLinkMenuSelection::
	ld hl, wLinkMenuSelectionSendBuffer
	ld de, wLinkMenuSelectionReceiveBuffer
	ld c, 2 ; number of bytes to save
	ld a, 1
	ldh [hSerialIgnoringInitialData], a
.loop
	call DelayFrame
	ld a, [hl]
	ldh [hSerialSendData], a
	call Serial_ExchangeByte
	ld b, a
	inc hl
	ldh a, [hSerialIgnoringInitialData]
	and a
	ld a, 0
	ldh [hSerialIgnoringInitialData], a
	jr nz, .loop
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

Serial_PrintWaitingTextAndSyncAndExchangeNybble::
	call SaveScreenTilesToBuffer1
	callfar PrintWaitingText
	call Serial_SyncAndExchangeNybble
	jp LoadScreenTilesFromBuffer1

Serial_SyncAndExchangeNybble::
	vc_hook Wireless_WaitLinkTransfer
	ld a, $ff
	ld [wSerialExchangeNybbleReceiveData], a
.loop1
	call Serial_ExchangeNybble
	call DelayFrame
	call IsUnknownCounterZero
	jr z, .next1
	push hl
	ld hl, wUnknownSerialCounter + 1
	dec [hl]
	jr nz, .next2
	dec hl
	dec [hl]
	jr nz, .next2
	pop hl
	xor a
	jp SetUnknownCounterToFFFF
.next2
	pop hl
.next1
	ld a, [wSerialExchangeNybbleReceiveData]
	inc a
	jr z, .loop1
	vc_patch Wireless_net_delay_3
IF DEF(_RED_VC) || DEF(_BLUE_VC)
	ld b, 26
ELSE
	ld b, 10
ENDC
	vc_patch_end
.loop2
	call DelayFrame
	call Serial_ExchangeNybble
	dec b
	jr nz, .loop2
	vc_patch Wireless_net_delay_4
IF DEF(_RED_VC) || DEF(_BLUE_VC)
	ld b, 26
ELSE
	ld b, 10
ENDC
	vc_patch_end
.loop3
	call DelayFrame
	call Serial_SendZeroByte
	dec b
	jr nz, .loop3
	ld a, [wSerialExchangeNybbleReceiveData]
	ld [wSerialSyncAndExchangeNybbleReceiveData], a
	vc_hook Wireless_WaitLinkTransfer_ret
	ret

Serial_ExchangeNybble::
	call .doExchange
	ld a, [wSerialExchangeNybbleSendData]
	add $60
	ldh [hSerialSendData], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .doExchange
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ldh [rSC], a
.doExchange
	ldh a, [hSerialReceiveData]
	ld [wSerialExchangeNybbleTempReceiveData], a
	and $f0
	cp $60
	ret nz
	xor a
	ldh [hSerialReceiveData], a
	ld a, [wSerialExchangeNybbleTempReceiveData]
	and $f
	ld [wSerialExchangeNybbleReceiveData], a
	ret

Serial_SendZeroByte::
	xor a
	ldh [hSerialSendData], a
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret nz
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ldh [rSC], a
	ret

Serial_TryEstablishingExternallyClockedConnection::
	ld a, ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK
	ldh [rSB], a
	xor a
	ldh [hSerialReceiveData], a
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ldh [rSC], a
	ret
