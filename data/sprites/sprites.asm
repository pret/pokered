overworld_sprite: MACRO
	dw \1
	db \2 tiles
	db BANK(\1)
ENDM

SpriteSheetPointerTable:
	; graphics, tile count
	overworld_sprite RedSprite, 12            ; SPRITE_RED
	overworld_sprite BlueSprite, 12           ; SPRITE_BLUE
	overworld_sprite OakSprite, 12            ; SPRITE_OAK
	overworld_sprite BugCatcherSprite, 12     ; SPRITE_BUG_CATCHER
	overworld_sprite SlowbroSprite, 12        ; SPRITE_SLOWBRO
	overworld_sprite LassSprite, 12           ; SPRITE_LASS
	overworld_sprite BlackHairBoy1Sprite, 12  ; SPRITE_BLACK_HAIR_BOY_1
	overworld_sprite LittleGirlSprite, 12     ; SPRITE_LITTLE_GIRL
	overworld_sprite BirdSprite, 12           ; SPRITE_BIRD
	overworld_sprite FatBaldGuySprite, 12     ; SPRITE_FAT_BALD_GUY
	overworld_sprite GamblerSprite, 12        ; SPRITE_GAMBLER
	overworld_sprite BlackHairBoy2Sprite, 12  ; SPRITE_BLACK_HAIR_BOY_2
	overworld_sprite GirlSprite, 12           ; SPRITE_GIRL
	overworld_sprite HikerSprite, 12          ; SPRITE_HIKER
	overworld_sprite FoulardWomanSprite, 12   ; SPRITE_FOULARD_WOMAN
	overworld_sprite GentlemanSprite, 12      ; SPRITE_GENTLEMAN
	overworld_sprite DaisySprite, 12          ; SPRITE_DAISY
	overworld_sprite BikerSprite, 12          ; SPRITE_BIKER
	overworld_sprite SailorSprite, 12         ; SPRITE_SAILOR
	overworld_sprite CookSprite, 12           ; SPRITE_COOK
	overworld_sprite BikeShopGuySprite, 12    ; SPRITE_BIKE_SHOP_GUY
	overworld_sprite MrFujiSprite, 12         ; SPRITE_MR_FUJI
	overworld_sprite GiovanniSprite, 12       ; SPRITE_GIOVANNI
	overworld_sprite RocketSprite, 12         ; SPRITE_ROCKET
	overworld_sprite MediumSprite, 12         ; SPRITE_MEDIUM
	overworld_sprite WaiterSprite, 12         ; SPRITE_WAITER
	overworld_sprite ErikaSprite, 12          ; SPRITE_ERIKA
	overworld_sprite MomGeishaSprite, 12      ; SPRITE_MOM_GEISHA
	overworld_sprite BrunetteGirlSprite, 12   ; SPRITE_BRUNETTE_GIRL
	overworld_sprite LanceSprite, 12          ; SPRITE_LANCE
	overworld_sprite OakAideSprite, 12        ; SPRITE_OAK_SCIENTIST_AIDE
	overworld_sprite OakAideSprite, 12        ; SPRITE_OAK_AIDE
	overworld_sprite RockerSprite, 12         ; SPRITE_ROCKER
	overworld_sprite SwimmerSprite, 12        ; SPRITE_SWIMMER
	overworld_sprite WhitePlayerSprite, 12    ; SPRITE_WHITE_PLAYER
	overworld_sprite GymHelperSprite, 12      ; SPRITE_GYM_HELPER
	overworld_sprite OldPersonSprite, 12      ; SPRITE_OLD_PERSON
	overworld_sprite MartGuySprite, 12        ; SPRITE_MART_GUY
	overworld_sprite FisherSprite, 12         ; SPRITE_FISHER
	overworld_sprite OldMediumWomanSprite, 12 ; SPRITE_OLD_MEDIUM_WOMAN
	overworld_sprite NurseSprite, 12          ; SPRITE_NURSE
	overworld_sprite CableClubWomanSprite, 12 ; SPRITE_CABLE_CLUB_WOMAN
	overworld_sprite MrMasterballSprite, 12   ; SPRITE_MR_MASTERBALL
	overworld_sprite LaprasGiverSprite, 12    ; SPRITE_LAPRAS_GIVER
	overworld_sprite WardenSprite, 12         ; SPRITE_WARDEN
	overworld_sprite SsCaptainSprite, 12      ; SPRITE_SS_CAPTAIN
	overworld_sprite Fisher2Sprite, 12        ; SPRITE_FISHER2
	overworld_sprite BlackbeltSprite, 12      ; SPRITE_BLACKBELT
	overworld_sprite GuardSprite, 12          ; SPRITE_GUARD
	overworld_sprite GuardSprite, 12          ; $32
	overworld_sprite MomSprite, 12            ; SPRITE_MOM
	overworld_sprite BaldingGuySprite, 12     ; SPRITE_BALDING_GUY
	overworld_sprite YoungBoySprite, 12       ; SPRITE_YOUNG_BOY
	overworld_sprite GameboyKidSprite, 12     ; SPRITE_GAMEBOY_KID
	overworld_sprite GameboyKidSprite, 12     ; SPRITE_GAMEBOY_KID_COPY
	overworld_sprite ClefairySprite, 12       ; SPRITE_CLEFAIRY
	overworld_sprite AgathaSprite, 12         ; SPRITE_AGATHA
	overworld_sprite BrunoSprite, 12          ; SPRITE_BRUNO
	overworld_sprite LoreleiSprite, 12        ; SPRITE_LORELEI
	overworld_sprite SeelSprite, 12           ; SPRITE_SEEL
	overworld_sprite BallSprite, 4            ; SPRITE_BALL
	overworld_sprite OmanyteSprite, 4         ; SPRITE_OMANYTE
	overworld_sprite BoulderSprite, 4         ; SPRITE_BOULDER
	overworld_sprite PaperSheetSprite, 4      ; SPRITE_PAPER_SHEET
	overworld_sprite BookMapDexSprite, 4      ; SPRITE_BOOK_MAP_DEX
	overworld_sprite ClipboardSprite, 4       ; SPRITE_CLIPBOARD
	overworld_sprite SnorlaxSprite, 4         ; SPRITE_SNORLAX
	overworld_sprite OldAmberSprite, 4        ; SPRITE_OLD_AMBER_COPY
	overworld_sprite OldAmberSprite, 4        ; SPRITE_OLD_AMBER
	overworld_sprite LyingOldManSprite, 4     ; SPRITE_LYING_OLD_MAN_UNUSED_1
	overworld_sprite LyingOldManSprite, 4     ; SPRITE_LYING_OLD_MAN_UNUSED_2
	overworld_sprite LyingOldManSprite, 4     ; SPRITE_LYING_OLD_MAN
