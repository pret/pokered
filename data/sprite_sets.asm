MapSpriteSets:
	db $01 ; PALLET_TOWN
	db $01 ; VIRIDIAN_CITY
	db $02 ; PEWTER_CITY
	db $02 ; CERULEAN_CITY
	db $03 ; LAVENDER_TOWN
	db $04 ; VERMILION_CITY
	db $05 ; CELADON_CITY
	db $0a ; FUCHSIA_CITY
	db $01 ; CINNABAR_ISLAND
	db $06 ; INDIGO_PLATEAU
	db $07 ; SAFFRON_CITY
	db $01 ; unused map ID
	db $01 ; ROUTE_1
	db $f1 ; ROUTE_2
	db $02 ; ROUTE_3
	db $02 ; ROUTE_4
	db $f9 ; ROUTE_5
	db $fa ; ROUTE_6
	db $fb ; ROUTE_7
	db $fc ; ROUTE_8
	db $02 ; ROUTE_9
	db $f2 ; ROUTE_10
	db $f3 ; ROUTE_11
	db $f4 ; ROUTE_12
	db $08 ; ROUTE_13
	db $08 ; ROUTE_14
	db $f5 ; ROUTE_15
	db $f6 ; ROUTE_16
	db $09 ; ROUTE_17
	db $f7 ; ROUTE_18
	db $0a ; ROUTE_19
	db $f8 ; ROUTE_20
	db $01 ; ROUTE_21
	db $01 ; ROUTE_22
	db $06 ; ROUTE_23
	db $02 ; ROUTE_24
	db $02 ; ROUTE_25

; Format:
; 00: determines whether the map is split East/West or North/South
; $01 = East/West divide
; $02 = North/South divide
; 01: coordinate of dividing line
; 02: sprite set ID if in the West or North side
; 03: sprite set ID if in the East or South side
SplitMapSpriteSets:
	db $02,$25,$02,$01 ; $f1
	db $02,$32,$02,$03 ; $f2
	db $01,$39,$04,$08 ; $f3
	db $02,$15,$03,$08 ; $f4
	db $01,$08,$0A,$08 ; $f5
	db $01,$18,$09,$05 ; $f6
	db $01,$22,$09,$0A ; $f7
	db $01,$35,$01,$0A ; $f8
	db $02,$21,$02,$07 ; $f9
	db $02,$02,$07,$04 ; $fa
	db $01,$11,$05,$07 ; $fb
	db $01,$03,$07,$03 ; $fc

SpriteSets:
; sprite set $01
	db SPRITE_BLUE
	db SPRITE_BUG_CATCHER
	db SPRITE_GIRL
	db SPRITE_FISHER2
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_GAMBLER
	db SPRITE_SEEL
	db SPRITE_OAK
	db SPRITE_SWIMMER
	db SPRITE_BALL
	db SPRITE_LYING_OLD_MAN

; sprite set $02
	db SPRITE_BUG_CATCHER
	db SPRITE_ROCKET
	db SPRITE_BLACK_HAIR_BOY_2
	db SPRITE_HIKER
	db SPRITE_SLOWBRO
	db SPRITE_BLUE
	db SPRITE_GUARD
	db SPRITE_LASS
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_BALL
	db SPRITE_LYING_OLD_MAN_UNUSED_2

; sprite set $03
	db SPRITE_LITTLE_GIRL
	db SPRITE_GIRL
	db SPRITE_BLACK_HAIR_BOY_2
	db SPRITE_HIKER
	db SPRITE_GAMBLER
	db SPRITE_SLOWBRO
	db SPRITE_LASS
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_GUARD
	db SPRITE_BALL
	db SPRITE_LYING_OLD_MAN_UNUSED_2

; sprite set $04
	db SPRITE_FOULARD_WOMAN
	db SPRITE_BLACK_HAIR_BOY_2
	db SPRITE_BUG_CATCHER
	db SPRITE_GAMBLER
	db SPRITE_SLOWBRO
	db SPRITE_GUARD
	db SPRITE_SAILOR
	db SPRITE_LASS
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_BALL
	db SPRITE_LYING_OLD_MAN_UNUSED_2

; sprite set $05
	db SPRITE_LITTLE_GIRL
	db SPRITE_YOUNG_BOY
	db SPRITE_GIRL
	db SPRITE_FISHER2
	db SPRITE_FAT_BALD_GUY
	db SPRITE_OLD_PERSON
	db SPRITE_SLOWBRO
	db SPRITE_GUARD
	db SPRITE_ROCKET
	db SPRITE_BALL
	db SPRITE_SNORLAX

; sprite set $06
	db SPRITE_BUG_CATCHER
	db SPRITE_GYM_HELPER
	db SPRITE_SLOWBRO
	db SPRITE_BLUE
	db SPRITE_LASS
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_SWIMMER
	db SPRITE_GUARD
	db SPRITE_GAMBLER
	db SPRITE_BALL
	db SPRITE_LYING_OLD_MAN_UNUSED_2

; sprite set $07
	db SPRITE_ROCKET
	db SPRITE_OAK_AIDE
	db SPRITE_LAPRAS_GIVER
	db SPRITE_ERIKA
	db SPRITE_GENTLEMAN
	db SPRITE_BIRD
	db SPRITE_ROCKER
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_SLOWBRO
	db SPRITE_BALL
	db SPRITE_LYING_OLD_MAN_UNUSED_2

; sprite set $08
	db SPRITE_BIKER
	db SPRITE_BLACK_HAIR_BOY_2
	db SPRITE_FAT_BALD_GUY
	db SPRITE_LASS
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_FOULARD_WOMAN
	db SPRITE_FISHER2
	db SPRITE_ROCKER
	db SPRITE_SLOWBRO
	db SPRITE_BALL
	db SPRITE_SNORLAX

; sprite set $09
	db SPRITE_BIKER
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_LAPRAS_GIVER
	db SPRITE_FISHER2
	db SPRITE_ROCKER
	db SPRITE_HIKER
	db SPRITE_GAMBLER
	db SPRITE_FAT_BALD_GUY
	db SPRITE_BLACK_HAIR_BOY_2
	db SPRITE_BALL
	db SPRITE_SNORLAX

; sprite set $0a
	db SPRITE_BIRD
	db SPRITE_BLACK_HAIR_BOY_1
	db SPRITE_CLEFAIRY
	db SPRITE_FISHER2
	db SPRITE_GAMBLER
	db SPRITE_SLOWBRO
	db SPRITE_SEEL
	db SPRITE_SWIMMER
	db SPRITE_BUG_CATCHER
	db SPRITE_BALL
	db SPRITE_OMANYTE

SpriteSheetPointerTable:
	; SPRITE_RED
	dw RedSprite
	db $c0 ; byte count
	db BANK(RedSprite)

	; SPRITE_BLUE
	dw BlueSprite
	db $c0 ; byte count
	db BANK(BlueSprite)

	; SPRITE_OAK
	dw OakSprite
	db $c0 ; byte count
	db BANK(OakSprite)

	; SPRITE_BUG_CATCHER
	dw BugCatcherSprite
	db $c0 ; byte count
	db BANK(BugCatcherSprite)

	; SPRITE_SLOWBRO
	dw SlowbroSprite
	db $c0 ; byte count
	db BANK(SlowbroSprite)

	; SPRITE_LASS
	dw LassSprite
	db $c0 ; byte count
	db BANK(LassSprite)

	; SPRITE_BLACK_HAIR_BOY_1
	dw BlackHairBoy1Sprite
	db $c0 ; byte count
	db BANK(BlackHairBoy1Sprite)

	; SPRITE_LITTLE_GIRL
	dw LittleGirlSprite
	db $c0 ; byte count
	db BANK(LittleGirlSprite)

	; SPRITE_BIRD
	dw BirdSprite
	db $c0 ; byte count
	db BANK(BirdSprite)

	; SPRITE_FAT_BALD_GUY
	dw FatBaldGuySprite
	db $c0 ; byte count
	db BANK(FatBaldGuySprite)

	; SPRITE_GAMBLER
	dw GamblerSprite
	db $c0 ; byte count
	db BANK(GamblerSprite)

	; SPRITE_BLACK_HAIR_BOY_2
	dw BlackHairBoy2Sprite
	db $c0 ; byte count
	db BANK(BlackHairBoy2Sprite)

	; SPRITE_GIRL
	dw GirlSprite
	db $c0 ; byte count
	db BANK(GirlSprite)

	; SPRITE_HIKER
	dw HikerSprite
	db $c0 ; byte count
	db BANK(HikerSprite)

	; SPRITE_FOULARD_WOMAN
	dw FoulardWomanSprite
	db $c0 ; byte count
	db BANK(FoulardWomanSprite)

	; SPRITE_GENTLEMAN
	dw GentlemanSprite
	db $c0 ; byte count
	db BANK(GentlemanSprite)

	; SPRITE_DAISY
	dw DaisySprite
	db $c0 ; byte count
	db BANK(DaisySprite)

	; SPRITE_BIKER
	dw BikerSprite
	db $c0 ; byte count
	db BANK(BikerSprite)

	; SPRITE_SAILOR
	dw SailorSprite
	db $c0 ; byte count
	db BANK(SailorSprite)

	; SPRITE_COOK
	dw CookSprite
	db $c0 ; byte count
	db BANK(CookSprite)

	; SPRITE_BIKE_SHOP_GUY
	dw BikeShopGuySprite
	db $c0 ; byte count
	db BANK(BikeShopGuySprite)

	; SPRITE_MR_FUJI
	dw MrFujiSprite
	db $c0 ; byte count
	db BANK(MrFujiSprite)

	; SPRITE_GIOVANNI
	dw GiovanniSprite
	db $c0 ; byte count
	db BANK(GiovanniSprite)

	; SPRITE_ROCKET
	dw RocketSprite
	db $c0 ; byte count
	db BANK(RocketSprite)

	; SPRITE_MEDIUM
	dw MediumSprite
	db $c0 ; byte count
	db BANK(MediumSprite)

	; SPRITE_WAITER
	dw WaiterSprite
	db $c0 ; byte count
	db BANK(WaiterSprite)

	; SPRITE_ERIKA
	dw ErikaSprite
	db $c0 ; byte count
	db BANK(ErikaSprite)

	; SPRITE_MOM_GEISHA
	dw MomGeishaSprite
	db $c0 ; byte count
	db BANK(MomGeishaSprite)

	; SPRITE_BRUNETTE_GIRL
	dw BrunetteGirlSprite
	db $c0 ; byte count
	db BANK(BrunetteGirlSprite)

	; SPRITE_LANCE
	dw LanceSprite
	db $c0 ; byte count
	db BANK(LanceSprite)

	; SPRITE_OAK_SCIENTIST_AIDE
	dw OakAideSprite
	db $c0 ; byte count
	db BANK(OakAideSprite)

	; SPRITE_OAK_AIDE
	dw OakAideSprite
	db $c0 ; byte count
	db BANK(OakAideSprite)

	; SPRITE_ROCKER
	dw RockerSprite
	db $c0 ; byte count
	db BANK(RockerSprite)

	; SPRITE_SWIMMER
	dw SwimmerSprite
	db $c0 ; byte count
	db BANK(SwimmerSprite)

	; SPRITE_WHITE_PLAYER
	dw WhitePlayerSprite
	db $c0 ; byte count
	db BANK(WhitePlayerSprite)

	; SPRITE_GYM_HELPER
	dw GymHelperSprite
	db $c0 ; byte count
	db BANK(GymHelperSprite)

	; SPRITE_OLD_PERSON
	dw OldPersonSprite
	db $c0 ; byte count
	db BANK(OldPersonSprite)

	; SPRITE_MART_GUY
	dw MartGuySprite
	db $c0 ; byte count
	db BANK(MartGuySprite)

	; SPRITE_FISHER
	dw FisherSprite
	db $c0 ; byte count
	db BANK(FisherSprite)

	; SPRITE_OLD_MEDIUM_WOMAN
	dw OldMediumWomanSprite
	db $c0 ; byte count
	db BANK(OldMediumWomanSprite)

	; SPRITE_NURSE
	dw NurseSprite
	db $c0 ; byte count
	db BANK(NurseSprite)

	; SPRITE_CABLE_CLUB_WOMAN
	dw CableClubWomanSprite
	db $c0 ; byte count
	db BANK(CableClubWomanSprite)

	; SPRITE_MR_MASTERBALL
	dw MrMasterballSprite
	db $c0 ; byte count
	db BANK(MrMasterballSprite)

	; SPRITE_LAPRAS_GIVER
	dw LaprasGiverSprite
	db $c0 ; byte count
	db BANK(LaprasGiverSprite)

	; SPRITE_WARDEN
	dw WardenSprite
	db $c0 ; byte count
	db BANK(WardenSprite)

	; SPRITE_SS_CAPTAIN
	dw SsCaptainSprite
	db $c0 ; byte count
	db BANK(SsCaptainSprite)

	; SPRITE_FISHER2
	dw Fisher2Sprite
	db $c0 ; byte count
	db BANK(Fisher2Sprite)

	; SPRITE_BLACKBELT
	dw BlackbeltSprite
	db $c0 ; byte count
	db BANK(BlackbeltSprite)

	; SPRITE_GUARD
	dw GuardSprite
	db $c0 ; byte count
	db BANK(GuardSprite)

	; $32
	dw GuardSprite
	db $c0 ; byte count
	db BANK(GuardSprite)

	; SPRITE_MOM
	dw MomSprite
	db $c0 ; byte count
	db BANK(MomSprite)

	; SPRITE_BALDING_GUY
	dw BaldingGuySprite
	db $c0 ; byte count
	db BANK(BaldingGuySprite)

	; SPRITE_YOUNG_BOY
	dw YoungBoySprite
	db $c0 ; byte count
	db BANK(YoungBoySprite)

	; SPRITE_GAMEBOY_KID
	dw GameboyKidSprite
	db $c0 ; byte count
	db BANK(GameboyKidSprite)

	; SPRITE_GAMEBOY_KID_COPY
	dw GameboyKidSprite
	db $c0 ; byte count
	db BANK(GameboyKidSprite)

	; SPRITE_CLEFAIRY
	dw ClefairySprite
	db $c0 ; byte count
	db BANK(ClefairySprite)

	; SPRITE_AGATHA
	dw AgathaSprite
	db $c0 ; byte count
	db BANK(AgathaSprite)

	; SPRITE_BRUNO
	dw BrunoSprite
	db $c0 ; byte count
	db BANK(BrunoSprite)

	; SPRITE_LORELEI
	dw LoreleiSprite
	db $c0 ; byte count
	db BANK(LoreleiSprite)

	; SPRITE_SEEL
	dw SeelSprite
	db $c0 ; byte count
	db BANK(SeelSprite)

	; SPRITE_BALL
	dw BallSprite
	db $40 ; byte count
	db BANK(BallSprite)

	; SPRITE_OMANYTE
	dw OmanyteSprite
	db $40 ; byte count
	db BANK(OmanyteSprite)

	; SPRITE_BOULDER
	dw BoulderSprite
	db $40 ; byte count
	db BANK(BoulderSprite)

	; SPRITE_PAPER_SHEET
	dw PaperSheetSprite
	db $40 ; byte count
	db BANK(PaperSheetSprite)

	; SPRITE_BOOK_MAP_DEX
	dw BookMapDexSprite
	db $40 ; byte count
	db BANK(BookMapDexSprite)

	; SPRITE_CLIPBOARD
	dw ClipboardSprite
	db $40 ; byte count
	db BANK(ClipboardSprite)

	; SPRITE_SNORLAX
	dw SnorlaxSprite
	db $40 ; byte count
	db BANK(SnorlaxSprite)

	; SPRITE_OLD_AMBER_COPY
	dw OldAmberSprite
	db $40 ; byte count
	db BANK(OldAmberSprite)

	; SPRITE_OLD_AMBER
	dw OldAmberSprite
	db $40 ; byte count
	db BANK(OldAmberSprite)

	; SPRITE_LYING_OLD_MAN_UNUSED_1
	dw LyingOldManSprite
	db $40 ; byte count
	db BANK(LyingOldManSprite)

	; SPRITE_LYING_OLD_MAN_UNUSED_2
	dw LyingOldManSprite
	db $40 ; byte count
	db BANK(LyingOldManSprite)

	; SPRITE_LYING_OLD_MAN
	dw LyingOldManSprite
	db $40 ; byte count
	db BANK(LyingOldManSprite)
