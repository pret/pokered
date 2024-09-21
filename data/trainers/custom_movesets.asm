; PureRGBnote: ADDED: trainers can have custom movesets by specifying that in their party data

	const_def 1
	const CHAMP_ARENA_ERIKA_MOVESET
	const CHAMP_ARENA_BLAINE_MOVESET
	const CHAMP_ARENA_SURGE_MOVESET
	const CHAMP_ARENA_SABRINA_MOVESET
	const CHAMP_ARENA_BRUNO_MOVESET
	const CHAMP_ARENA_MISTY_MOVESET
	const CHAMP_ARENA_LANCE_MOVESET
	const CHAMP_ARENA_KOGA_MOVESET
	const CHAMP_ARENA_LORELEI_MOVESET
	const CHAMP_ARENA_BROCK_MOVESET
	const CHAMP_ARENA_AGATHA_MOVESET
	const CHAMP_ARENA_GYM_GUIDE_MOVESET
	const CHAMP_ARENA_RIVAL1_MOVESET
	const CHAMP_ARENA_RIVAL2_MOVESET
	const CHAMP_ARENA_RIVAL3_MOVESET
	const ELITE_FOUR_LANCE_MOVESET
	const ELITE_FOUR_RIVAL1_MOVESET
	const ELITE_FOUR_RIVAL2_MOVESET
	const ELITE_FOUR_RIVAL3_MOVESET

; input d = which moveset
LoadTrainerMoveSet:
	ld hl, MoveSetMappings
	dec d
	ld a, d
	call GetAddressFromPointerArray
	ld d, h
	ld e, l
	ld a, [wEnemyPartyCount]
	ld b, a
	ld hl, wEnemyMon1Moves
.pokemonLoop
	ld c, NUM_MOVES
	push hl
.moveLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .moveLoop
	pop hl
	dec b
	ret z
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	jr .pokemonLoop

MoveSetMappings:
	dw ChampArenaErikaMoveset
	dw ChampArenaBlaineMoveset
	dw ChampArenaSurgeMoveset
	dw ChampArenaSabrinaMoveset
	dw ChampArenaBrunoMoveset
	dw ChampArenaMistyMoveset
	dw ChampArenaLanceMoveset
	dw ChampArenaKogaMoveset
	dw ChampArenaLoreleiMoveset
	dw ChampArenaBrockMoveset
	dw ChampArenaAgathaMoveset
	dw ChampArenaGymGuideMoveset
	dw ChampArenaRivalMoveset1
	dw ChampArenaRivalMoveset2
	dw ChampArenaRivalMoveset3
	dw EliteFourLanceMoveset
	dw EliteFourRivalMoveset1
	dw EliteFourRivalMoveset2
	dw EliteFourRivalMoveset3

ChampArenaErikaMoveset:
	; victreebel
	db SLASH
	db EGG_BOMB
	db SELFDESTRUCT
	db RAZOR_LEAF
	; tangela
	db FLASH
	db SPORE
	db MEGA_DRAIN
	db RAZOR_LEAF
	; chansey
	db SEISMIC_TOSS
	db SOFTBOILED
	db PSYCHIC_M
	db THUNDER
	; butterfree
	db RAZOR_WIND ; ROOST
	db MEDITATE
	db PSYCHIC_M
	db THUNDER_WAVE
	; venusaur
	db GROWTH
	db CONSTRICT ; STATIC_SNAG
	db SOLARBEAM
	db EARTHQUAKE
	; vileplume
	db PETAL_DANCE
	db POISON_GAS
	db GROWTH
	db PSYCHIC_M

ChampArenaBlaineMoveset:
	; ninetales
	db FLAMETHROWER
	db DISABLE
	db SONICBOOM
	db CONFUSE_RAY
	; magmar
	db PSYCHIC_M
	db FIRE_PUNCH
	db ICE_PUNCH
	db MEDITATE
	; flareon
	db FLAMETHROWER
	db GLARE
	db DIG
	db FLASH
	; rapidash
	db KINESIS ; FIREWALL
	db HYPER_BEAM
	db SKULL_BASH
	db MEGA_KICK
	; arcanine
	db BONEMERANG
	db FIRE_BLAST
	db SLASH
	db SOLARBEAM
	; moltres
	db FIRE_SPIN
	db SKY_ATTACK
	db RAZOR_WIND ; ROOST
	db FIRE_BLAST

ChampArenaSurgeMoveset:
	; electrode
	db SELFDESTRUCT
	db SWIFT
	db THUNDERBOLT
	db MEGA_DRAIN
	; magneton
	db TRI_ATTACK
	db SONICBOOM
	db CONVERSION
	db THUNDERBOLT
	; electabuzz
	db FIRE_PUNCH
	db ICE_PUNCH
	db HI_JUMP_KICK
	db THUNDERPUNCH
	; jolteon
	db THUNDER
	db FLASH
	db TAKE_DOWN ; HEAT RUSH
	db THUNDER_WAVE
	; raichu
	db WITHDRAW
	db SURF
	db THUNDER
	db SWIFT
	; zapdos
	db DRILL_PECK
	db RAZOR_WIND ; ROOST
	db THUNDER
	db SPIKE_CANNON

ChampArenaSabrinaMoveset:
	; hypno
	db HYPNOSIS
	db PSYCHIC_M
	db ICE_PUNCH
	db FIRE_PUNCH
	; mr mime
	db THUNDER_WAVE
	db GLARE
	db PSYCHIC_M
	db MIRROR_MOVE
	; golduck
	db HYDRO_PUMP
	db TELEPORT
	db PSYCHIC_M
	db HI_JUMP_KICK
	; alakazam 1
	db TELEPORT
	db PSYCHIC_M
	db FLASH
	db DISABLE
	; butterfree
	db CONFUSE_RAY
	db SLEEP_POWDER
	db PSYCHIC_M
	db MEGA_DRAIN
	; alakazam 2
	db AURORA_BEAM
	db PSYCHIC_M
	db MEDITATE
	db RECOVER

ChampArenaBrunoMoveset:
	; hitmonchan
	db COMET_PUNCH
	db MIRROR_MOVE
	db COUNTER ; DRAIN_PUNCH
	db SLAM ; FILTHY_SLAM
	; hitmonlee
	db HI_JUMP_KICK
	db ROLLING_KICK
	db EARTHQUAKE
	db SUBMISSION
	; onix
	db WITHDRAW
	db TAKE_DOWN ; HEAT_RUSH
	db EARTHQUAKE
	db ROCK_SLIDE
	; fearow
	db MIRROR_MOVE
	db DRILL_PECK
	db SUBMISSION
	db SPIKE_CANNON
	; primeape
	db EXPLOSION
	db COMET_PUNCH
	db SONICBOOM
	db KARATE_CHOP
	; machamp
	db DEFENSE_CURL
	db COMET_PUNCH
	db COUNTER ; DRAIN_PUNCH
	db EARTHQUAKE

ChampArenaMistyMoveset:
	; staryu
	db SWIFT
	db SURF
	db RECOVER
	db MEGA_DRAIN
	; seaking
	db WATERFALL
	db HYPER_BEAM
	db TWINEEDLE
	db WITHDRAW
	; seadra
	db LOVELY_KISS
	db DRAGON_RAGE
	db SURF
	db FLASH
	; wigglytuff
	db RECOVER
	db DIZZY_PUNCH
	db HYPER_BEAM
	db FLAMETHROWER
	; vaporeon
	db SWIFT
	db HYDRO_PUMP
	db MEGA_DRAIN
	db FLASH
	; starmie
	db PSYCHIC_M
	db HYDRO_PUMP
	db RECOVER
	db THUNDER_WAVE

ChampArenaLanceMoveset:
	; gyarados
	db SURF
	db EARTHQUAKE
	db THUNDERBOLT
	db BODY_SLAM
	; dragonair
	db THUNDER_WAVE
	db ICE_BEAM
	db FLAMETHROWER
	db FLASH
	; seadra
	db DRAGON_RAGE
	db WATERFALL
	db FIRE_BLAST
	db AMNESIA
	; dragonite 1
	db KARATE_CHOP
	db RAZOR_WIND ; ROOST
	db SHARPEN
	db WHIRLWIND
	; aerodactyl
	db RAZOR_WIND ; ROOST
	db SKULL_BASH
	db WHIRLWIND
	db SWORDS_DANCE
	; dragonite 2
	db HYPER_BEAM
	db THUNDER
	db RAZOR_WIND ; ROOST
	db DRAGON_RAGE

ChampArenaKogaMoveset:
	; tentacruel
	db MEGA_DRAIN
	db CONSTRICT ; STATIC_SNAG
	db TOXIC
	db SURF
	; scyther
	db TWINEEDLE
	db SKY_ATTACK
	db SLASH
	db RAZOR_WIND ; ROOST
	; muk
	db GROWTH
	db POISON_GAS
	db COUNTER ; DRAIN_PUNCH
	db EXPLOSION 
	; parasect
	db SPORE
	db TWINEEDLE
	db GROWTH
	db CRABHAMMER
	; venomoth
	db SLEEP_POWDER
	db MIRROR_MOVE
	db SLUDGE
	db LEECH_LIFE
	; weezing
	db EGG_BOMB
	db POISON_GAS
	db GROWTH
	db FIRE_BLAST

ChampArenaLoreleiMoveset:
	; dewgong
	db WITHDRAW
	db ICE_BEAM
	db SURF
	db CONSTRICT ; STATIC_SNAG
	; slowbro
	db WITHDRAW
	db PSYCHIC_M
	db SURF
	db FIRE_PUNCH
	; jynx
	db LOVELY_KISS
	db ICE_PUNCH
	db THUNDERPUNCH
	db PSYCHIC_M
	; winter dragonair
	db MEGA_DRAIN
	db SURF
	db ICE_BEAM
	db THUNDERBOLT
	; lapras
	db BLIZZARD
	db HYDRO_PUMP
	db SOLARBEAM
	db FLASH
	; articuno
	db RAZOR_WIND ; ROOST
	db ICE_BEAM
	db PSYCHIC_M
	db WHIRLWIND

ChampArenaBrockMoveset:
	; golem
	db ROCK_SLIDE
	db EARTHQUAKE
	db MIRROR_MOVE
	db MEGA_KICK
	; kangaskhan
	db DIZZY_PUNCH
	db COMET_PUNCH
	db BODY_SLAM
	db EARTHQUAKE
	; kabutops
	db TWINEEDLE
	db ROCK_SLIDE
	db LEECH_LIFE
	db SWORDS_DANCE
	; omastar
	db WITHDRAW
	db DEFENSE_CURL
	db CRABHAMMER
	db MEGA_DRAIN 
	; aerodactyl
	db RAZOR_WIND ; ROOST
	db SKULL_BASH
	db WHIRLWIND
	db SLASH
	; onix
	db WITHDRAW
	db SELFDESTRUCT
	db EARTHQUAKE
	db SPIKE_CANNON

ChampArenaAgathaMoveset:
	; marowak
	db BONEMERANG
	db BARRAGE
	db COMET_PUNCH
	db SKULL_BASH
	; mr mime
	db PSYCHIC_M
	db SONICBOOM
	db TELEPORT
	db ICE_PUNCH
	; ninetales
	db FLAMETHROWER
	db SONICBOOM
	db CONFUSE_RAY
	db SOLARBEAM
	; arbok
	db WITHDRAW
	db LEECH_LIFE
	db SUPER_FANG
	db ACID
	; tangela
	db MEGA_DRAIN
	db FLASH
	db SELFDESTRUCT
	db SPORE
	; gengar
	db BARRAGE
	db ICE_PUNCH
	db MEGA_DRAIN
	db THUNDERBOLT

ChampArenaGymGuideMoveset:
	; chansey
	db REFLECT
	db SEISMIC_TOSS
	db SOFTBOILED
	db ICE_BEAM
	; snorlax
	db BODY_SLAM
	db BIDE
	db REST
	db EARTHQUAKE
	; cloyster
	db CRABHAMMER
	db BLIZZARD
	db WITHDRAW
	db GLARE
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db RECOVER
	db DISABLE
	; tauros
	db SLASH
	db BLIZZARD
	db EARTHQUAKE
	db HORN_DRILL
	; missingno
	db RAZOR_WIND ; ROOST
	db HI_JUMP_KICK
	db EARTHQUAKE
	db HYPER_BEAM

ChampArenaRivalMoveset1:
	; articuno
	db ICE_BEAM
	db RAZOR_WIND ; ROOST
	db PSYCHIC_M
	db FLY
	; alakazam
	db PSYCHIC_M
	db AURORA_BEAM
	db RECOVER
	db FLASH
	; rhydon
	db EARTHQUAKE
	db ROCK_SLIDE
	db DEFENSE_CURL
	db MEGA_KICK
	; exeggutor
	db PSYCHIC_M
	db SOLARBEAM
	db SLEEP_POWDER
	db EGG_BOMB
	; snorlax
	db BODY_SLAM
	db REST
	db KARATE_CHOP
	db SLASH
	; charizard
	db RAZOR_WIND ; ROOST
	db FLAMETHROWER
	db SKY_ATTACK
	db EARTHQUAKE

ChampArenaRivalMoveset2:
	; moltres
	db FLAMETHROWER
	db RAZOR_WIND ; ROOST
	db SKY_ATTACK
	db SOLARBEAM
	; alakazam
	db PSYCHIC_M
	db AURORA_BEAM
	db RECOVER
	db FLASH
	; rhydon
	db EARTHQUAKE
	db ROCK_SLIDE
	db DEFENSE_CURL
	db MEGA_KICK
	; tauros
	db SLASH
	db SKULL_BASH
	db MEGA_KICK
	db FURY_ATTACK
	; gengar
	db BARRAGE
	db PSYCHIC_M
	db LOVELY_KISS
	db MEGA_DRAIN
	; blastoise
	db HYDRO_PUMP
	db WITHDRAW
	db COUNTER ; DRAIN_PUNCH
	db ICE_BEAM

ChampArenaRivalMoveset3:
	; zapdos
	db THUNDERBOLT
	db RAZOR_WIND ; ROOST
	db SPIKE_CANNON
	db THUNDER_WAVE
	; alakazam
	db PSYCHIC_M
	db AURORA_BEAM
	db RECOVER
	db FLASH
	; kingler
	db CRABHAMMER
	db EARTHQUAKE
	db SPIKE_CANNON
	db VICEGRIP
	; rhydon
	db EARTHQUAKE
	db ROCK_SLIDE
	db DEFENSE_CURL
	db MEGA_KICK
	; gyarados
	db SURF
	db EARTHQUAKE
	db THUNDERBOLT
	db STRENGTH
	; venusaur
	db SLEEP_POWDER
	db RAZOR_LEAF
	db SLUDGE
	db DRAGON_RAGE

EliteFourLanceMoveset:
	; gyarados
	db HYPER_BEAM
	db HYDRO_PUMP
	db FLAMETHROWER
	db DRAGON_RAGE
	; dragonair
	db HYPER_BEAM
	db DRAGON_RAGE
	db MIST
	db BODY_SLAM
	; seadra
	db MEGA_DRAIN
	db DOUBLE_TEAM
	db DRAGON_RAGE
	db HYDRO_PUMP
	; dragonite
	db DRAGON_RAGE
	db ICE_BEAM
	db THUNDERBOLT
	db FLAMETHROWER
	; aerodactyl
	db SWORDS_DANCE
	db SKULL_BASH
	db EARTHQUAKE
	db WHIRLWIND
	; dragonite
	db HYPER_BEAM
	db WHIRLWIND
	db RAZOR_WIND ; ROOST
	db DRAGON_RAGE

EliteFourRivalMoveset1:
	; articuno
	db ICE_BEAM
	db BLIZZARD
	db AGILITY
	db WHIRLWIND
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db REFLECT
	db RECOVER
	; rhydon
	db EARTHQUAKE
	db SKULL_BASH
	db DEFENSE_CURL
	db MEGA_KICK
	; exeggutor
	db PSYCHIC_M
	db SLEEP_POWDER
	db SOLARBEAM
	db EGG_BOMB
	; snorlax
	db POISON_GAS
	db HYPER_BEAM
	db MEGA_KICK
	db EXPLOSION
	; charizard
	db THUNDERPUNCH
	db SLASH
	db FLAMETHROWER
	db SKY_ATTACK

EliteFourRivalMoveset2:
	; moltres
	db FLAMETHROWER
	db SKY_ATTACK
	db AGILITY
	db DRAGON_RAGE
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db REFLECT
	db RECOVER
	; rhydon
	db EARTHQUAKE
	db SKULL_BASH
	db DEFENSE_CURL
	db MEGA_KICK
	; tauros
	db GLARE
	db SKULL_BASH
	db MEGA_KICK
	db SLASH
	; gengar
	db DREAM_EATER
	db SLUDGE
	db ICE_PUNCH
	db LOVELY_KISS
	; blastoise
	db WITHDRAW
	db COUNTER ; DRAIN PUNCH
	db ICE_BEAM
	db HYDRO_PUMP

EliteFourRivalMoveset3:
	; zapdos
	db DRILL_PECK
	db THUNDERBOLT
	db AGILITY
	db SPIKE_CANNON
	; alakazam
	db PSYCHIC_M
	db MEDITATE
	db REFLECT
	db RECOVER
	; kingler
	db CRABHAMMER
	db FURY_ATTACK
	db EARTHQUAKE
	db SPIKE_CANNON
	; rhydon
	db EARTHQUAKE
	db SKULL_BASH
	db DEFENSE_CURL
	db MEGA_KICK
	; gyarados
	db HYDRO_PUMP
	db HYPER_BEAM
	db THUNDERBOLT
	db FLAMETHROWER
	; venusaur
	db RAZOR_LEAF
	db SLEEP_POWDER
	db GROWTH
	db FLASH