INCLUDE "constants.asm"


SECTION "bank1", ROMX

INCLUDE "data/facing.asm"
INCLUDE "engine/black_out.asm"

MewPicFront:: INCBIN "pic/bmon/mew.pic"
MewPicBack::  INCBIN "pic/monback/mewb.pic"
INCLUDE "data/baseStats/mew.asm"

INCLUDE "engine/battle/safari_zone.asm"
INCLUDE "engine/titlescreen.asm"
INCLUDE "engine/load_mon_data.asm"
INCLUDE "data/item_prices.asm"
INCLUDE "text/item_names.asm"
INCLUDE "text/unused_names.asm"
INCLUDE "engine/overworld/oam.asm"
INCLUDE "engine/oam_dma.asm"
INCLUDE "engine/print_waiting_text.asm"
INCLUDE "engine/overworld/map_sprite_functions1.asm"
INCLUDE "engine/test_battle.asm"
INCLUDE "engine/overworld/item.asm"
INCLUDE "engine/overworld/movement.asm"
INCLUDE "engine/cable_club.asm"
INCLUDE "engine/menu/main_menu.asm"
INCLUDE "engine/oak_speech.asm"
INCLUDE "engine/special_warps.asm"
INCLUDE "engine/debug1.asm"
INCLUDE "engine/menu/naming_screen.asm"
INCLUDE "engine/oak_speech2.asm"
INCLUDE "engine/subtract_paid_money.asm"
INCLUDE "engine/menu/swap_items.asm"
INCLUDE "engine/overworld/pokemart.asm"
INCLUDE "engine/learn_move.asm"
INCLUDE "engine/overworld/pokecenter.asm"
INCLUDE "engine/overworld/set_blackout_map.asm"
INCLUDE "engine/display_text_id_init.asm"
INCLUDE "engine/menu/draw_start_menu.asm"
INCLUDE "engine/overworld/cable_club_npc.asm"
INCLUDE "engine/menu/text_box.asm"
INCLUDE "engine/battle/moveEffects/drain_hp_effect.asm"
INCLUDE "engine/menu/players_pc.asm"
INCLUDE "engine/remove_pokemon.asm"
INCLUDE "engine/display_pokedex.asm"


SECTION "bank3", ROMX

INCLUDE "engine/joypad.asm"
INCLUDE "data/map_songs.asm"
INCLUDE "data/map_header_banks.asm"
INCLUDE "engine/overworld/clear_variables.asm"
INCLUDE "engine/overworld/player_state.asm"
INCLUDE "engine/overworld/poison.asm"
INCLUDE "engine/overworld/tileset_header.asm"
INCLUDE "engine/overworld/daycare_exp.asm"
INCLUDE "data/hide_show_data.asm"
INCLUDE "engine/overworld/field_move_messages.asm"
INCLUDE "engine/items/inventory.asm"
INCLUDE "engine/overworld/wild_mons.asm"
INCLUDE "engine/items/items.asm"
INCLUDE "engine/menu/draw_badges.asm"
INCLUDE "engine/overworld/update_map.asm"
INCLUDE "engine/overworld/cut.asm"
INCLUDE "engine/overworld/missable_objects.asm"
INCLUDE "engine/overworld/push_boulder.asm"
INCLUDE "engine/add_mon.asm"
INCLUDE "engine/flag_action.asm"
INCLUDE "engine/heal_party.asm"
INCLUDE "engine/bcd.asm"
INCLUDE "engine/init_player_data.asm"
INCLUDE "engine/get_bag_item_quantity.asm"
INCLUDE "engine/pathfinding.asm"
INCLUDE "engine/hp_bar.asm"
INCLUDE "engine/hidden_object_functions3.asm"


SECTION "Graphics (BANK 4)", ROMX

PokemonLogoGraphics:            INCBIN "gfx/title/pokemon_logo.2bpp"
FontGraphics::                  INCBIN "gfx/font/font.1bpp"
FontGraphicsEnd::
ABTiles:                        INCBIN "gfx/font/AB.2bpp"
HpBarAndStatusGraphics::        INCBIN "gfx/font/font_battle_extra.2bpp"
HpBarAndStatusGraphicsEnd::
BattleHudTiles1:                INCBIN "gfx/battle/battle_hud_1.1bpp"
BattleHudTiles1End:
BattleHudTiles2:                INCBIN "gfx/battle/battle_hud_2.1bpp"
BattleHudTiles3:                INCBIN "gfx/battle/battle_hud_3.1bpp"
BattleHudTiles3End:
NintendoCopyrightLogoGraphics:  INCBIN "gfx/intro_credits/copyright.2bpp"
GamefreakLogoGraphics:          INCBIN "gfx/title/gamefreak_inc.2bpp"
GamefreakLogoGraphicsEnd:
TextBoxGraphics::               INCBIN "gfx/font/font_extra.2bpp"
TextBoxGraphicsEnd::
PokedexTileGraphics:            INCBIN "gfx/pokedex/pokedex.2bpp"
PokedexTileGraphicsEnd:
WorldMapTileGraphics:           INCBIN "gfx/town_map/town_map.2bpp"
WorldMapTileGraphicsEnd:
PlayerCharacterTitleGraphics:   INCBIN "gfx/title/player.2bpp"
PlayerCharacterTitleGraphicsEnd:


SECTION "Battle (BANK 4)", ROMX

INCLUDE "engine/overworld/is_player_just_outside_map.asm"
INCLUDE "engine/menu/status_screen.asm"
INCLUDE "engine/menu/party_menu.asm"

RedPicFront:: INCBIN "pic/trainer/red.pic"
ShrinkPic1::  INCBIN "pic/trainer/shrink1.pic"
ShrinkPic2::  INCBIN "pic/trainer/shrink2.pic"

INCLUDE "engine/turn_sprite.asm"
INCLUDE "engine/menu/start_sub_menus.asm"
INCLUDE "engine/items/tms.asm"
INCLUDE "engine/battle/end_of_battle.asm"
INCLUDE "engine/battle/wild_encounters.asm"
INCLUDE "engine/battle/moveEffects/recoil_effect.asm"
INCLUDE "engine/battle/moveEffects/conversion_effect.asm"
INCLUDE "engine/battle/moveEffects/haze_effect.asm"
INCLUDE "engine/battle/get_trainer_name.asm"
INCLUDE "engine/random.asm"


SECTION "Battle (BANK 5)", ROMX

INCLUDE "engine/load_pokedex_tiles.asm"
INCLUDE "engine/overworld/map_sprites.asm"
INCLUDE "engine/overworld/emotion_bubbles.asm"
INCLUDE "engine/evolve_trade.asm"
INCLUDE "engine/battle/moveEffects/substitute_effect.asm"
INCLUDE "engine/menu/pc.asm"


SECTION "bank6_1", ROMX

INCLUDE "engine/play_time.asm"


SECTION "bank6_2", ROMX

INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/overworld/doors.asm"
INCLUDE "engine/overworld/ledges.asm"


SECTION "bank7_1", ROMX

INCLUDE "text/monster_names.asm"
INCLUDE "engine/clear_save.asm"
INCLUDE "engine/predefs7.asm"


SECTION "bank7_2", ROMX

INCLUDE "engine/menu/oaks_pc.asm"
INCLUDE "engine/hidden_object_functions7.asm"


SECTION "Battle (BANK 9)", ROMX

INCLUDE "engine/battle/print_type.asm"
INCLUDE "engine/battle/save_trainer_name.asm"
INCLUDE "engine/battle/moveEffects/focus_energy_effect.asm"


SECTION "Battle (BANK A)", ROMX

INCLUDE "engine/battle/moveEffects/leech_seed_effect.asm"


SECTION "Battle (BANK B)", ROMX

INCLUDE "engine/battle/display_effectiveness.asm"

TrainerInfoTextBoxTileGraphics:  INCBIN "gfx/trainer_card/trainer_info.2bpp"
TrainerInfoTextBoxTileGraphicsEnd:
BlankLeaderNames:                INCBIN "gfx/trainer_card/blank_leader_names.2bpp"
CircleTile:                      INCBIN "gfx/trainer_card/circle_tile.2bpp"
BadgeNumbersTileGraphics:        INCBIN "gfx/trainer_card/badge_numbers.2bpp"

INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/battle/scale_sprites.asm"
INCLUDE "engine/battle/moveEffects/pay_day_effect.asm"
INCLUDE "engine/game_corner_slots2.asm"


SECTION "Battle (BANK C)", ROMX

INCLUDE "engine/battle/moveEffects/mist_effect.asm"
INCLUDE "engine/battle/moveEffects/one_hit_ko_effect.asm"


SECTION "Battle (BANK D)", ROMX

INCLUDE "engine/titlescreen2.asm"
INCLUDE "engine/battle/link_battle_versus_text.asm"
INCLUDE "engine/slot_machine.asm"
INCLUDE "engine/overworld/pewter_guys.asm"
INCLUDE "engine/multiply_divide.asm"
INCLUDE "engine/game_corner_slots.asm"


SECTION "bankE", ROMX

INCLUDE "data/moves.asm"
INCLUDE "data/base_stats.asm"
INCLUDE "data/cries.asm"
INCLUDE "engine/battle/unused_stats_functions.asm"
INCLUDE "engine/battle/scroll_draw_trainer_pic.asm"
INCLUDE "engine/battle/trainer_ai.asm"
INCLUDE "engine/battle/draw_hud_pokeball_gfx.asm"

TradingAnimationGraphics:
INCBIN "gfx/trade/game_boy.2bpp"
INCBIN "gfx/trade/link_cable.2bpp"
TradingAnimationGraphicsEnd:

; Pokeball traveling through the link cable.
TradingAnimationGraphics2: INCBIN "gfx/trade/cable_ball.2bpp"
TradingAnimationGraphics2End:

INCLUDE "engine/evos_moves.asm"
INCLUDE "engine/battle/moveEffects/heal_effect.asm"
INCLUDE "engine/battle/moveEffects/transform_effect.asm"
INCLUDE "engine/battle/moveEffects/reflect_light_screen_effect.asm"


SECTION "bankF", ROMX

INCLUDE "engine/battle/core.asm"
INCLUDE "engine/battle/effects.asm"


SECTION "bank10", ROMX

INCLUDE "engine/menu/pokedex.asm"
INCLUDE "engine/trade.asm"
INCLUDE "engine/intro.asm"
INCLUDE "engine/trade2.asm"


SECTION "bank11_1", ROMX

INCLUDE "engine/pokedex_rating.asm"


SECTION "bank11_2", ROMX

INCLUDE "engine/overworld/hidden_objects.asm"


SECTION "bank12", ROMX

INCLUDE "engine/predefs12.asm"


SECTION "bank13", ROMX

INCLUDE "engine/give_pokemon.asm"
INCLUDE "engine/predefs.asm"


SECTION "bank14", ROMX

INCLUDE "engine/battle/init_battle_variables.asm"
INCLUDE "engine/battle/moveEffects/paralyze_effect.asm"
INCLUDE "engine/overworld/card_key.asm"
INCLUDE "engine/menu/prize_menu.asm"
INCLUDE "engine/hidden_object_functions14.asm"


SECTION "bank15_1", ROMX

INCLUDE "engine/battle/experience.asm"


SECTION "bank15_2", ROMX

INCLUDE "engine/menu/diploma.asm"
INCLUDE "engine/overworld/trainers.asm"


SECTION "bank16_1", ROMX

INCLUDE "engine/battle/common_text.asm"
INCLUDE "engine/experience.asm"
INCLUDE "engine/overworld/oaks_aide.asm"


SECTION "bank16_2", ROMX

INCLUDE "engine/overworld/saffron_guards.asm"


SECTION "bank17_1", ROMX

INCLUDE "engine/predefs17.asm"


SECTION "bank17_2", ROMX

INCLUDE "engine/predefs17_2.asm"
INCLUDE "engine/hidden_object_functions17.asm"


SECTION "bank18_1", ROMX

INCLUDE "engine/overworld/cinnabar_lab.asm"


SECTION "bank18_2", ROMX

INCLUDE "engine/hidden_object_functions18.asm"


SECTION "bank1A", ROMX

INCLUDE "engine/battle/decrement_pp.asm"

Version_GFX:
IF DEF(_RED)
	INCBIN "gfx/title/red_version.1bpp" ; 10 tiles
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/title/blue_version.1bpp" ; 8 tiles
ENDC
Version_GFXEnd:


SECTION "bank1C", ROMX

INCLUDE "engine/gamefreak.asm"
INCLUDE "engine/hall_of_fame.asm"
INCLUDE "engine/overworld/healing_machine.asm"
INCLUDE "engine/overworld/player_animations.asm"
INCLUDE "engine/battle/ghost_marowak_anim.asm"
INCLUDE "engine/battle/battle_transitions.asm"
INCLUDE "engine/town_map.asm"
INCLUDE "engine/mon_party_sprites.asm"
INCLUDE "engine/in_game_trades.asm"
INCLUDE "engine/palettes.asm"
INCLUDE "engine/save.asm"


SECTION "bank1D_1", ROMX

INCLUDE "engine/HoF_room_pc.asm"
INCLUDE "engine/status_ailments.asm"
INCLUDE "engine/items/itemfinder.asm"


SECTION "bank1D_2", ROMX

INCLUDE "engine/menu/vending_machine.asm"


SECTION "bank1D_3", ROMX

INCLUDE "engine/menu/league_pc.asm"
INCLUDE "engine/overworld/hidden_items.asm"


SECTION "bank1E", ROMX

INCLUDE "engine/battle/animations.asm"
INCLUDE "engine/overworld/cut2.asm"
INCLUDE "engine/overworld/ssanne.asm"

RedFishingTilesFront: INCBIN "gfx/overworld/red_fish_front.2bpp"
RedFishingTilesBack:  INCBIN "gfx/overworld/red_fish_back.2bpp"
RedFishingTilesSide:  INCBIN "gfx/overworld/red_fish_side.2bpp"
RedFishingRodTiles:   INCBIN "gfx/overworld/fishing_rod.2bpp"

INCLUDE "data/animations.asm"
INCLUDE "engine/evolution.asm"
INCLUDE "engine/overworld/elevator.asm"
INCLUDE "engine/items/tm_prices.asm"
