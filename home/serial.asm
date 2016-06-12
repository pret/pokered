Serial::
	push af
	push bc
	push de
	push hl
	ld a, [hSerialConnectionStatus]
	inc a
	jr z, .connectionNotYetEstablished
	ld a, [rSB]
	ld [hSerialReceiveData], a
	ld a, [hSerialSendData]
	ld [rSB], a
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .done
; using external clock
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ld [rSC], a
	jr .done
.connectionNotYetEstablished
	ld a, [rSB]
	ld [hSerialReceiveData], a
	ld [hSerialConnectionStatus], a
	cp USING_INTERNAL_CLOCK
	jr z, .usingInternalClock
; using external clock
	xor a
	ld [rSB], a
	ld a, $3
	ld [rDIV], a
.waitLoop
	ld a, [rDIV]
	bit 7, a
	jr nz, .waitLoop
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ld [rSC], a
	jr .done
.usingInternalClock
	xor a
	ld [rSB], a
.done
	ld a, $1
	ld [hSerialReceivedNewData], a
	ld a, SERIAL_NO_DATA_BYTE
	ld [hSerialSendData], a
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
	ld [hSerialIgnoringInitialData], a
.loop
	ld a, [hl]
	ld [hSerialSendData], a
	call Serial_ExchangeByte
	push bc
	ld b, a
	inc hl
	ld a, 48
.waitLoop
	dec a
	jr nz, .waitLoop
	ld a, [hSerialIgnoringInitialData]
	and a
	ld a, b
	pop bc
	jr z, .storeReceivedByte
	dec hl
	cp SERIAL_PREAMBLE_BYTE
	jr nz, .loop
	xor a
	ld [hSerialIgnoringInitialData], a
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
	ld [hSerialReceivedNewData], a
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .asm_21a7
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ld [rSC], a
.asm_21a7
	ld a, [hSerialReceivedNewData]
	and a
	jr nz, .asm_21f1
	ld a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr nz, .asm_21cc
	call IsUnknownCounterZero
	jr z, .asm_21cc
	call WaitLoop_15Iterations
	push hl
	ld hl, wUnknownSerialCounter + 1
	inc [hl]
	jr nz, .asm_21c3
	dec hl
	inc [hl]
.asm_21c3
	pop hl
	call IsUnknownCounterZero
	jr nz, .asm_21a7
	jp SetUnknownCounterToFFFF
.asm_21cc
	ld a, [rIE]
	and (1 << SERIAL) | (1 << TIMER) | (1 << LCD_STAT) | (1 << VBLANK)
	cp (1 << SERIAL)
	jr nz, .asm_21a7
	ld a, [wUnknownSerialCounter2]
	dec a
	ld [wUnknownSerialCounter2], a
	jr nz, .asm_21a7
	ld a, [wUnknownSerialCounter2 + 1]
	dec a
	ld [wUnknownSerialCounter2 + 1], a
	jr nz, .asm_21a7
	ld a, [hSerialConnectionStatus]
	cp USING_EXTERNAL_CLOCK
	jr z, .asm_21f1
	ld a, 255
.waitLoop
	dec a
	jr nz, .waitLoop
.asm_21f1
	xor a
	ld [hSerialReceivedNewData], a
	ld a, [rIE]
	and (1 << SERIAL) | (1 << TIMER) | (1 << LCD_STAT) | (1 << VBLANK)
	sub (1 << SERIAL)
	jr nz, .asm_2204
	ld [wUnknownSerialCounter2], a
	ld a, $50
	ld [wUnknownSerialCounter2 + 1], a
.asm_2204
	ld a, [hSerialReceiveData]
	cp SERIAL_NO_DATA_BYTE
	ret nz
	call IsUnknownCounterZero
	jr z, .asm_221f
	push hl
	ld hl, wUnknownSerialCounter + 1
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .asm_2219
	dec [hl]
.asm_2219
	pop hl
	call IsUnknownCounterZero
	jr z, SetUnknownCounterToFFFF
.asm_221f
	ld a, [rIE]
	and (1 << SERIAL) | (1 << TIMER) | (1 << LCD_STAT) | (1 << VBLANK)
	cp (1 << SERIAL)
	ld a, SERIAL_NO_DATA_BYTE
	ret z
	ld a, [hl]
	ld [hSerialSendData], a
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
	ld [hSerialIgnoringInitialData], a
.loop
	call DelayFrame
	ld a, [hl]
	ld [hSerialSendData], a
	call Serial_ExchangeByte
	ld b, a
	inc hl
	ld a, [hSerialIgnoringInitialData]
	and a
	ld a, 0
	ld [hSerialIgnoringInitialData], a
	jr nz, .loop
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

Serial_PrintWaitingTextAndSyncAndExchangeNybble::
	call SaveScreenTilesToBuffer1
	callab PrintWaitingText
	call Serial_SyncAndExchangeNybble
	jp LoadScreenTilesFromBuffer1

Serial_SyncAndExchangeNybble::
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
	ld b, 10
.loop2
	call DelayFrame
	call Serial_ExchangeNybble
	dec b
	jr nz, .loop2
	ld b, 10
.loop3
	call DelayFrame
	call Serial_SendZeroByte
	dec b
	jr nz, .loop3
	ld a, [wSerialExchangeNybbleReceiveData]
	ld [wSerialSyncAndExchangeNybbleReceiveData], a
	ret

Serial_ExchangeNybble::
	call .doExchange
	ld a, [wSerialExchangeNybbleSendData]
	add $60
	ld [hSerialSendData], a
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .doExchange
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ld [rSC], a
.doExchange
	ld a, [hSerialReceiveData]
	ld [wSerialExchangeNybbleTempReceiveData], a
	and $f0
	cp $60
	ret nz
	xor a
	ld [hSerialReceiveData], a
	ld a, [wSerialExchangeNybbleTempReceiveData]
	and $f
	ld [wSerialExchangeNybbleReceiveData], a
	ret

Serial_SendZeroByte::
	xor a
	ld [hSerialSendData], a
	ld a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	ret nz
	ld a, START_TRANSFER_INTERNAL_CLOCK
	ld [rSC], a
	ret

Serial_TryEstablishingExternallyClockedConnection::
	ld a, ESTABLISH_CONNECTION_WITH_EXTERNAL_CLOCK
	ld [rSB], a
	xor a
	ld [hSerialReceiveData], a
	ld a, START_TRANSFER_EXTERNAL_CLOCK
	ld [rSC], a
	ret
