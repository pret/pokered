; PureRGBnote: CHANGED: Conversion has a whole new set of effects. Can switch between two modes. Defense mode halves damage from attacks.
; Attack mode will use a move that is super effective against the opponent.
ShowConversionMenu::
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; in link battles we will always use ATTACK mode
	call LoadScreenTilesFromBuffer1
	call Delay3
	ld hl, .chooseConversionMode
	rst _PrintText
	ld hl, ConversionMenu
	ld b, A_BUTTON | B_BUTTON
	call DisplayMultiChoiceTextBox
	jr nz, .back
	call LoadScreenTilesFromBuffer1
	ld a, [wCurrentMenuItem]
	and a
	jr z, .choseMode
	ld a, [wPlayerBattleStatus3]
	bit HAS_REFLECT_UP, a
	jr z, .choseMode
	bit HAS_LIGHT_SCREEN_UP, a
	jr z, .choseMode
	ld hl, .alreadyDefenseMode
	rst _PrintText
	; loop it
	jr ShowConversionMenu
.choseMode
	ld a, [wCurrentMenuItem]
	ld [wPlayerConversionMode], a
	scf
	ret
.back
	and a
	ret
.chooseConversionMode
	text_far _ConversionChooseModeText
	text_end
.alreadyDefenseMode
	text_far _ConversionAlreadyDefenseModeText
	text_end

ConversionEffect_:
	callfar PlayCurrentMoveAnimation
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]
	ld d, a
	ld a, [wBattleMonSpecies]
	ld e, a
	ld a, [wEnemyBattleStatus2]
	ld c, a
	jr z, .playerTurn
	ld a, [wBattleMonSpecies]
	ld d, a
	ld a, [wEnemyMonSpecies]
	ld e, a
	ld a, [wPlayerBattleStatus2]
	ld c, a
.enemyTurn
	ld a, [wForcedConversionMode]
	and a
	jr z, .noForcedModeEnemy
	dec a
	jr z, .enemyAttackMode
	jr .enemyDefenseMode
.noForcedModeEnemy
	; NPC enemy using conversion
	ld a, [wIsInBattle]
	cp 1 ; is it a wild battle?
	jr nz, .trainerBattle
	call Random
	rrca
	; wild pokemon choose the mode randomly
	jr c, .enemyDefenseMode
	jr .enemyAttackMode
.trainerBattle
	; only use defense mode potentially on the first turn
	ld a, [wAILayer2Encouragement]
	cp 1
	jr nz, .enemyAttackMode
	push bc
	push de
	callfar IsPlayerPokemonDangerous
	pop de
	pop bc
	jr c, .enemyAttackMode ; if they're dangerous focus on attacking asap
	call .getBattleStatus3
	bit HAS_LIGHT_SCREEN_UP, [hl]
	jr z, .enemyDefenseMode
	bit HAS_REFLECT_UP, [hl]
	jr z, .enemyDefenseMode
	jr .enemyAttackMode
.enemyDefenseMode
	ld a, 1
	ld [wEnemyPreviousConversionMode], a
	jr .defenseMode
.enemyAttackMode
	xor a
	ld [wEnemyPreviousConversionMode], a
	jr .attackMode
.playerTurn
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	jr z, .attackMode ; in link battles we will always use ATTACK mode
	ld a, [wForcedConversionMode]
	and a
	jr z, .noForcedModePlayer
	dec a
	jr z, .attackMode
	jr .defenseMode
.noForcedModePlayer
	ld a, [wPlayerConversionMode]
	and a
	jr z, .attackMode
.defenseMode
	ld hl, .enteredDefenseMode
	rst _PrintText
	ld a, CONVERSION_DEFENSE_MODE_ANIM
	call .doModeAnimation
	callfar ReflectLightScreenEffect_
	xor a
	ld [wForcedConversionMode], a
	and a ; clear carry so we don't execute another move when returning from this
	ret
.enteredDefenseMode
	text_far _ConversionEnteredDefenseModeText
	text_end
.enteredAttackMode
	text_far _ConversionEnteredAttackModeText
	text_end
.getBattleStatus3
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	ret z
	ld hl, wEnemyBattleStatus3
	ret
.doModeAnimation
	ld [wAnimationID], a
	xor a
	ld [wAnimationType], a ; allows tri attack to do the multi-color animation without a damage animation
	jpfar MoveAnimation
.attackMode
	push de
	push bc
	ld hl, .enteredAttackMode
	rst _PrintText
	ld a, CONVERSION_ATTACK_MODE_ANIM
	call .doModeAnimation
	pop bc
	pop de
.getConversionResultMove
	call .getBattleStatus3
	; get rid of defense mode's effects when entering attack mode
	res HAS_LIGHT_SCREEN_UP, [hl]
	res HAS_REFLECT_UP, [hl]
	push de
	ld a, d
	cp MISSINGNO
	jr z, .missingno
	cp DITTO
	jr nz, .notDitto
	; if opponent is ditto, best approach is to use our own species to determine the attack so load it into e
	pop de
	ld d, e
	push de
.notDitto
	push af
	ld a, d
	push bc
	; check if type remapped pokemon
	ld hl, ConversionTypeRemapTable
	ld de, 2
	call IsInArray
	pop bc
	jr nc, .notTypeRemap
	pop af
	push af
	ld [wCurSpecies], a
	push hl
	push bc
	call IsMonTypeRemapped
	pop bc
	pop hl
	jr z, .notTypeRemap
	pop af
	inc hl ; hl = which attack to use for the remapped mon
	ld a, [hl] ; resultant move for type remapped pokemon
	jr .doneRemapCheck
.notTypeRemap
	pop af
	ld d, 0
	ld e, a
	dec e ; rhydon = 1, not 0
	ld hl, ConversionAttackTable
	add hl, de
	ld a, [hl] ; resultant move or convert constant
.doneRemapCheck
	cp CONVERT_WATER
	jr c, .noPorygonMagnetonDifference
	sub CONVERT_WATER
	pop de
	push de
	push af
	ld a, e
	cp PORYGON
	ld hl, SecondaryConversionPorygon
	jr z, .gotWhichMon
	ld hl, SecondaryConversionMagneton
.gotWhichMon
	pop af
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl] ; resultant move for the given pokemon
	jr .gotMove
.noPorygonMagnetonDifference
	cp CONVERT_MR_MIME
	jr c, .gotMove
	ld a, [wOptions3]
	jr z, .mrMime
	; grass/poison pokemon
	bit BIT_BUG_PSN, a
	ld a, LEECH_LIFE
	jr z, .gotMove
	ld a, PSYCHIC_M
	jr .gotMove
.mrMime
	bit BIT_GHOST_PSYCHIC, a
	ld a, BARRAGE
	jr z, .gotMove
	; check if mrmime is type remapped
	push bc
	ld a, MR_MIME
	ld [wCurSpecies], a
	call IsMonTypeRemapped
	pop bc
	ld a, TWINEEDLE ; if it's PSYCHIC type only, use twineedle
	jr c, .gotMove
.missingno
	; if mr mime is immune to ghost (original type matchup) or attacking missingno, 
	; it has no weaknesses and immune to SUPER_FANG so just choose a stab move
	pop de
	push de
	ld a, e
	cp PORYGON
	ld a, TRI_ATTACK
	jr z, .gotMove
	ld a, THUNDERBOLT
	; fall through
.gotMove
	pop de
	push af
	cp PSYCHIC_M
	jr nz, .notPsychic
	; if we're using psychic, make sure opponent isn't immune due to HAZE. 
	; This will always be a poison pkmn since fighting mons don't learn haze.
	bit PSYCHIC_IMMUNITY, c
	jr z, .gotMoveDoneChecks
	pop af
	ld a, BONEMERANG
	jr .gotReplacedMove
.notPsychic
	cp DIZZY_PUNCH
	jr nz, .gotMoveDoneChecks
	bit NORMAL_FIGHTING_IMMUNITY, c
	jr z, .gotMoveDoneChecks
	ld a, d
	cp CLEFAIRY
	jr z, .replaceDizzyPunch
	cp CLEFABLE
	jr z, .replaceDizzyPunch
	jr .gotMoveDoneChecks
.replaceDizzyPunch
	pop af
	ld a, SUPER_FANG
	jr .gotReplacedMove
.gotMoveDoneChecks
	pop af
.gotReplacedMove
	; replace the move and do the animation
	ld [wNamedObjectIndex], a
	ldh a, [hWhoseTurn]
	and a
	ld a, [wNamedObjectIndex]
	jr z, .doReplaceMovePlayer
	ld hl, wEnemySelectedMove
	ld [hl], a
	ld de, wEnemyMoveNum
	jr .callfarReload
.doReplaceMovePlayer
	ld hl, wPlayerSelectedMove
	ld [hl], a
	ld de, wPlayerMoveNum
.callfarReload
	callfar FarReloadMoveData
	xor a
	ld [wForcedConversionMode], a
	scf
	ret


	const_def 250
	const CONVERT_MR_MIME
	const CONVERT_GRASS_POISON
    const CONVERT_WATER
	const CONVERT_TRI_GRASS
	const CONVERT_TRI_BUG
	const CONVERT_TRI_FLYING

; CONVERT: use tri attack when super effective

ConversionAttackTable:
	db MEGA_DRAIN            ; RHYDON
	db DIZZY_PUNCH           ; KANGASKHAN         
	db PSYCHIC_M               ; NIDORAN_M          
	db DIZZY_PUNCH           ; CLEFAIRY           
	db CONVERT_TRI_FLYING    ; SPEAROW            
	db EARTHQUAKE            ; VOLTORB            
	db ICE_BEAM              ; NIDOKING           
	db CONVERT_WATER         ; SLOWBRO            
	db CONVERT_GRASS_POISON  ; IVYSAUR            
	db LEECH_LIFE            ; EXEGGUTOR          
	db DIZZY_PUNCH           ; LICKITUNG          
	db LEECH_LIFE            ; EXEGGCUTE          
	db PSYCHIC_M             ; GRIMER             
	db EARTHQUAKE            ; GENGAR             
	db PSYCHIC_M               ; NIDORAN_F          
	db ICE_BEAM              ; NIDOQUEEN          
	db ICE_BEAM              ; CUBONE             
	db MEGA_DRAIN            ; RHYHORN            
	db CONVERT_WATER         ; LAPRAS             
	db SURF                  ; ARCANINE           
	db TWINEEDLE             ; MEW                
	db THUNDERBOLT           ; GYARADOS           
	db CONVERT_WATER         ; SHELLDER           
	db EARTHQUAKE            ; TENTACOOL          
	db EARTHQUAKE            ; GASTLY             
	db SPIKE_CANNON          ; SCYTHER            
	db CONVERT_WATER         ; STARYU             
	db CONVERT_WATER         ; BLASTOISE          
	db PSYCHIC_M               ; PINSIR             
	db CONVERT_TRI_GRASS     ; TANGELA            
	db POISON_GAS            ; TORCHED
	db 0
	db SURF                  ; GROWLITHE          
	db MEGA_DRAIN            ; ONIX               
	db CONVERT_TRI_FLYING    ; FEAROW             
	db CONVERT_TRI_FLYING    ; PIDGEY             
	db CONVERT_WATER         ; SLOWPOKE           
	db TWINEEDLE             ; KADABRA            
	db MEGA_DRAIN            ; GRAVELER           
	db DIZZY_PUNCH           ; CHANSEY            
	db PSYCHIC_M             ; MACHOKE            
	db CONVERT_MR_MIME       ; MR_MIME  
	db PSYCHIC_M             ; HITMONLEE          
	db PSYCHIC_M             ; HITMONCHAN         
	db PSYCHIC_M             ; ARBOK              
	db CONVERT_TRI_BUG       ; PARASECT           
	db CONVERT_WATER         ; PSYDUCK            
	db TWINEEDLE             ; DROWZEE            
	db MEGA_DRAIN            ; GOLEM              
	db PSYCHIC_M             ; IRRADIATED        
	db SPIKE_CANNON          ; MAGMAR
	db EARTHQUAKE            ; VOLCANIC_MAGMAR
	db EARTHQUAKE            ; ELECTABUZZ         
	db EARTHQUAKE            ; MAGNETON           
	db PSYCHIC_M             ; KOFFING            
	db BONEMERANG            ; FLOATING_MAGNETON
	db PSYCHIC_M             ; MANKEY             
	db CONVERT_WATER         ; SEEL               
	db SOLARBEAM             ; DIGLETT            
	db DIZZY_PUNCH           ; TAUROS             
	db 0               ; $3D
	db 0               ; $3E
	db 0               ; $3F
	db CONVERT_TRI_FLYING    ; FARFETCHD          
	db CONVERT_TRI_BUG       ; VENONAT            
	db ICE_BEAM              ; DRAGONITE          
	db 0               ; $43
	db 0               ; $44
	db 0               ; $45
	db ICE_BEAM              ; DODUO              
	db CONVERT_WATER         ; POLIWAG            
	db SPIKE_CANNON          ; JYNX               
	db SPIKE_CANNON          ; MOLTRES            
	db SPIKE_CANNON          ; ARTICUNO           
	db SPIKE_CANNON          ; ZAPDOS             
	db 0                     ; DITTO      ; ditto has specific code for it             
	db DIZZY_PUNCH           ; MEOWTH             
	db CONVERT_WATER         ; KRABBY             
	db 0               ; $4F
	db 0               ; $50
	db 0               ; $51
	db SPIKE_CANNON          ; VULPIX             
	db SPIKE_CANNON          ; NINETALES          
	db EARTHQUAKE            ; PIKACHU            
	db EARTHQUAKE            ; RAICHU             
	db SUPER_FANG            ; SPIRIT_CHUNKY
	db 0               ; $57
	db ICE_BEAM              ; DRATINI            
	db ICE_BEAM              ; DRAGONAIR          
	db SURF                  ; KABUTO             
	db SURF                  ; KABUTOPS           
	db CONVERT_WATER         ; HORSEA             
	db EGG_BOMB              ; SEADRA             
	db SPIKE_CANNON          ; WINTER_DRAGONAIR
	db 0               ; $5F
	db SOLARBEAM             ; SANDSHREW          
	db SOLARBEAM             ; SANDSLASH          
	db MEGA_DRAIN            ; OMANYTE            
	db MEGA_DRAIN            ; OMASTAR            
	db DIZZY_PUNCH           ; JIGGLYPUFF         
	db DIZZY_PUNCH           ; WIGGLYTUFF         
	db DIZZY_PUNCH           ; EEVEE              
	db SPIKE_CANNON          ; FLAREON            
	db EARTHQUAKE            ; JOLTEON            
	db CONVERT_WATER         ; VAPOREON           
	db PSYCHIC_M             ; MACHOP             
	db PSYCHIC_M             ; ZUBAT              
	db PSYCHIC_M             ; EKANS              
	db CONVERT_TRI_BUG       ; PARAS              
	db CONVERT_WATER         ; POLIWHIRL          
	db CONVERT_WATER         ; POLIWRATH          
	db CONVERT_TRI_BUG       ; WEEDLE             
	db CONVERT_TRI_BUG       ; KAKUNA             
	db CONVERT_TRI_BUG       ; BEEDRILL           
	db TOXIC                 ; PAINLESS
	db ICE_BEAM              ; DODRIO             
	db PSYCHIC_M             ; PRIMEAPE           
	db SOLARBEAM             ; DUGTRIO            
	db CONVERT_TRI_BUG       ; VENOMOTH           
	db CONVERT_WATER         ; DEWGONG            
	db 0               ; $79
	db 0               ; $7A
	db CONVERT_TRI_BUG       ; CATERPIE           
	db CONVERT_TRI_BUG       ; METAPOD            
	db SPIKE_CANNON          ; BUTTERFREE         
	db PSYCHIC_M             ; MACHAMP            
	db 0               ; $7F
	db CONVERT_WATER         ; GOLDUCK            
	db TWINEEDLE             ; HYPNO              
	db CONVERT_TRI_FLYING    ; GOLBAT             
	db TWINEEDLE             ; MEWTWO             
	db DIZZY_PUNCH           ; SNORLAX            
	db CONVERT_WATER         ; MAGIKARP           
	db CONVERT_TRI_FLYING    ; SPIRIT_THE_MAW
	db 0               ; $87
	db PSYCHIC_M             ; MUK                
	db 0               ; $89
	db MEGA_DRAIN            ; KINGLER            
	db CONVERT_WATER         ; CLOYSTER           
	db 0               ; $8C
	db EARTHQUAKE            ; ELECTRODE          
	db DIZZY_PUNCH           ; CLEFABLE           
	db PSYCHIC_M             ; WEEZING            
	db DIZZY_PUNCH           ; PERSIAN            
	db SOLARBEAM             ; MAROWAK            
	db PSYCHIC_M             ; FLOATING_WEEZING
	db EARTHQUAKE            ; HAUNTER            
	db TWINEEDLE             ; ABRA               
	db TWINEEDLE             ; ALAKAZAM           
	db CONVERT_TRI_FLYING    ; PIDGEOTTO        
	db CONVERT_TRI_FLYING    ; PIDGEOT            
	db CONVERT_WATER         ; STARMIE            
	db CONVERT_GRASS_POISON  ; BULBASAUR          
	db CONVERT_GRASS_POISON  ; VENUSAUR           
	db EARTHQUAKE            ; TENTACRUEL         
	db 0               ; $9C
	db CONVERT_WATER         ; GOLDEEN            
	db CONVERT_WATER         ; SEAKING            
	db 0               ; $9F
	db 0               ; $A0
	db 0               ; $A1
	db 0               ; $A2
	db SURF                  ; PONYTA             
	db SURF                  ; RAPIDASH           
	db DIZZY_PUNCH           ; RATTATA            
	db DIZZY_PUNCH           ; RATICATE           
	db PSYCHIC_M             ; NIDORINO           
	db PSYCHIC_M             ; NIDORINA           
	db MEGA_DRAIN            ; GEODUDE            
	db DIZZY_PUNCH           ; PORYGON            
	db THUNDERBOLT           ; AERODACTYL         
	db RAZOR_LEAF            ; HARDENED_ONIX      
	db EARTHQUAKE            ; MAGNEMITE          
	db TWINEEDLE             ; ARMORED_MEWTWO     
	db EARTHQUAKE            ; POWERED_HAUNTER    
	db SURF                  ; CHARMANDER         
	db CONVERT_WATER         ; SQUIRTLE           
	db SURF                  ; CHARMELEON         
	db CONVERT_WATER         ; WARTORTLE          
	db SPIKE_CANNON          ; CHARIZARD          
	db 0                     ; MISSINGNO           ; missingno needs custom behaviour
	db 0                     ; FOSSIL_KABUTOPS    
	db 0                     ; FOSSIL_AERODACTYL  
	db 0                     ; MON_GHOST          
	db CONVERT_GRASS_POISON  ; ODDISH             
	db CONVERT_GRASS_POISON  ; GLOOM              
	db CONVERT_GRASS_POISON  ; VILEPLUME          
	db CONVERT_GRASS_POISON  ; BELLSPROUT         
	db CONVERT_GRASS_POISON  ; WEEPINBELL         
	db ICE_BEAM              ; VICTREEBEL       

; for some mons, porygon is better off using solarbeam or tri attack due to stab compared to magneton

SecondaryConversionPorygon:  
	db SOLARBEAM  ; CONVERT_WATER
	db TRI_ATTACK ; CONVERT_TRI_GRASS
	db TRI_ATTACK ; CONVERT_TRI_BUG
	db TRI_ATTACK  ; CONVERT_TRI_FLYING

; if magneton, use these moves instead of 
SecondaryConversionMagneton:
	db THUNDERBOLT  ; CONVERT_WATER
	db FLAMETHROWER ; CONVERT_TRI_GRASS
	db FLAMETHROWER ; CONVERT_TRI_BUG
	db THUNDERBOLT  ; CONVERT_TRI_FLYING

; if CONVERT_GRASS_POISON, if bug SE against poison, choose LEECH_LIFE, otherwise choose FLAMETHROWER if magneton
; if missingno, use TRI ATTACK if porygon, THUNDERBOLT if magneton
; if ditto, and hasn't transformed yet, use earthquake with magneton, dizzy punch with porygon, if it has transformed, look up the pokemon it transformed into
; if mr mime, and ghost is SE against psychic, use BARRAGE (default), otherwise use tri attack if porygon, thunderbolt if magneton

; for some pokemon if they have their original typings, we need to tweak what conversion will use
ConversionTypeRemapTable:
	db FEAROW, CONVERT_TRI_FLYING
	db VICTREEBEL, CONVERT_GRASS_POISON
	db DODUO, CONVERT_TRI_FLYING
	db DODRIO, CONVERT_TRI_FLYING
	db SEADRA, SOLARBEAM
	db PINSIR, CONVERT_TRI_BUG
	db KABUTO, SOLARBEAM
	db KABUTOPS, SOLARBEAM
	db -1

;; UNUSED since conversion's effect was changed
;ConversionEffect_:
;	ld hl, wEnemyMonType1
;	ld de, wBattleMonType1
;	ldh a, [hWhoseTurn]
;	and a
;	ld a, [wEnemyBattleStatus1]
;	jr z, .conversionEffect
;	push hl
;	ld h, d
;	ld l, e
;	pop de
;	ld a, [wPlayerBattleStatus1]
;.conversionEffect
;	bit INVULNERABLE, a ; is mon immune to typical attacks (dig/fly)
;	jr nz, PrintButItFailedText
;; copy target's types to user
;	ld a, [hli]
;	ld [de], a
;	inc de
;	ld a, [hl]
;	ld [de], a
;	ld hl, PlayCurrentMoveAnimation
;	call CallBankF
;	ld hl, ConvertedTypeText
;	jp PrintText
;
;ConvertedTypeText:
;	text_far _ConvertedTypeText
;	text_end
;