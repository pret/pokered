; INPUT:
; [wListMenuID] = list menu ID
; [wListPointer] = address of the list (2 bytes)
DisplayListMenuID::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable auto-transfer
	ld a, 1
	ldh [hJoy7], a ; joypad state update flag
	ld a, [wBattleType]
	and a ; is it the Old Man battle?
	ld a, $01 ; hardcoded bank
	jr z, .bankswitch
	ld a, BANK(DisplayBattleMenu)
.bankswitch
	call BankswitchHome
;;;;;;;;;; PureRGBnote: ADDED: if we're in a menu that can display TM move names while scrolling over TMs, we need to save the screen tiles that
;;;;;;;;;; appear behind the TM move name window so we can close it if needed
	ld a, [wListMenuHoverTextType]
	and a
	call nz, CheckSaveHoverTextScreenTiles
;;;;;;;;;;
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl] ; turn off letter printing delay
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ld [wListCount], a
	hl_deref wListPointer
	; hl = address of the list
	ld a, [hl] ; the first byte is the number of entries in the list
	ld [wListCount], a
	ld a, LIST_MENU_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; draw the menu text box
	call UpdateSprites ; disable sprites behind the text box
; the code up to .skipMovingSprites appears to be useless
;	hlcoord 4, 2 ; coordinates of upper left corner of menu text box
;	lb de, 9, 14 ; height and width of menu text box
;	ld a, [wListMenuID]
;	and a ; PCPOKEMONLISTMENU?
;	jr nz, .skipMovingSprites
;	call UpdateSprites
;.skipMovingSprites
	ld a, 1 ; max menu item ID is 1 if the list has less than 2 entries
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wListCount]
	cp 2 ; does the list have less than 2 entries?
	jr c, .setMenuVariables
	ld a, 2 ; max menu item ID is 2 if the list has at least 2 entries
.setMenuVariables
	ld [wMaxMenuItem], a
	ld a, 4
	ld [wTopMenuItemY], a
	ld a, 5
	ld [wTopMenuItemX], a
	ld a, A_BUTTON | B_BUTTON | SELECT | START | D_LEFT ; PureRGBnote: ADDED: tracking START and Dpad Left for new functions
	ld [wMenuWatchedKeys], a
;;;;;;;;;; PureRGBnote: ADDED: code that checks if we need to adjust the offset after changing the size of the list (depositing items/pokemon)
	ld a, [wBattleType]
	and a ; is it the Old Man battle?
	call z, CheckBadOffset
;;;;;;;;;;
	call CheckForHoverText ; PureRGBnote: ADDED: check for TM text to display on initializing the table (like if the first entry is a TM)
	homecall PrepareOAMData	; shinpokerednote: gbcnote: makes mart menus cleaner by updating the OAM sprite table ahead of vblank

DisplayListMenuIDLoop::
	xor a
	ldh [hAutoBGTransferEnabled], a ; disable transfer
	call PrintListMenuEntries
	ld a, 1
	ldh [hAutoBGTransferEnabled], a ; enable transfer
	call Delay3
	ld a, [wBattleType]
	and a ; is it the Old Man battle?
	jr z, .notOldManBattle
.oldManBattle
	; we will be in BANK(DisplayBattleMenu) if old man battle so call a new function in that bank to save space in home
	call OldManListMenuInit
	jr .buttonAPressed
.notOldManBattle
	call LoadGBPal
	call HandleMenuInput
	push af
	call PlaceMenuCursor
	pop af
	call CheckButtonStartPressed ; PureRGBnote: ADDED: start button can trigger depositing items when in the item menu
	jr nc, DisplayListMenuIDLoop
	bit BIT_A_BUTTON, a
	jp z, .checkOtherKeys
.buttonAPressed
	ld a, [wCurrentMenuItem]
	call PlaceUnfilledArrowMenuCursor
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wCurrentMenuItem]
	ld c, a
	ld a, [wListScrollOffset]
	add c
	ld c, a
	ld a, [wListCount]
	and a ; is the list empty?
	jp z, ExitListMenu ; if so, exit the menu
	dec a
	cp c ; did the player select Cancel?
	jp c, ExitListMenu ; if so, exit the menu
	ld a, c
	ld [wWhichPokemon], a
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .skipMultiplying
; if it's an item menu
	sla c ; item entries are 2 bytes long, so multiply by 2
.skipMultiplying
	hl_deref wListPointer
	inc hl ; hl = beginning of list entries
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurListMenuItem], a
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr z, .pokemonList
	cp CUSTOMLISTMENU
	jr z, .skipGetName
	assert wCurListMenuItem == wCurItem
	push hl
	call GetItemPrice
	pop hl
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .skipGettingQuantity
	inc hl
	ld a, [hl] ; a = item quantity
	ld [wMaxItemQuantity], a
.skipGettingQuantity
	ld a, [wCurItem]
	ld [wNameListIndex], a
	ld a, BANK(ItemNames)
	ld [wPredefBank], a
	call GetName
	jr .storeChosenEntry
.pokemonList
	ASSERT wCurListMenuItem == wCurPartySpecies
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld hl, wPartyMonNicks
	jr z, .getPokemonName
	ld hl, wBoxMonNicks ; box pokemon names
.getPokemonName
	ld a, [wWhichPokemon]
	call GetPartyMonName
.storeChosenEntry ; store the menu entry that the player chose and return
	ld de, wNameBuffer
	call CopyToStringBuffer
.skipGetName
	ld a, CHOSE_MENU_ITEM
	ld [wMenuExitMethod], a
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	xor a
	ldh [hJoy7], a ; joypad state update flag
	ld [wListMenuHoverTextShown], a ; PureRGBnote: ADDED: once we pick a list entry, we consider TM text not shown so we will re-render it after finishing
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl] ; turn on letter printing delay
	jp BankswitchBack
.checkOtherKeys ; check B, SELECT, Up, and Down keys
	bit BIT_B_BUTTON, a
	jp nz, ExitListMenu ; if so, exit the menu
	bit BIT_SELECT, a
	jp nz, HandleItemListSwapping ; if so, allow the player to swap menu entries
	ld b, a
	bit BIT_D_LEFT, b
	jr nz, .handleListSkip ; PureRGBnote: ADDED: when pressing left we will check to skip to the top or bottom of the list
	bit BIT_D_DOWN, b
	ld hl, wListScrollOffset
	jr z, .upPressed
.downPressed
	ld a, [hl]
	add 3
	ld b, a
	ld a, [wListCount]
	cp b ; will going down scroll past the Cancel button?
	jp c, DisplayListMenuIDLoop
	inc [hl] ; if not, go down
	call CheckForHoverText ; PureRGBnote: ADDED: when scrolling down the list we need to load TM text if we scrolled over one
	jp DisplayListMenuIDLoop
.upPressed
	ld a, [hl]
	and a
	jp z, DisplayListMenuIDLoop
	dec [hl]
	call CheckForHoverText ; PureRGBnote: ADDED: when scrolling up the list we need to load TM text if we scrolled over one
	jp DisplayListMenuIDLoop
.handleListSkip
	; PureRGBnote: ADDED: code that will check to wrap to the top or bottom of the list menu when pressing left dpad
	call WrapListMenu ; NOTE: WrapListMenu is in bank1, which will always be loaded when this line is hit
	jp DisplayListMenuIDLoop


DisplayChooseQuantityMenu::
; text box dimensions/coordinates for just quantity
	hlcoord 15, 9
	lb bc, 1, 3 ; height, width
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .drawTextBox
; text box dimensions/coordinates for quantity and price
	hlcoord 7, 9
	lb bc, 1, 11  ; height, width
.drawTextBox
	call TextBoxBorder
	hlcoord 16, 10
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .printInitialQuantity
	hlcoord 8, 10
.printInitialQuantity
	ld de, InitialQuantityText
	call PlaceString
	xor a
	ld [wItemQuantity], a ; initialize current quantity to 0
	jp .incrementQuantity
.waitForKeyPressLoop
	call JoypadLowSensitivity
	ldh a, [hJoyPressed] ; newly pressed buttons
	bit BIT_A_BUTTON, a
	jp nz, .buttonAPressed
	bit BIT_B_BUTTON, a
	jp nz, .buttonBPressed
	bit BIT_D_UP, a
	jr nz, .incrementQuantity
	bit BIT_D_DOWN, a
	jr nz, .decrementQuantity
;;;;;;;;;; PureRGBnote: ADDED: functionality to decrement or increment amounts by 10 when pressing right or left
	bit BIT_D_RIGHT, a
	jr nz, .incrementQuantity10
	bit BIT_D_LEFT, a
	jr nz, .decrementQuantity10
;;;;;;;;;;
	jr .waitForKeyPressLoop
.incrementQuantity
	ld a, [wMaxItemQuantity]
	inc a
	ld b, a
	ld hl, wItemQuantity ; current quantity
	inc [hl]
	ld a, [hl]
	cp b
	jr nz, .handleNewQuantity
; wrap to 1 if the player goes above the max quantity
	ld [hl], 1
	jr .handleNewQuantity
.decrementQuantity
	ld hl, wItemQuantity ; current quantity
	dec [hl]
	jr nz, .handleNewQuantity
;;;;;;;;;; PureRGBnote: ADDED: functionality to decrement or increment amounts by 10 when pressing right or left
; wrap to the max quantity if the player goes below 1
	ld a, [wMaxItemQuantity]
	ld [hl], a
	jr .handleNewQuantity
.incrementQuantity10
	ld a, [wMaxItemQuantity]
	inc a
	ld b, a
	ld hl, wItemQuantity ; current quantity
	ld a, [hl]
	add 10
	ld [hl], a
	cp b
	jr c, .handleNewQuantity
; wrap to 1 if the player goes above the max quantity
	ld [hl], 1
	jr .handleNewQuantity
.decrementQuantity10
	ld hl, wItemQuantity ; current quantity
	ld a, [hl]
	cp 11
	jr c, .wrapMax
	sub 10
	ld [hl], a
	jr .handleNewQuantity
.wrapMax
;;;;;;;;;;
; wrap to the max quantity if the player goes below 1
	ld a, [wMaxItemQuantity]
	ld [hl], a
.handleNewQuantity
	hlcoord 17, 10
	ld a, [wListMenuID]
	cp PRICEDITEMLISTMENU
	jr nz, .printQuantity
.printPrice
	ld c, $03
	ld a, [wItemQuantity]
	ld b, a
	ld hl, hMoney ; total price
; initialize total price to 0
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
.addLoop ; loop to multiply the individual price by the quantity to get the total price
	ld de, hMoney + 2
	ld hl, hItemPrice + 2
	push bc
	predef AddBCDPredef ; add the individual price to the current sum
	pop bc
	dec b
	jr nz, .addLoop
	ldh a, [hHalveItemPrices]
	and a ; should the price be halved (for selling items)?
	jr z, .skipHalvingPrice
	xor a
	ldh [hDivideBCDDivisor], a
	ldh [hDivideBCDDivisor + 1], a
	ld a, $02
	ldh [hDivideBCDDivisor + 2], a
	predef DivideBCDPredef3 ; halves the price
; store the halved price
	ldh a, [hDivideBCDQuotient]
	ldh [hMoney], a
	ldh a, [hDivideBCDQuotient + 1]
	ldh [hMoney + 1], a
	ldh a, [hDivideBCDQuotient + 2]
	ldh [hMoney + 2], a
.skipHalvingPrice
	hlcoord 12, 10
	ld de, SpacesBetweenQuantityAndPriceText
	call PlaceString
	ld de, hMoney ; total price
	ld c, $a3
	call PrintBCDNumber
	hlcoord 9, 10
.printQuantity
	ld de, wItemQuantity ; current quantity
	lb bc, LEADING_ZEROES | 1, 2 ; 1 byte, 2 digits
	call PrintNumber
	jp .waitForKeyPressLoop
.buttonAPressed ; the player chose to make the transaction
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ret
.buttonBPressed ; the player chose to cancel the transaction
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	ld a, $ff
	ret
	
InitialQuantityText::
	db "×01@"

SpacesBetweenQuantityAndPriceText::
	db "      @"

ExitListMenu::
	ld a, [wCurrentMenuItem]
	ld [wChosenMenuItem], a
	ld a, CANCELLED_MENU
	ld [wMenuExitMethod], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call BankswitchBack
	xor a
	ld [wListMenuHoverTextShown], a ; PureRGBnote: ADDED: when we leave a list menu we are no longer displaying any TM text
	ldh [hJoy7], a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	scf
	ret

PrintListMenuEntries::
	hlcoord 5, 3
	lb bc, 9, 14
	call ClearScreenArea
	ld a, [wListPointer]
	ld e, a
	ld a, [wListPointer + 1]
	ld d, a
	inc de ; de = beginning of list entries
	ld a, [wListScrollOffset]
	ld c, a
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	ld a, c
	jr nz, .skipMultiplying
; if it's an item menu
; item entries are 2 bytes long, so multiply by 2
	add a
	sla c
.skipMultiplying
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	hlcoord 6, 4 ; coordinates of first list entry name
	ld b, 4 ; print 4 names
.loop
	ld a, b
	ld [wWhichPokemon], a
	ld a, [de]
	ld [wNamedObjectIndex], a
	cp $ff
	jp z, .printCancelMenuItem
	push bc
	push de
	push hl
	push hl
	push de
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr z, .pokemonPCMenu
	cp MOVESLISTMENU
	jr z, .movesMenu
	cp CUSTOMLISTMENU
	jr z, .customListMenu
;;;; code for printing item names
.itemMenu
	call GetItemName
	jr .placeNameString
;;;;
.customListMenu
	call CustomListMenuGetEntryText ; PureRGBnote: ADDED: function that allows for more customizable new list menus
	jr .placeNameString
;;;; code for printing pokemon names
.pokemonPCMenu
	push hl
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld hl, wPartyMonNicks
	jr z, .getPokemonName
	ld hl, wBoxMonNicks ; box pokemon names
.getPokemonName
	ld a, [wWhichPokemon]
	n_sub_a 4
	ld b, a
	ld a, [wListScrollOffset]
	add b
	call GetPartyMonName
	pop hl
	jr .placeNameString
;;;;
;;;; code for printing names of moves
.movesMenu
	call GetMoveName
;;;;
.placeNameString
	call PlaceString
	pop de
	pop hl
	ld a, [wPrintItemPrices]
	and a ; should prices be printed?
	jr z, .skipPrintingItemPrice
;;;; code for printing prices (specific to buy/sell menus)
.printItemPrice
	push hl
	ld a, [de]
	ld de, ItemPrices
	ld [wCurItem], a
	call GetItemPrice
	pop hl
	ld bc, SCREEN_WIDTH + 5 ; 1 row down and 5 columns right
	add hl, bc
	ld c, $a3 ; no leading zeroes, right-aligned, print currency symbol, 3 bytes
	call PrintBCDNumber
;;;;
.skipPrintingItemPrice
	ld a, [wListMenuID]
	and a ; PCPOKEMONLISTMENU?
	jr nz, .skipPrintingPokemonLevel
;;;; code for printing levels (specific to box menus)
.printPokemonLevel
	ld a, [wNamedObjectIndex]
	push af
	push hl
	ld hl, wPartyCount
	ld a, [wListPointer]
	cp l ; is it a list of party pokemon or box pokemon?
	ld a, PLAYER_PARTY_DATA
	jr z, .next
	ld a, BOX_DATA
.next
	ld [wMonDataLocation], a
	ld hl, wWhichPokemon
	ld a, [hl]
	n_sub_a 4
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld [hl], a
	call LoadMonData
	ld a, [wMonDataLocation]
	and a ; is it a list of party pokemon or box pokemon?
	jr z, .skipCopyingLevel
.copyLevel
	ld a, [wLoadedMonBoxLevel]
	ld [wLoadedMonLevel], a
.skipCopyingLevel
	pop hl
	ld bc, $1c
	add hl, bc
	call PrintLevel
	pop af
	ld [wNamedObjectIndex], a
;;;;
.skipPrintingPokemonLevel
	pop hl
	pop de
	inc de
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .nextListEntry
;;;; code for printing item quantities (specific to item menus)
.printItemQuantity
	ld a, [wNamedObjectIndex]
	ld [wCurItem], a
	call IsKeyItem ; check if item is unsellable
	ld a, [wIsKeyItem]
	and a ; is the item unsellable?
	jr nz, .skipPrintingItemQuantity ; if so, don't print the quantity
	push hl
	ld bc, SCREEN_WIDTH + 8 ; 1 row down and 8 columns right
	add hl, bc
	ld a, "×"
	ld [hli], a
	ld a, [wNamedObjectIndex]
	push af
	ld a, [de]
	ld [wMaxItemQuantity], a
	push de
	ld de, wTempByteValue
	ld [de], a
	lb bc, 1, 2
	call PrintNumber
	pop de
	pop af
	ld [wNamedObjectIndex], a
	pop hl
;;;;
.skipPrintingItemQuantity
	inc de
	pop bc
	inc c
	push bc
	inc c
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	and a ; is an item being swapped?
	jr z, .nextListEntry
	add a
	cp c ; is it this item?
	jr nz, .nextListEntry
	dec hl
	ld a, "▷"
	ld [hli], a
.nextListEntry
	ld bc, 2 * SCREEN_WIDTH ; 2 rows
	add hl, bc
	pop bc
	inc c
	dec b
	jp nz, .loop
	ld bc, -8
	add hl, bc
	ld [hl], "▼"
	ret
.printCancelMenuItem
	ld de, ListMenuCancelText
	jp PlaceString


ListMenuCancelText::
	db "CANCEL@"