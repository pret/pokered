; toggleable objects for each map

ToggleableObjectMapPointers:
; entries correspond to map ids
	table_width 2
FOR n, NUM_MAPS
	IF DEF(TOGGLEMAP{n}) ; defined by `toggle_consts_for`
		dw ToggleData{n}
	ELSE
		dw NoToggleData
	ENDC
ENDR
	assert_table_length NUM_MAPS
	dw -1 ; end

NoToggleData:
	db -1, -1, -1 ; end

DEF toggles_ok = 1

MACRO? toggleable_objects_for
	DEF toggle_map_id = \1 ; map id
	ToggleData{toggle_map_id}:
	IF toggles_ok
		ASSERT DEF(TOGGLEMAP{toggle_map_id}), \
			"`toggleable_objects_for \1` is not defined"
		DEF toggles_ok &= DEF(TOGGLEMAP{toggle_map_id})
		IF toggles_ok
			assert_table_length TOGGLEMAP{toggle_map_id}
			DEF toggles_ok &= TOGGLEMAP{toggle_map_id} * 3 == @ - ToggleableObjectStates
		ENDC
	ENDC
ENDM

MACRO toggle_object_state
	db toggle_map_id ; from previous `toggleable_objects_for`
	db \1 ; object id
	db \2 ; OFF/ON
ENDM

ToggleableObjectStates:
; entries correspond to TOGGLE_* constants (see constants/toggle_constants.asm)
	table_width 3

	toggleable_objects_for PALLET_TOWN
	toggle_object_state PALLETTOWN_OAK, OFF

	toggleable_objects_for VIRIDIAN_CITY
	toggle_object_state VIRIDIANCITY_OLD_MAN_SLEEPY, ON
	toggle_object_state VIRIDIANCITY_OLD_MAN,        OFF

	toggleable_objects_for PEWTER_CITY
	toggle_object_state PEWTERCITY_SUPER_NERD1, ON
	toggle_object_state PEWTERCITY_YOUNGSTER,   ON

	toggleable_objects_for CERULEAN_CITY
	toggle_object_state CERULEANCITY_RIVAL,       OFF
	toggle_object_state CERULEANCITY_ROCKET,      ON
	toggle_object_state CERULEANCITY_GUARD1,      OFF
	toggle_object_state CERULEANCITY_SUPER_NERD3, ON
	toggle_object_state CERULEANCITY_GUARD2,      ON

	toggleable_objects_for SAFFRON_CITY
	toggle_object_state SAFFRONCITY_ROCKET1,        ON
	toggle_object_state SAFFRONCITY_ROCKET2,        ON
	toggle_object_state SAFFRONCITY_ROCKET3,        ON
	toggle_object_state SAFFRONCITY_ROCKET4,        ON
	toggle_object_state SAFFRONCITY_ROCKET5,        ON
	toggle_object_state SAFFRONCITY_ROCKET6,        ON
	toggle_object_state SAFFRONCITY_ROCKET7,        ON
	toggle_object_state SAFFRONCITY_SCIENTIST,      OFF
	toggle_object_state SAFFRONCITY_SILPH_WORKER_M, OFF
	toggle_object_state SAFFRONCITY_SILPH_WORKER_F, OFF
	toggle_object_state SAFFRONCITY_GENTLEMAN,      OFF
	toggle_object_state SAFFRONCITY_PIDGEOT,        OFF
	toggle_object_state SAFFRONCITY_ROCKER,         OFF
	toggle_object_state SAFFRONCITY_ROCKET8,        ON
	toggle_object_state SAFFRONCITY_ROCKET9,        OFF

	toggleable_objects_for ROUTE_2
	toggle_object_state ROUTE2_MOON_STONE, ON
	toggle_object_state ROUTE2_HP_UP,      ON

	toggleable_objects_for ROUTE_4
	toggle_object_state ROUTE4_TM_WHIRLWIND, ON

	toggleable_objects_for ROUTE_9
	toggle_object_state ROUTE9_TM_TELEPORT, ON

	toggleable_objects_for ROUTE_12
	toggle_object_state ROUTE12_SNORLAX,    ON
	toggle_object_state ROUTE12_TM_PAY_DAY, ON
	toggle_object_state ROUTE12_IRON,       ON

	toggleable_objects_for ROUTE_15
	toggle_object_state ROUTE15_TM_RAGE, ON

	toggleable_objects_for ROUTE_16
	toggle_object_state ROUTE16_SNORLAX, ON

	toggleable_objects_for ROUTE_22
	toggle_object_state ROUTE22_RIVAL1, OFF
	toggle_object_state ROUTE22_RIVAL2, OFF

	toggleable_objects_for ROUTE_24
	toggle_object_state ROUTE24_COOLTRAINER_M1,  ON
	toggle_object_state ROUTE24_TM_THUNDER_WAVE, ON

	toggleable_objects_for ROUTE_25
	toggle_object_state ROUTE25_TM_SEISMIC_TOSS, ON

	toggleable_objects_for BLUES_HOUSE
	toggle_object_state BLUESHOUSE_DAISY1,   ON
	toggle_object_state BLUESHOUSE_DAISY2,   OFF
	toggle_object_state BLUESHOUSE_TOWN_MAP, ON

	toggleable_objects_for OAKS_LAB
	toggle_object_state OAKSLAB_RIVAL,                ON
	toggle_object_state OAKSLAB_CHARMANDER_POKE_BALL, ON
	toggle_object_state OAKSLAB_SQUIRTLE_POKE_BALL,   ON
	toggle_object_state OAKSLAB_BULBASAUR_POKE_BALL,  ON
	toggle_object_state OAKSLAB_OAK1,                 OFF
	toggle_object_state OAKSLAB_POKEDEX1,             ON
	toggle_object_state OAKSLAB_POKEDEX2,             ON
	toggle_object_state OAKSLAB_OAK2,                 OFF

	toggleable_objects_for VIRIDIAN_GYM
	toggle_object_state VIRIDIANGYM_GIOVANNI, ON
	toggle_object_state VIRIDIANGYM_REVIVE,   ON

	toggleable_objects_for MUSEUM_1F
	toggle_object_state MUSEUM1F_OLD_AMBER, ON

	toggleable_objects_for CERULEAN_CAVE_1F
	toggle_object_state CERULEANCAVE1F_FULL_RESTORE, ON
	toggle_object_state CERULEANCAVE1F_MAX_ELIXER,   ON
	toggle_object_state CERULEANCAVE1F_NUGGET,       ON

	toggleable_objects_for POKEMON_TOWER_2F
	toggle_object_state POKEMONTOWER2F_RIVAL, ON

	toggleable_objects_for POKEMON_TOWER_3F
	toggle_object_state POKEMONTOWER3F_ESCAPE_ROPE, ON

	toggleable_objects_for POKEMON_TOWER_4F
	toggle_object_state POKEMONTOWER4F_ELIXER,    ON
	toggle_object_state POKEMONTOWER4F_AWAKENING, ON
	toggle_object_state POKEMONTOWER4F_HP_UP,     ON

	toggleable_objects_for POKEMON_TOWER_5F
	toggle_object_state POKEMONTOWER5F_NUGGET, ON

	toggleable_objects_for POKEMON_TOWER_6F
	toggle_object_state POKEMONTOWER6F_RARE_CANDY, ON
	toggle_object_state POKEMONTOWER6F_X_ACCURACY, ON

	toggleable_objects_for POKEMON_TOWER_7F
	toggle_object_state POKEMONTOWER7F_ROCKET1, ON
	toggle_object_state POKEMONTOWER7F_ROCKET2, ON
	toggle_object_state POKEMONTOWER7F_ROCKET3, ON
	toggle_object_state POKEMONTOWER7F_MR_FUJI, ON

	toggleable_objects_for MR_FUJIS_HOUSE
	toggle_object_state MRFUJISHOUSE_MR_FUJI, OFF

	toggleable_objects_for CELADON_MANSION_ROOF_HOUSE
	toggle_object_state CELADONMANSION_ROOF_HOUSE_EEVEE_POKEBALL, ON

	toggleable_objects_for GAME_CORNER
	toggle_object_state GAMECORNER_ROCKET, ON

	toggleable_objects_for WARDENS_HOUSE
	toggle_object_state WARDENSHOUSE_RARE_CANDY, ON

	toggleable_objects_for POKEMON_MANSION_1F
	toggle_object_state POKEMONMANSION1F_ESCAPE_ROPE, ON
	toggle_object_state POKEMONMANSION1F_CARBOS,      ON

	toggleable_objects_for FIGHTING_DOJO
	toggle_object_state FIGHTINGDOJO_HITMONLEE_POKE_BALL,  ON
	toggle_object_state FIGHTINGDOJO_HITMONCHAN_POKE_BALL, ON

	toggleable_objects_for SILPH_CO_1F
	toggle_object_state SILPHCO1F_LINK_RECEPTIONIST, OFF

	toggleable_objects_for POWER_PLANT
	toggle_object_state POWERPLANT_VOLTORB1,   ON
	toggle_object_state POWERPLANT_VOLTORB2,   ON
	toggle_object_state POWERPLANT_VOLTORB3,   ON
	toggle_object_state POWERPLANT_ELECTRODE1, ON
	toggle_object_state POWERPLANT_VOLTORB4,   ON
	toggle_object_state POWERPLANT_VOLTORB5,   ON
	toggle_object_state POWERPLANT_ELECTRODE2, ON
	toggle_object_state POWERPLANT_VOLTORB6,   ON
	toggle_object_state POWERPLANT_ZAPDOS,     ON
	toggle_object_state POWERPLANT_CARBOS,     ON
	toggle_object_state POWERPLANT_HP_UP,      ON
	toggle_object_state POWERPLANT_RARE_CANDY, ON
	toggle_object_state POWERPLANT_TM_THUNDER, ON
	toggle_object_state POWERPLANT_TM_REFLECT, ON

	toggleable_objects_for VICTORY_ROAD_2F
	toggle_object_state VICTORYROAD2F_MOLTRES,       ON
	toggle_object_state VICTORYROAD2F_TM_SUBMISSION, ON
	toggle_object_state VICTORYROAD2F_FULL_HEAL,     ON
	toggle_object_state VICTORYROAD2F_TM_MEGA_KICK,  ON
	toggle_object_state VICTORYROAD2F_GUARD_SPEC,    ON
	toggle_object_state VICTORYROAD2F_BOULDER3,      ON

	toggleable_objects_for BILLS_HOUSE
	toggle_object_state BILLSHOUSE_BILL_POKEMON, ON
	toggle_object_state BILLSHOUSE_BILL1,        OFF
	toggle_object_state BILLSHOUSE_BILL2,        OFF

	toggleable_objects_for VIRIDIAN_FOREST
	toggle_object_state VIRIDIANFOREST_ANTIDOTE,  ON
	toggle_object_state VIRIDIANFOREST_POTION,    ON
	toggle_object_state VIRIDIANFOREST_POKE_BALL, ON

	toggleable_objects_for MT_MOON_1F
	toggle_object_state MTMOON1F_POTION1,      ON
	toggle_object_state MTMOON1F_MOON_STONE,   ON
	toggle_object_state MTMOON1F_RARE_CANDY,   ON
	toggle_object_state MTMOON1F_ESCAPE_ROPE,  ON
	toggle_object_state MTMOON1F_POTION2,      ON
	toggle_object_state MTMOON1F_TM_WATER_GUN, ON

	toggleable_objects_for MT_MOON_B2F
	toggle_object_state MTMOONB2F_DOME_FOSSIL,   ON
	toggle_object_state MTMOONB2F_HELIX_FOSSIL,  ON
	toggle_object_state MTMOONB2F_HP_UP,         ON
	toggle_object_state MTMOONB2F_TM_MEGA_PUNCH, ON

	toggleable_objects_for SS_ANNE_2F
	toggle_object_state SSANNE2F_RIVAL, OFF

	toggleable_objects_for SS_ANNE_1F_ROOMS
	toggle_object_state SSANNE1FROOMS_TM_BODY_SLAM, ON

	toggleable_objects_for SS_ANNE_2F_ROOMS
	toggle_object_state SSANNE2FROOMS_MAX_ETHER,  ON
	toggle_object_state SSANNE2FROOMS_RARE_CANDY, ON

	toggleable_objects_for SS_ANNE_B1F_ROOMS
	toggle_object_state SSANNEB1FROOMS_ETHER,      ON
	toggle_object_state SSANNEB1FROOMS_TM_REST,    ON
	toggle_object_state SSANNEB1FROOMS_MAX_POTION, ON

	toggleable_objects_for VICTORY_ROAD_3F
	toggle_object_state VICTORYROAD3F_MAX_REVIVE,   ON
	toggle_object_state VICTORYROAD3F_TM_EXPLOSION, ON
	toggle_object_state VICTORYROAD3F_BOULDER4,     ON

	toggleable_objects_for ROCKET_HIDEOUT_B1F
	toggle_object_state ROCKETHIDEOUTB1F_ESCAPE_ROPE,  ON
	toggle_object_state ROCKETHIDEOUTB1F_HYPER_POTION, ON

	toggleable_objects_for ROCKET_HIDEOUT_B2F
	toggle_object_state ROCKETHIDEOUTB2F_MOON_STONE,    ON
	toggle_object_state ROCKETHIDEOUTB2F_NUGGET,        ON
	toggle_object_state ROCKETHIDEOUTB2F_TM_HORN_DRILL, ON
	toggle_object_state ROCKETHIDEOUTB2F_SUPER_POTION,  ON

	toggleable_objects_for ROCKET_HIDEOUT_B3F
	toggle_object_state ROCKETHIDEOUTB3F_TM_DOUBLE_EDGE, ON
	toggle_object_state ROCKETHIDEOUTB3F_RARE_CANDY,     ON

	toggleable_objects_for ROCKET_HIDEOUT_B4F
	toggle_object_state ROCKETHIDEOUTB4F_GIOVANNI,      ON
	toggle_object_state ROCKETHIDEOUTB4F_HP_UP,         ON
	toggle_object_state ROCKETHIDEOUTB4F_TM_RAZOR_WIND, ON
	toggle_object_state ROCKETHIDEOUTB4F_IRON,          ON
	toggle_object_state ROCKETHIDEOUTB4F_SILPH_SCOPE,   OFF
	toggle_object_state ROCKETHIDEOUTB4F_LIFT_KEY,      OFF

	toggleable_objects_for SILPH_CO_2F
	toggle_object_state SILPHCO2F_SILPH_WORKER_F, ON
	toggle_object_state SILPHCO2F_SCIENTIST1,     ON
	toggle_object_state SILPHCO2F_SCIENTIST2,     ON
	toggle_object_state SILPHCO2F_ROCKET1,        ON
	toggle_object_state SILPHCO2F_ROCKET2,        ON

	toggleable_objects_for SILPH_CO_3F
	toggle_object_state SILPHCO3F_ROCKET,       ON
	toggle_object_state SILPHCO3F_SCIENTIST,    ON
	toggle_object_state SILPHCO3F_HYPER_POTION, ON

	toggleable_objects_for SILPH_CO_4F
	toggle_object_state SILPHCO4F_ROCKET1,     ON
	toggle_object_state SILPHCO4F_SCIENTIST,   ON
	toggle_object_state SILPHCO4F_ROCKET2,     ON
	toggle_object_state SILPHCO4F_FULL_HEAL,   ON
	toggle_object_state SILPHCO4F_MAX_REVIVE,  ON
	toggle_object_state SILPHCO4F_ESCAPE_ROPE, ON

	toggleable_objects_for SILPH_CO_5F
	toggle_object_state SILPHCO5F_ROCKET1,      ON
	toggle_object_state SILPHCO5F_SCIENTIST,    ON
	toggle_object_state SILPHCO5F_ROCKER,       ON
	toggle_object_state SILPHCO5F_ROCKET2,      ON
	toggle_object_state SILPHCO5F_TM_TAKE_DOWN, ON
	toggle_object_state SILPHCO5F_PROTEIN,      ON
	toggle_object_state SILPHCO5F_CARD_KEY,     ON

	toggleable_objects_for SILPH_CO_6F
	toggle_object_state SILPHCO6F_ROCKET1,    ON
	toggle_object_state SILPHCO6F_SCIENTIST,  ON
	toggle_object_state SILPHCO6F_ROCKET2,    ON
	toggle_object_state SILPHCO6F_HP_UP,      ON
	toggle_object_state SILPHCO6F_X_ACCURACY, ON

	toggleable_objects_for SILPH_CO_7F
	toggle_object_state SILPHCO7F_ROCKET1,         ON
	toggle_object_state SILPHCO7F_SCIENTIST,       ON
	toggle_object_state SILPHCO7F_ROCKET2,         ON
	toggle_object_state SILPHCO7F_ROCKET3,         ON
	toggle_object_state SILPHCO7F_RIVAL,           ON
	toggle_object_state SILPHCO7F_CALCIUM,         ON
	toggle_object_state SILPHCO7F_TM_SWORDS_DANCE, ON
	toggle_object_state SILPHCO7F_UNUSED,          ON

	toggleable_objects_for SILPH_CO_8F
	toggle_object_state SILPHCO8F_ROCKET1,   ON
	toggle_object_state SILPHCO8F_SCIENTIST, ON
	toggle_object_state SILPHCO8F_ROCKET2,   ON

	toggleable_objects_for SILPH_CO_9F
	toggle_object_state SILPHCO9F_ROCKET1,   ON
	toggle_object_state SILPHCO9F_SCIENTIST, ON
	toggle_object_state SILPHCO9F_ROCKET2,   ON

	toggleable_objects_for SILPH_CO_10F
	toggle_object_state SILPHCO10F_ROCKET,         ON
	toggle_object_state SILPHCO10F_SCIENTIST,      ON
	toggle_object_state SILPHCO10F_SILPH_WORKER_F, ON
	toggle_object_state SILPHCO10F_TM_EARTHQUAKE,  ON
	toggle_object_state SILPHCO10F_RARE_CANDY,     ON
	toggle_object_state SILPHCO10F_CARBOS,         ON

	toggleable_objects_for SILPH_CO_11F
	toggle_object_state SILPHCO11F_GIOVANNI, ON
	toggle_object_state SILPHCO11F_ROCKET1,  ON
	toggle_object_state SILPHCO11F_ROCKET2,  ON

	toggleable_objects_for UNUSED_MAP_F4
	toggle_object_state $02, ON ; unused

	toggleable_objects_for POKEMON_MANSION_2F
	toggle_object_state POKEMONMANSION2F_CALCIUM, ON

	toggleable_objects_for POKEMON_MANSION_3F
	toggle_object_state POKEMONMANSION3F_MAX_POTION, ON
	toggle_object_state POKEMONMANSION3F_IRON,       ON

	toggleable_objects_for POKEMON_MANSION_B1F
	toggle_object_state POKEMONMANSIONB1F_RARE_CANDY,   ON
	toggle_object_state POKEMONMANSIONB1F_FULL_RESTORE, ON
	toggle_object_state POKEMONMANSIONB1F_TM_BLIZZARD,  ON
	toggle_object_state POKEMONMANSIONB1F_TM_SOLARBEAM, ON
	toggle_object_state POKEMONMANSIONB1F_SECRET_KEY,   ON

	toggleable_objects_for SAFARI_ZONE_EAST
	toggle_object_state SAFARIZONEEAST_FULL_RESTORE, ON
	toggle_object_state SAFARIZONEEAST_MAX_RESTORE,  ON
	toggle_object_state SAFARIZONEEAST_CARBOS,       ON
	toggle_object_state SAFARIZONEEAST_TM_EGG_BOMB,  ON

	toggleable_objects_for SAFARI_ZONE_NORTH
	toggle_object_state SAFARIZONENORTH_PROTEIN,       ON
	toggle_object_state SAFARIZONENORTH_TM_SKULL_BASH, ON

	toggleable_objects_for SAFARI_ZONE_WEST
	toggle_object_state SAFARIZONEWEST_MAX_POTION,     ON
	toggle_object_state SAFARIZONEWEST_TM_DOUBLE_TEAM, ON
	toggle_object_state SAFARIZONEWEST_MAX_REVIVE,     ON
	toggle_object_state SAFARIZONEWEST_GOLD_TEETH,     ON

	toggleable_objects_for SAFARI_ZONE_CENTER
	toggle_object_state SAFARIZONECENTER_NUGGET, ON

	toggleable_objects_for CERULEAN_CAVE_2F
	toggle_object_state CERULEANCAVE2F_PP_UP,        ON
	toggle_object_state CERULEANCAVE2F_ULTRA_BALL,   ON
	toggle_object_state CERULEANCAVE2F_FULL_RESTORE, ON

	toggleable_objects_for CERULEAN_CAVE_B1F
	toggle_object_state CERULEANCAVEB1F_MEWTWO,     ON
	toggle_object_state CERULEANCAVEB1F_ULTRA_BALL, ON
	toggle_object_state CERULEANCAVEB1F_MAX_REVIVE, ON

	toggleable_objects_for VICTORY_ROAD_1F
	toggle_object_state VICTORYROAD1F_TM_SKY_ATTACK, ON
	toggle_object_state VICTORYROAD1F_RARE_CANDY,    ON

	toggleable_objects_for CHAMPIONS_ROOM
	toggle_object_state CHAMPIONSROOM_OAK, OFF

	toggleable_objects_for SEAFOAM_ISLANDS_1F
	toggle_object_state SEAFOAMISLANDS1F_BOULDER1, ON
	toggle_object_state SEAFOAMISLANDS1F_BOULDER2, ON

	toggleable_objects_for SEAFOAM_ISLANDS_B1F
	toggle_object_state SEAFOAMISLANDSB1F_BOULDER1, OFF
	toggle_object_state SEAFOAMISLANDSB1F_BOULDER2, OFF

	toggleable_objects_for SEAFOAM_ISLANDS_B2F
	toggle_object_state SEAFOAMISLANDSB2F_BOULDER1, OFF
	toggle_object_state SEAFOAMISLANDSB2F_BOULDER2, OFF

	toggleable_objects_for SEAFOAM_ISLANDS_B3F
	toggle_object_state SEAFOAMISLANDSB3F_BOULDER2, ON
	toggle_object_state SEAFOAMISLANDSB3F_BOULDER3, ON
	toggle_object_state SEAFOAMISLANDSB3F_BOULDER5, OFF
	toggle_object_state SEAFOAMISLANDSB3F_BOULDER6, OFF

	toggleable_objects_for SEAFOAM_ISLANDS_B4F
	toggle_object_state SEAFOAMISLANDSB4F_BOULDER1, OFF
	toggle_object_state SEAFOAMISLANDSB4F_BOULDER2, OFF
	toggle_object_state SEAFOAMISLANDSB4F_ARTICUNO, ON

	assert_table_length NUM_TOGGLEABLE_OBJECTS

	db -1, 1, ON ; end
