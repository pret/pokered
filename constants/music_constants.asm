; Song ids are calculated by address to save space.

music_const: MACRO
\1 EQUS "((\2 - SFX_Headers_02) / 3)"
ENDM

	; AUDIO_1
	music_const MUSIC_PALLET_TOWN,         Music_PalletTown
	music_const MUSIC_POKECENTER,          Music_Pokecenter
	music_const MUSIC_GYM,                 Music_Gym
	music_const MUSIC_CITIES1,             Music_Cities1
	music_const MUSIC_CITIES2,             Music_Cities2
	music_const MUSIC_CELADON,             Music_Celadon
	music_const MUSIC_CINNABAR,            Music_Cinnabar
	music_const MUSIC_VERMILION,           Music_Vermilion
	music_const MUSIC_LAVENDER,            Music_Lavender
	music_const MUSIC_SS_ANNE,             Music_SSAnne
	music_const MUSIC_MEET_PROF_OAK,       Music_MeetProfOak
	music_const MUSIC_MEET_RIVAL,          Music_MeetRival
	music_const MUSIC_MUSEUM_GUY,          Music_MuseumGuy
	music_const MUSIC_SAFARI_ZONE,         Music_SafariZone
	music_const MUSIC_PKMN_HEALED,         Music_PkmnHealed
	music_const MUSIC_ROUTES1,             Music_Routes1
	music_const MUSIC_ROUTES2,             Music_Routes2
	music_const MUSIC_ROUTES3,             Music_Routes3
	music_const MUSIC_ROUTES4,             Music_Routes4
	music_const MUSIC_INDIGO_PLATEAU,      Music_IndigoPlateau

	; AUDIO_2
	music_const MUSIC_GYM_LEADER_BATTLE,   Music_GymLeaderBattle
	music_const MUSIC_TRAINER_BATTLE,      Music_TrainerBattle
	music_const MUSIC_WILD_BATTLE,         Music_WildBattle
	music_const MUSIC_FINAL_BATTLE,        Music_FinalBattle
	music_const MUSIC_DEFEATED_TRAINER,    Music_DefeatedTrainer
	music_const MUSIC_DEFEATED_WILD_MON,   Music_DefeatedWildMon
	music_const MUSIC_DEFEATED_GYM_LEADER, Music_DefeatedGymLeader

	; AUDIO_3
	music_const MUSIC_TITLE_SCREEN,        Music_TitleScreen
	music_const MUSIC_CREDITS,             Music_Credits
	music_const MUSIC_HALL_OF_FAME,        Music_HallOfFame
	music_const MUSIC_OAKS_LAB,            Music_OaksLab
	music_const MUSIC_JIGGLYPUFF_SONG,     Music_JigglypuffSong
	music_const MUSIC_BIKE_RIDING,         Music_BikeRiding
	music_const MUSIC_SURFING,             Music_Surfing
	music_const MUSIC_GAME_CORNER,         Music_GameCorner
	music_const MUSIC_INTRO_BATTLE,        Music_IntroBattle
	music_const MUSIC_DUNGEON1,            Music_Dungeon1
	music_const MUSIC_DUNGEON2,            Music_Dungeon2
	music_const MUSIC_DUNGEON3,            Music_Dungeon3
	music_const MUSIC_CINNABAR_MANSION,    Music_CinnabarMansion
	music_const MUSIC_POKEMON_TOWER,       Music_PokemonTower
	music_const MUSIC_SILPH_CO,            Music_SilphCo
	music_const MUSIC_MEET_EVIL_TRAINER,   Music_MeetEvilTrainer
	music_const MUSIC_MEET_FEMALE_TRAINER, Music_MeetFemaleTrainer
	music_const MUSIC_MEET_MALE_TRAINER,   Music_MeetMaleTrainer

	; AUDIO_1 AUDIO_2 AUDIO_3
	music_const SFX_SNARE_1,          SFX_02_01
	music_const SFX_SNARE_2,          SFX_02_02
	music_const SFX_SNARE_3,          SFX_02_03
	music_const SFX_SNARE_4,          SFX_02_04
	music_const SFX_SNARE_5,          SFX_02_05
	music_const SFX_TRIANGLE_1,       SFX_02_06
	music_const SFX_TRIANGLE_2,       SFX_02_07
	music_const SFX_SNARE_6,          SFX_02_08
	music_const SFX_SNARE_7,          SFX_02_09
	music_const SFX_SNARE_8,          SFX_02_0a
	music_const SFX_SNARE_9,          SFX_02_0b
	music_const SFX_CYMBAL_1,         SFX_02_0c
	music_const SFX_CYMBAL_2,         SFX_02_0d
	music_const SFX_CYMBAL_3,         SFX_02_0e
	music_const SFX_MUTED_SNARE_1,    SFX_02_0f
	music_const SFX_TRIANGLE_3,       SFX_02_10
	music_const SFX_MUTED_SNARE_2,    SFX_02_11
	music_const SFX_MUTED_SNARE_3,    SFX_02_12
	music_const SFX_MUTED_SNARE_4,    SFX_02_13
	music_const SFX_CRY_00,           SFX_02_14
	music_const SFX_CRY_01,           SFX_02_15
	music_const SFX_CRY_02,           SFX_02_16
	music_const SFX_CRY_03,           SFX_02_17
	music_const SFX_CRY_04,           SFX_02_18
	music_const SFX_CRY_05,           SFX_02_19
	music_const SFX_CRY_06,           SFX_02_1a
	music_const SFX_CRY_07,           SFX_02_1b
	music_const SFX_CRY_08,           SFX_02_1c
	music_const SFX_CRY_09,           SFX_02_1d
	music_const SFX_CRY_0A,           SFX_02_1e
	music_const SFX_CRY_0B,           SFX_02_1f
	music_const SFX_CRY_0C,           SFX_02_20
	music_const SFX_CRY_0D,           SFX_02_21
	music_const SFX_CRY_0E,           SFX_02_22
	music_const SFX_CRY_0F,           SFX_02_23
	music_const SFX_CRY_10,           SFX_02_24
	music_const SFX_CRY_11,           SFX_02_25
	music_const SFX_CRY_12,           SFX_02_26
	music_const SFX_CRY_13,           SFX_02_27
	music_const SFX_CRY_14,           SFX_02_28
	music_const SFX_CRY_15,           SFX_02_29
	music_const SFX_CRY_16,           SFX_02_2a
	music_const SFX_CRY_17,           SFX_02_2b
	music_const SFX_CRY_18,           SFX_02_2c
	music_const SFX_CRY_19,           SFX_02_2d
	music_const SFX_CRY_1A,           SFX_02_2e
	music_const SFX_CRY_1B,           SFX_02_2f
	music_const SFX_CRY_1C,           SFX_02_30
	music_const SFX_CRY_1D,           SFX_02_31
	music_const SFX_CRY_1E,           SFX_02_32
	music_const SFX_CRY_1F,           SFX_02_33
	music_const SFX_CRY_20,           SFX_02_34
	music_const SFX_CRY_21,           SFX_02_35
	music_const SFX_CRY_22,           SFX_02_36
	music_const SFX_CRY_23,           SFX_02_37
	music_const SFX_CRY_24,           SFX_02_38
	music_const SFX_CRY_25,           SFX_02_39

	music_const SFX_GET_ITEM_2,       SFX_02_3b
	music_const SFX_TINK,             SFX_02_3c
	music_const SFX_HEAL_HP,          SFX_02_3d
	music_const SFX_HEAL_AILMENT,     SFX_02_3e
	music_const SFX_START_MENU,       SFX_02_3f
	music_const SFX_PRESS_AB,         SFX_02_40

	; AUDIO_1 AUDIO_3
	music_const SFX_GET_ITEM_1,       SFX_02_3a

	music_const SFX_POKEDEX_RATING,   SFX_02_41
	music_const SFX_GET_KEY_ITEM,     SFX_02_42
	music_const SFX_POISONED,         SFX_02_43
	music_const SFX_TRADE_MACHINE,    SFX_02_44
	music_const SFX_TURN_ON_PC,       SFX_02_45
	music_const SFX_TURN_OFF_PC,      SFX_02_46
	music_const SFX_ENTER_PC,         SFX_02_47
	music_const SFX_SHRINK,           SFX_02_48
	music_const SFX_SWITCH,           SFX_02_49
	music_const SFX_HEALING_MACHINE,  SFX_02_4a
	music_const SFX_TELEPORT_1,       SFX_02_4b
	music_const SFX_TELEPORT_2,       SFX_02_4c
	music_const SFX_TELEPORT_3,       SFX_02_4d
	music_const SFX_LEDGE,            SFX_02_4e
	music_const SFX_FLY_1,            SFX_02_4f
	music_const SFX_FLY_2,            SFX_02_50
	music_const SFX_DENIED,           SFX_02_51
	music_const SFX_ARROW_TILES,      SFX_02_52
	music_const SFX_PUSH_BOULDER,     SFX_02_53
	music_const SFX_SS_ANNE_HORN,     SFX_02_54
	music_const SFX_WITHDRAW_DEPOSIT, SFX_02_55
	music_const SFX_CUT,              SFX_02_56
	music_const SFX_GO_INSIDE,        SFX_02_57
	music_const SFX_SWAP,             SFX_02_58
	music_const SFX_59,               SFX_02_59 ; unused, sounds similar to SFX_SLOTS_STOP_WHEEL
	music_const SFX_PURCHASE,         SFX_02_5a
	music_const SFX_COLLISION,        SFX_02_5b
	music_const SFX_GO_OUTSIDE,       SFX_02_5c
	music_const SFX_SAVE,             SFX_02_5d

	; AUDIO_1
	music_const SFX_POKEFLUE,         SFX_02_5e
	music_const SFX_SAFARI_ZONE_PA,   SFX_02_5f

	; AUDIO_2
	music_const SFX_LEVEL_UP,         SFX_08_3a
	
	music_const SFX_BATTLE_01,        SFX_08_41
	music_const SFX_BATTLE_02,        SFX_08_42
	music_const SFX_BATTLE_03,        SFX_08_43
	music_const SFX_BATTLE_04,        SFX_08_44
	music_const SFX_BATTLE_05,        SFX_08_45
	music_const SFX_BATTLE_06,        SFX_08_46
	music_const SFX_BATTLE_07,        SFX_08_47
	music_const SFX_BATTLE_08,        SFX_08_48
	music_const SFX_BATTLE_09,        SFX_08_49
	music_const SFX_BATTLE_0A,        SFX_08_4a
	music_const SFX_BATTLE_0B,        SFX_08_4b
	music_const SFX_BATTLE_0C,        SFX_08_4c
	music_const SFX_BATTLE_0D,        SFX_08_4d
	music_const SFX_BATTLE_0E,        SFX_08_4e
	music_const SFX_BATTLE_0F,        SFX_08_4f
	music_const SFX_BATTLE_10,        SFX_08_50
	music_const SFX_BATTLE_11,        SFX_08_51
	music_const SFX_BATTLE_12,        SFX_08_52
	music_const SFX_BATTLE_13,        SFX_08_53
	music_const SFX_BATTLE_14,        SFX_08_54
	music_const SFX_BATTLE_15,        SFX_08_55
	music_const SFX_BATTLE_16,        SFX_08_56 ; unused?
	music_const SFX_BATTLE_17,        SFX_08_57
	music_const SFX_BATTLE_18,        SFX_08_58
	music_const SFX_BATTLE_19,        SFX_08_59
	music_const SFX_BATTLE_1A,        SFX_08_5a
	music_const SFX_BATTLE_1B,        SFX_08_5b
	music_const SFX_BATTLE_1C,        SFX_08_5c
	music_const SFX_BATTLE_1D,        SFX_08_5d
	music_const SFX_BATTLE_1E,        SFX_08_5e
	music_const SFX_BATTLE_1F,        SFX_08_5f
	music_const SFX_BATTLE_20,        SFX_08_60
	music_const SFX_BATTLE_21,        SFX_08_61
	music_const SFX_BATTLE_22,        SFX_08_62
	music_const SFX_BATTLE_23,        SFX_08_63
	music_const SFX_BATTLE_24,        SFX_08_64
	music_const SFX_BATTLE_25,        SFX_08_65
	music_const SFX_BATTLE_26,        SFX_08_66
	music_const SFX_BATTLE_27,        SFX_08_67
	music_const SFX_BATTLE_28,        SFX_08_68
	music_const SFX_BATTLE_29,        SFX_08_69
	music_const SFX_BATTLE_2A,        SFX_08_6a
	music_const SFX_BATTLE_2B,        SFX_08_6b
	music_const SFX_BATTLE_2C,        SFX_08_6c
	music_const SFX_BATTLE_2D,        SFX_08_6d
	music_const SFX_BATTLE_2E,        SFX_08_6e
	music_const SFX_BATTLE_2F,        SFX_08_6f
	music_const SFX_BATTLE_30,        SFX_08_70
	music_const SFX_BATTLE_31,        SFX_08_71
	music_const SFX_BATTLE_32,        SFX_08_72
	music_const SFX_BATTLE_33,        SFX_08_73
	music_const SFX_BATTLE_34,        SFX_08_74
	music_const SFX_BATTLE_35,        SFX_08_75
	music_const SFX_BATTLE_36,        SFX_08_76
	music_const SFX_BATTLE_37,        SFX_08_77

	; AUDIO_3
	music_const SFX_INTRO_LUNGE,      SFX_1f_5e
	music_const SFX_INTRO_HIP,        SFX_1f_5f
	music_const SFX_INTRO_HOP,        SFX_1f_60
	music_const SFX_INTRO_RAISE,      SFX_1f_61
	music_const SFX_INTRO_CRASH,      SFX_1f_62
	music_const SFX_INTRO_WHOOSH,     SFX_1f_63
	music_const SFX_SLOTS_STOP_WHEEL, SFX_1f_64
	music_const SFX_SLOTS_REWARD,     SFX_1f_65
	music_const SFX_SLOTS_NEW_SPIN,   SFX_1f_66
	music_const SFX_SHOOTING_STAR,    SFX_1f_67
