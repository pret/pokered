SECTION "bank1", ROMX
; PureRGBnote: MOVED: mew's base stats was moved, and unused_names.asm was removed completely
INCLUDE "data/sprites/facings.asm"
INCLUDE "engine/events/black_out.asm"
INCLUDE "engine/battle/safari_zone.asm"
INCLUDE "engine/movie/title.asm"
INCLUDE "engine/pokemon/load_mon_data.asm"
INCLUDE "data/items/prices.asm"
INCLUDE "data/items/names.asm"
INCLUDE "engine/gfx/sprite_oam.asm"
INCLUDE "engine/gfx/oam_dma.asm"
INCLUDE "engine/link/print_waiting_text.asm"
INCLUDE "engine/overworld/sprite_collisions.asm"
INCLUDE "engine/debug/debug_menu.asm"
INCLUDE "engine/events/pick_up_item.asm"
INCLUDE "engine/overworld/movement.asm"
INCLUDE "engine/link/cable_club.asm"
INCLUDE "engine/menus/main_menu.asm"
INCLUDE "engine/movie/oak_speech/oak_speech.asm"
INCLUDE "engine/overworld/special_warps.asm"
INCLUDE "engine/debug/debug_party.asm"
INCLUDE "engine/menus/naming_screen.asm"
INCLUDE "engine/movie/oak_speech/oak_speech2.asm"
INCLUDE "engine/items/subtract_paid_money.asm"
INCLUDE "engine/menus/swap_items.asm"
INCLUDE "engine/events/pokemart.asm"
INCLUDE "engine/pokemon/learn_move.asm"
INCLUDE "engine/events/pokecenter.asm"
INCLUDE "engine/events/set_blackout_map.asm"
INCLUDE "engine/menus/display_text_id_init.asm"
INCLUDE "engine/menus/draw_start_menu.asm"
INCLUDE "engine/link/cable_club_npc.asm"
INCLUDE "engine/menus/text_box.asm"
INCLUDE "engine/battle/move_effects/drain_hp.asm"
INCLUDE "engine/menus/players_pc.asm"
INCLUDE "engine/pokemon/remove_mon.asm"
INCLUDE "engine/events/display_pokedex.asm"
INCLUDE "engine/menus/menu_list_tm_name_loader.asm" ; PureRGBnote: ADDED: code for showing TM names in list menus
INCLUDE "engine/menus/wrap_list_menu.asm" ; PureRGBnote: ADDED: code for wrapping to the bottom and top of lists by pressing dpad left


SECTION "bank3", ROMX
; PureRGBnote: MOVED: wild_mons.asm was moved out of this bank
INCLUDE "engine/joypad.asm"
INCLUDE "data/maps/songs.asm"
INCLUDE "data/maps/map_header_banks.asm"
INCLUDE "engine/overworld/clear_variables.asm"
INCLUDE "engine/overworld/player_state.asm"
INCLUDE "engine/events/poison.asm"
INCLUDE "engine/overworld/tilesets.asm"
INCLUDE "engine/overworld/daycare_exp.asm"
INCLUDE "data/maps/hide_show_data.asm"
INCLUDE "engine/overworld/field_move_messages.asm"
INCLUDE "engine/items/inventory.asm"
INCLUDE "engine/items/item_effects.asm"
INCLUDE "engine/menus/draw_badges.asm"
INCLUDE "engine/overworld/update_map.asm"
INCLUDE "engine/overworld/cut.asm"
INCLUDE "engine/overworld/missable_objects.asm"
INCLUDE "engine/overworld/push_boulder.asm"
INCLUDE "engine/pokemon/add_mon.asm"
INCLUDE "engine/flag_action.asm"
INCLUDE "engine/events/heal_party.asm"
INCLUDE "engine/math/bcd.asm"
INCLUDE "engine/movie/oak_speech/init_player_data.asm"
INCLUDE "engine/items/get_bag_item_quantity.asm"
INCLUDE "engine/overworld/pathfinding.asm"
INCLUDE "engine/gfx/hp_bar.asm"
INCLUDE "engine/events/hidden_objects/bookshelves.asm"
INCLUDE "engine/events/hidden_objects/indigo_plateau_statues.asm"
INCLUDE "engine/events/hidden_objects/book_or_sculpture.asm"
INCLUDE "engine/events/hidden_objects/elevator.asm"
INCLUDE "engine/events/hidden_objects/town_map.asm"
INCLUDE "engine/events/hidden_objects/pokemon_stuff.asm"


SECTION "Font Graphics", ROMX

INCLUDE "gfx/font.asm"


SECTION "Battle Engine 1", ROMX

INCLUDE "engine/overworld/is_player_just_outside_map.asm"
INCLUDE "engine/pokemon/status_screen.asm"
INCLUDE "engine/menus/party_menu.asm"
INCLUDE "gfx/player.asm"
INCLUDE "engine/overworld/turn_sprite.asm"
INCLUDE "engine/menus/start_sub_menus.asm"
INCLUDE "engine/items/tms.asm"
INCLUDE "engine/battle/end_of_battle.asm"
INCLUDE "engine/battle/wild_encounters.asm"
INCLUDE "engine/battle/move_effects/recoil.asm"
INCLUDE "engine/battle/get_trainer_name.asm"
INCLUDE "engine/math/random.asm"


SECTION "Battle Engine 2", ROMX

INCLUDE "engine/gfx/load_pokedex_tiles.asm"
INCLUDE "engine/overworld/map_sprites.asm"
INCLUDE "engine/overworld/emotion_bubbles.asm"
INCLUDE "engine/events/evolve_trade.asm"
INCLUDE "engine/battle/move_effects/substitute.asm"
INCLUDE "engine/menus/pc.asm"


SECTION "Play Time", ROMX

INCLUDE "engine/play_time.asm"


SECTION "Doors and Ledges", ROMX

INCLUDE "engine/overworld/auto_movement.asm"
INCLUDE "engine/overworld/doors.asm"
INCLUDE "engine/overworld/ledges.asm"


SECTION "Pokémon Names", ROMX

INCLUDE "data/pokemon/names.asm"
INCLUDE "engine/movie/oak_speech/clear_save.asm"
INCLUDE "engine/events/elevator.asm"


SECTION "Hidden Objects 1", ROMX

INCLUDE "engine/menus/oaks_pc.asm"
INCLUDE "engine/events/hidden_objects/new_bike.asm"
INCLUDE "engine/events/hidden_objects/oaks_lab_posters.asm"
INCLUDE "engine/events/hidden_objects/safari_game.asm"
INCLUDE "engine/events/hidden_objects/cinnabar_gym_quiz.asm"
INCLUDE "engine/events/hidden_objects/magazines.asm"
INCLUDE "engine/events/hidden_objects/bills_house_pc.asm"
INCLUDE "engine/events/hidden_objects/oaks_lab_email.asm"


SECTION "Bill's PC", ROMX

INCLUDE "engine/pokemon/bills_pc.asm"


SECTION "Battle Engine 3", ROMX

INCLUDE "engine/battle/print_type.asm"
INCLUDE "engine/battle/save_trainer_name.asm"
INCLUDE "engine/battle/move_effects/focus_energy.asm"


SECTION "Battle Engine 4", ROMX

INCLUDE "engine/battle/move_effects/leech_seed.asm"


SECTION "Battle Engine 5", ROMX

INCLUDE "engine/battle/display_effectiveness.asm"
INCLUDE "gfx/trainer_card.asm"
INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/battle/scale_sprites.asm"
INCLUDE "engine/battle/move_effects/pay_day.asm"
INCLUDE "engine/slots/game_corner_slots2.asm"


SECTION "Battle Engine 6", ROMX

INCLUDE "engine/battle/move_effects/mist.asm"
INCLUDE "engine/battle/move_effects/one_hit_ko.asm"


SECTION "Slot Machines", ROMX

INCLUDE "engine/movie/title2.asm"
INCLUDE "engine/battle/link_battle_versus_text.asm"
INCLUDE "engine/slots/slot_machine.asm"
INCLUDE "engine/events/pewter_guys.asm"
INCLUDE "engine/math/multiply_divide.asm"
INCLUDE "engine/slots/game_corner_slots.asm"


SECTION "Battle Engine 7", ROMX

INCLUDE "data/moves/moves.asm"
INCLUDE "data/pokemon/cries.asm"
INCLUDE "engine/battle/stats_functions.asm"
INCLUDE "engine/battle/scroll_draw_trainer_pic.asm"
INCLUDE "engine/battle/trainer_ai.asm"
INCLUDE "engine/battle/draw_hud_pokeball_gfx.asm"
INCLUDE "gfx/trade.asm"
INCLUDE "engine/battle/trainers2.asm" ; PureRGBnote: MOVED: moved from home bank
INCLUDE "engine/battle/move_effects/check_defrost_move.asm" ; PureRGBnote: ADDED: new code for bugfix
INCLUDE "engine/battle/move_effects/haze.asm" ; PureRGBnote: MOVED: moved from battle engine 1

SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"
INCLUDE "engine/battle/effects.asm"


SECTION "bank10", ROMX

INCLUDE "engine/menus/pokedex.asm"
INCLUDE "engine/movie/trade.asm"
INCLUDE "engine/movie/intro.asm"
INCLUDE "engine/movie/trade2.asm"
;;;;;;;;;; PureRGBnote: ADDED: new code for the movedex
INCLUDE "engine/menus/movedex.asm"
INCLUDE "data/moves/movedex_type_palettes.asm"
;;;;;;;;;;

SECTION "Pokédex Rating", ROMX

INCLUDE "engine/events/pokedex_rating.asm"


SECTION "Hidden Objects Core", ROMX

INCLUDE "engine/overworld/hidden_objects.asm"


SECTION "Screen Effects", ROMX

INCLUDE "engine/gfx/screen_effects.asm"


SECTION "Predefs", ROMX

INCLUDE "engine/events/give_pokemon.asm"
INCLUDE "engine/predefs.asm"


SECTION "Battle Engine 8", ROMX

INCLUDE "engine/battle/init_battle_variables.asm"
INCLUDE "engine/battle/move_effects/paralyze.asm"
INCLUDE "engine/battle/move_effects/burn.asm" ; PureRGBnote: ADDED: new burn effect code
; PureRGBnote: MOVED: moved from battle engine 7
INCLUDE "engine/battle/move_effects/heal.asm"
INCLUDE "engine/battle/move_effects/transform.asm"
INCLUDE "engine/battle/move_effects/reflect_light_screen.asm"
INCLUDE "engine/battle/move_effects/tri_attack.asm" ; PureRGBnote: ADDED: new tri attack effect code



SECTION "Hidden Objects 2", ROMX

INCLUDE "engine/events/card_key.asm"
INCLUDE "engine/events/prize_menu.asm"
INCLUDE "engine/events/hidden_objects/school_notebooks.asm"
INCLUDE "engine/events/hidden_objects/fighting_dojo.asm"
INCLUDE "engine/events/hidden_objects/indigo_plateau_hq.asm"


SECTION "Battle Engine 9", ROMX

INCLUDE "engine/battle/experience.asm"


SECTION "Diploma", ROMX

INCLUDE "engine/events/diploma.asm"


SECTION "Trainer Sight", ROMX

INCLUDE "engine/overworld/trainer_sight.asm"


SECTION "Battle Engine 10", ROMX

INCLUDE "engine/battle/common_text.asm"
INCLUDE "engine/pokemon/experience.asm"
INCLUDE "engine/events/oaks_aide.asm"


SECTION "Saffron Guards", ROMX

INCLUDE "engine/events/saffron_guards.asm"


SECTION "Starter Dex", ROMX

INCLUDE "engine/events/starter_dex.asm"


SECTION "Hidden Objects 3", ROMX

INCLUDE "engine/pokemon/set_types.asm"
INCLUDE "engine/events/hidden_objects/reds_room.asm"
INCLUDE "engine/events/hidden_objects/route_15_binoculars.asm"
INCLUDE "engine/events/hidden_objects/museum_fossils.asm"
INCLUDE "engine/events/hidden_objects/school_blackboard.asm"
INCLUDE "engine/events/hidden_objects/vermilion_gym_trash.asm"
; PureRGBnote: ADDED: new hidden objects code files
INCLUDE "engine/events/hidden_objects/fossil_guys_pc.asm"
INCLUDE "engine/events/hidden_objects/cerulean_rocket_house.asm"
INCLUDE "engine/events/hidden_objects/school_house_b1f_bookcases.asm"


SECTION "Cinnabar Lab Fossils", ROMX

INCLUDE "engine/events/cinnabar_lab.asm"


SECTION "Hidden Objects 4", ROMX

INCLUDE "engine/events/hidden_objects/gym_statues.asm"
INCLUDE "engine/events/hidden_objects/bench_guys.asm"
INCLUDE "engine/events/hidden_objects/blues_room.asm"
INCLUDE "engine/events/hidden_objects/pokecenter_pc.asm"


SECTION "Battle Engine 11", ROMX

INCLUDE "engine/battle/decrement_pp.asm"
INCLUDE "gfx/version.asm"


SECTION "bank1C", ROMX
; PureRGBnote: MOVED: splash.asm, healing_machine.asm, and hall_of_fame.asm were moved
INCLUDE "engine/overworld/player_animations.asm"
INCLUDE "engine/battle/ghost_marowak_anim.asm"
INCLUDE "engine/battle/battle_transitions.asm"
INCLUDE "engine/items/town_map.asm"
INCLUDE "engine/gfx/mon_icons.asm"
INCLUDE "engine/events/in_game_trades.asm"
INCLUDE "engine/gfx/palettes.asm"
INCLUDE "engine/menus/save.asm"


SECTION "Itemfinder 1", ROMX

INCLUDE "engine/movie/credits.asm"
INCLUDE "engine/pokemon/status_ailments.asm"
INCLUDE "engine/items/itemfinder.asm"


SECTION "Vending Machine", ROMX

INCLUDE "engine/events/vending_machine.asm"


SECTION "Itemfinder 2", ROMX

INCLUDE "engine/menus/league_pc.asm"
INCLUDE "engine/events/hidden_items.asm"
; PureRGBnote: MOVED: moved these from bank 1E
INCLUDE "engine/overworld/elevator.asm"
INCLUDE "engine/items/tm_prices.asm"
INCLUDE "engine/movie/evolution.asm"
INCLUDE "gfx/fishing.asm"
INCLUDE "engine/overworld/cut2.asm"
INCLUDE "engine/overworld/dust_smoke.asm"

SECTION "bank1E", ROMX

INCLUDE "engine/battle/animations.asm"
INCLUDE "data/moves/animations.asm"
INCLUDE "data/battle_anims/subanimations.asm"
INCLUDE "data/battle_anims/frame_blocks.asm"

SECTION "Wild Mons", ROMX
; PureRGBnote: MOVED: moved from bank3
INCLUDE "engine/overworld/wild_mons.asm"
; PureRGBnote: ADDED: new code
INCLUDE "engine/overworld/wild_mon_alt_palettes.asm"

SECTION "Evos Moves", ROMX
; PureRGBnote: MOVED: moved from battle engine 7
INCLUDE "engine/pokemon/evos_moves.asm"
INCLUDE "data/pokemon/base_stats.asm"

SECTION "Splash Animation", ROMX
; PureRGBnote: MOVED: moved from bank1C
INCLUDE "engine/movie/splash.asm"
INCLUDE "engine/movie/hall_of_fame.asm"

SECTION "movedCode", ROMX
; moved from bank1e
INCLUDE "engine/overworld/healing_machine.asm"


SECTION "Party Sprites", ROMX, BANK[$34]
; PureRGBnote: ADDED: new menu sprite icons raw data
PartyMonSprites1: INCBIN "gfx/icons/menusprites1.2bpp"
PartyMonSprites2: INCBIN "gfx/icons/menusprites2.2bpp"

SECTION "GBC Mode Code", ROMX

; shinpokerednote: gbcnote: include the bgmap files from pokemon yellow
INCLUDE "data/gbc/bg_map_attributes.asm"
INCLUDE "engine/gbc/bg_map_attributes.asm"
INCLUDE "engine/gfx/scroll_gfx_horizontally.asm"

SECTION "newCode", ROMX
; PureRGBnote: ADDED: new code
INCLUDE "engine/gfx/front_sprite_options.asm"
INCLUDE "engine/menus/options_menu.asm" ; PureRGBnote: MOVED: used to be part of main_menu.asm but moved out of there for space.
INCLUDE "engine/menus/options_menu2.asm"
INCLUDE "engine/menus/battle_options.asm"
INCLUDE "engine/menus/sprite_options_menu.asm"
INCLUDE "engine/menus/sprite_options_menu2.asm"
INCLUDE "engine/menus/sprite_options_menu3.asm"
INCLUDE "engine/menus/sprite_options_menu4.asm"
INCLUDE "engine/gfx/mon_icons2.asm"
INCLUDE "engine/overworld/select_button_functionality.asm"
INCLUDE "engine/overworld/use_another_repel.asm"
INCLUDE "engine/items/last_two_fishing_gurus_script.asm"
INCLUDE "engine/overworld/check_map_connections.asm"
INCLUDE "engine/pokemon/missingno_item_duplication.asm"
INCLUDE "engine/gfx/set_attack_animation_palette.asm"
INCLUDE "engine/battle/exp_bar_print.asm"
INCLUDE "engine/overworld/strength.asm"
INCLUDE "engine/battle/store_pkmn_levels.asm"
INCLUDE "engine/gfx/remap_overworld_sprites.asm"
INCLUDE "engine/battle/animations/tri_attack.asm"
INCLUDE "engine/menus/text_multi_button_prompt.asm"
INCLUDE "engine/menus/multi_choice_menu.asm"
INCLUDE "engine/menus/map_pokemon_areas.asm"
INCLUDE "engine/gfx/save_screen_area_to_buffer3.asm"
