MACRO overworld_sprite
	dw \1
	db \2 tiles
	db BANK(\1)
ENDM

SpriteSheetPointerTable:
	table_width 4
	; graphics, tile count
	overworld_sprite RedSprite, 12              ; SPRITE_RED
	overworld_sprite BlueSprite, 12             ; SPRITE_BLUE
	overworld_sprite OakSprite, 12              ; SPRITE_OAK
	overworld_sprite YoungsterSprite, 12        ; SPRITE_YOUNGSTER
	overworld_sprite MonsterSprite, 12          ; SPRITE_MONSTER
	overworld_sprite CooltrainerFSprite, 12     ; SPRITE_COOLTRAINER_F
	overworld_sprite CooltrainerMSprite, 12     ; SPRITE_COOLTRAINER_M
	overworld_sprite LittleGirlSprite, 12       ; SPRITE_LITTLE_GIRL
	overworld_sprite BirdSprite, 12             ; SPRITE_BIRD
	overworld_sprite MiddleAgedManSprite, 12    ; SPRITE_MIDDLE_AGED_MAN
	overworld_sprite GamblerSprite, 12          ; SPRITE_GAMBLER
	overworld_sprite SuperNerdSprite, 12        ; SPRITE_SUPER_NERD
	overworld_sprite GirlSprite, 12             ; SPRITE_GIRL
	overworld_sprite HikerSprite, 12            ; SPRITE_HIKER
	overworld_sprite BeautySprite, 12           ; SPRITE_BEAUTY
	overworld_sprite GentlemanSprite, 12        ; SPRITE_GENTLEMAN
	overworld_sprite DaisySprite, 12            ; SPRITE_DAISY
	overworld_sprite BikerSprite, 12            ; SPRITE_BIKER
	overworld_sprite SailorSprite, 12           ; SPRITE_SAILOR
	overworld_sprite CookSprite, 12             ; SPRITE_COOK
	overworld_sprite BikeShopClerkSprite, 12    ; SPRITE_BIKE_SHOP_CLERK
	overworld_sprite MrFujiSprite, 12           ; SPRITE_MR_FUJI
	overworld_sprite GiovanniSprite, 12         ; SPRITE_GIOVANNI
	overworld_sprite RocketSprite, 12           ; SPRITE_ROCKET
	overworld_sprite ChannelerSprite, 12        ; SPRITE_CHANNELER
	overworld_sprite WaiterSprite, 12           ; SPRITE_WAITER
	overworld_sprite SilphWorkerFSprite, 12     ; SPRITE_SILPH_WORKER_F
	overworld_sprite MiddleAgedWomanSprite, 12  ; SPRITE_MIDDLE_AGED_WOMAN
	overworld_sprite BrunetteGirlSprite, 12     ; SPRITE_BRUNETTE_GIRL
	overworld_sprite LanceSprite, 12            ; SPRITE_LANCE
	overworld_sprite ScientistSprite, 12        ; SPRITE_UNUSED_SCIENTIST
	overworld_sprite ScientistSprite, 12        ; SPRITE_SCIENTIST
	overworld_sprite RockerSprite, 12           ; SPRITE_ROCKER
	overworld_sprite SwimmerSprite, 12          ; SPRITE_SWIMMER
	overworld_sprite SafariZoneWorkerSprite, 12 ; SPRITE_SAFARI_ZONE_WORKER
	overworld_sprite GymGuideSprite, 12         ; SPRITE_GYM_GUIDE
	overworld_sprite GrampsSprite, 12           ; SPRITE_GRAMPS
	overworld_sprite ClerkSprite, 12            ; SPRITE_CLERK
	overworld_sprite FishingGuruSprite, 12      ; SPRITE_FISHING_GURU
	overworld_sprite GrannySprite, 12           ; SPRITE_GRANNY
	overworld_sprite NurseSprite, 12            ; SPRITE_NURSE
	overworld_sprite LinkReceptionistSprite, 12 ; SPRITE_LINK_RECEPTIONIST
	overworld_sprite SilphPresidentSprite, 12   ; SPRITE_SILPH_PRESIDENT
	overworld_sprite SilphWorkerMSprite, 12     ; SPRITE_SILPH_WORKER_M
	overworld_sprite WardenSprite, 12           ; SPRITE_WARDEN
	overworld_sprite CaptainSprite, 12          ; SPRITE_CAPTAIN
	overworld_sprite FisherSprite, 12           ; SPRITE_FISHER
	overworld_sprite KogaSprite, 12             ; SPRITE_KOGA
	overworld_sprite GuardSprite, 12            ; SPRITE_GUARD
	overworld_sprite GuardSprite, 12            ; SPRITE_UNUSED_GUARD
	overworld_sprite MomSprite, 12              ; SPRITE_MOM
	overworld_sprite BaldingGuySprite, 12       ; SPRITE_BALDING_GUY
	overworld_sprite LittleBoySprite, 12        ; SPRITE_LITTLE_BOY
	overworld_sprite GameboyKidSprite, 12       ; SPRITE_UNUSED_GAMEBOY_KID
	overworld_sprite GameboyKidSprite, 12       ; SPRITE_GAMEBOY_KID
	overworld_sprite FairySprite, 12            ; SPRITE_FAIRY
	overworld_sprite AgathaSprite, 12           ; SPRITE_AGATHA
	overworld_sprite BrunoSprite, 12            ; SPRITE_BRUNO
	overworld_sprite LoreleiSprite, 12          ; SPRITE_LORELEI
	overworld_sprite SeelSprite, 12             ; SPRITE_SEEL
	overworld_sprite PokeBallSprite, 4          ; SPRITE_POKE_BALL
	overworld_sprite FossilSprite, 4            ; SPRITE_FOSSIL
	overworld_sprite BoulderSprite, 4           ; SPRITE_BOULDER
	overworld_sprite PaperSprite, 4             ; SPRITE_PAPER
	overworld_sprite PokedexSprite, 4           ; SPRITE_POKEDEX
	overworld_sprite ClipboardSprite, 4         ; SPRITE_CLIPBOARD
	overworld_sprite SnorlaxSprite, 4           ; SPRITE_SNORLAX
	overworld_sprite OldAmberSprite, 4          ; SPRITE_UNUSED_OLD_AMBER
	overworld_sprite OldAmberSprite, 4          ; SPRITE_OLD_AMBER
	overworld_sprite GamblerAsleepSprite, 4     ; SPRITE_UNUSED_GAMBLER_ASLEEP_1
	overworld_sprite GamblerAsleepSprite, 4     ; SPRITE_UNUSED_GAMBLER_ASLEEP_2
	overworld_sprite GamblerAsleepSprite, 4     ; SPRITE_GAMBLER_ASLEEP
	assert_table_length NUM_SPRITES
