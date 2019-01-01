INCLUDE "constants.asm"

NPC_SPRITES_1 EQU $4
NPC_SPRITES_2 EQU $5

GFX EQU $4

PICS_1 EQU $9
PICS_2 EQU $A
PICS_3 EQU $B
PICS_4 EQU $C
PICS_5 EQU $D

INCLUDE "home.asm"


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


SECTION "NPC Sprites 1", ROMX ; BANK $04

OakAideSprite:         INCBIN "gfx/sprites/oak_aide.2bpp"
RockerSprite:          INCBIN "gfx/sprites/rocker.2bpp"
SwimmerSprite:         INCBIN "gfx/sprites/swimmer.2bpp"
WhitePlayerSprite:     INCBIN "gfx/sprites/white_player.2bpp"
GymHelperSprite:       INCBIN "gfx/sprites/gym_helper.2bpp"
OldPersonSprite:       INCBIN "gfx/sprites/old_person.2bpp"
MartGuySprite:         INCBIN "gfx/sprites/mart_guy.2bpp"
FisherSprite:          INCBIN "gfx/sprites/fisher.2bpp"
OldMediumWomanSprite:  INCBIN "gfx/sprites/old_medium_woman.2bpp"
NurseSprite:           INCBIN "gfx/sprites/nurse.2bpp"
CableClubWomanSprite:  INCBIN "gfx/sprites/cable_club_woman.2bpp"
MrMasterballSprite:    INCBIN "gfx/sprites/mr_masterball.2bpp"
LaprasGiverSprite:     INCBIN "gfx/sprites/lapras_giver.2bpp"
WardenSprite:          INCBIN "gfx/sprites/warden.2bpp"
SsCaptainSprite:       INCBIN "gfx/sprites/ss_captain.2bpp"
Fisher2Sprite:         INCBIN "gfx/sprites/fisher2.2bpp"
BlackbeltSprite:       INCBIN "gfx/sprites/blackbelt.2bpp"
GuardSprite:           INCBIN "gfx/sprites/guard.2bpp"
BallSprite:            INCBIN "gfx/sprites/ball.2bpp"
OmanyteSprite:         INCBIN "gfx/sprites/omanyte.2bpp"
BoulderSprite:         INCBIN "gfx/sprites/boulder.2bpp"
PaperSheetSprite:      INCBIN "gfx/sprites/paper_sheet.2bpp"
BookMapDexSprite:      INCBIN "gfx/sprites/book_map_dex.2bpp"
ClipboardSprite:       INCBIN "gfx/sprites/clipboard.2bpp"
SnorlaxSprite:         INCBIN "gfx/sprites/snorlax.2bpp"
OldAmberSprite:        INCBIN "gfx/sprites/old_amber.2bpp"
LyingOldManSprite:     INCBIN "gfx/sprites/lying_old_man.2bpp"


SECTION "Graphics (BANK 4)", ROMX

PokemonLogoGraphics:            INCBIN "gfx/pokemon_logo.2bpp"
FontGraphics:                   INCBIN "gfx/font.1bpp"
FontGraphicsEnd:
ABTiles:                        INCBIN "gfx/AB.2bpp"
HpBarAndStatusGraphics:         INCBIN "gfx/hp_bar_and_status.2bpp"
HpBarAndStatusGraphicsEnd:
BattleHudTiles1:                INCBIN "gfx/battle_hud1.1bpp"
BattleHudTiles1End:
BattleHudTiles2:                INCBIN "gfx/battle_hud2.1bpp"
BattleHudTiles3:                INCBIN "gfx/battle_hud3.1bpp"
BattleHudTiles3End:
NintendoCopyrightLogoGraphics:  INCBIN "gfx/copyright.2bpp"
GamefreakLogoGraphics:          INCBIN "gfx/gamefreak.2bpp"
GamefreakLogoGraphicsEnd:
TextBoxGraphics:                INCBIN "gfx/text_box.2bpp"
TextBoxGraphicsEnd:
PokedexTileGraphics:            INCBIN "gfx/pokedex.2bpp"
PokedexTileGraphicsEnd:
WorldMapTileGraphics:           INCBIN "gfx/town_map.2bpp"
WorldMapTileGraphicsEnd:
PlayerCharacterTitleGraphics:   INCBIN "gfx/player_title.2bpp"
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


SECTION "NPC Sprites 2", ROMX ; BANK $05

RedCyclingSprite:     INCBIN "gfx/sprites/cycling.2bpp"
RedSprite:            INCBIN "gfx/sprites/red.2bpp"
BlueSprite:           INCBIN "gfx/sprites/blue.2bpp"
OakSprite:            INCBIN "gfx/sprites/oak.2bpp"
BugCatcherSprite:     INCBIN "gfx/sprites/bug_catcher.2bpp"
SlowbroSprite:        INCBIN "gfx/sprites/slowbro.2bpp"
LassSprite:           INCBIN "gfx/sprites/lass.2bpp"
BlackHairBoy1Sprite:  INCBIN "gfx/sprites/black_hair_boy_1.2bpp"
LittleGirlSprite:     INCBIN "gfx/sprites/little_girl.2bpp"
BirdSprite:           INCBIN "gfx/sprites/bird.2bpp"
FatBaldGuySprite:     INCBIN "gfx/sprites/fat_bald_guy.2bpp"
GamblerSprite:        INCBIN "gfx/sprites/gambler.2bpp"
BlackHairBoy2Sprite:  INCBIN "gfx/sprites/black_hair_boy_2.2bpp"
GirlSprite:           INCBIN "gfx/sprites/girl.2bpp"
HikerSprite:          INCBIN "gfx/sprites/hiker.2bpp"
FoulardWomanSprite:   INCBIN "gfx/sprites/foulard_woman.2bpp"
GentlemanSprite:      INCBIN "gfx/sprites/gentleman.2bpp"
DaisySprite:          INCBIN "gfx/sprites/daisy.2bpp"
BikerSprite:          INCBIN "gfx/sprites/biker.2bpp"
SailorSprite:         INCBIN "gfx/sprites/sailor.2bpp"
CookSprite:           INCBIN "gfx/sprites/cook.2bpp"
BikeShopGuySprite:    INCBIN "gfx/sprites/bike_shop_guy.2bpp"
MrFujiSprite:         INCBIN "gfx/sprites/mr_fuji.2bpp"
GiovanniSprite:       INCBIN "gfx/sprites/giovanni.2bpp"
RocketSprite:         INCBIN "gfx/sprites/rocket.2bpp"
MediumSprite:         INCBIN "gfx/sprites/medium.2bpp"
WaiterSprite:         INCBIN "gfx/sprites/waiter.2bpp"
ErikaSprite:          INCBIN "gfx/sprites/erika.2bpp"
MomGeishaSprite:      INCBIN "gfx/sprites/mom_geisha.2bpp"
BrunetteGirlSprite:   INCBIN "gfx/sprites/brunette_girl.2bpp"
LanceSprite:          INCBIN "gfx/sprites/lance.2bpp"
MomSprite:            INCBIN "gfx/sprites/mom.2bpp"
BaldingGuySprite:     INCBIN "gfx/sprites/balding_guy.2bpp"
YoungBoySprite:       INCBIN "gfx/sprites/young_boy.2bpp"
GameboyKidSprite:     INCBIN "gfx/sprites/gameboy_kid.2bpp"
ClefairySprite:       INCBIN "gfx/sprites/clefairy.2bpp"
AgathaSprite:         INCBIN "gfx/sprites/agatha.2bpp"
BrunoSprite:          INCBIN "gfx/sprites/bruno.2bpp"
LoreleiSprite:        INCBIN "gfx/sprites/lorelei.2bpp"
SeelSprite:           INCBIN "gfx/sprites/seel.2bpp"


SECTION "Battle (BANK 5)", ROMX

INCLUDE "engine/load_pokedex_tiles.asm"
INCLUDE "engine/overworld/map_sprites.asm"
INCLUDE "engine/overworld/emotion_bubbles.asm"
INCLUDE "engine/evolve_trade.asm"
INCLUDE "engine/battle/moveEffects/substitute_effect.asm"
INCLUDE "engine/menu/pc.asm"


SECTION "bank6", ROMX

INCLUDE "data/mapHeaders/CeladonCity.asm"
INCLUDE "data/mapObjects/CeladonCity.asm"
CeladonCity_Blocks: INCBIN "maps/CeladonCity.blk"

INCLUDE "data/mapHeaders/PalletTown.asm"
INCLUDE "data/mapObjects/PalletTown.asm"
PalletTown_Blocks: INCBIN "maps/PalletTown.blk"

INCLUDE "data/mapHeaders/ViridianCity.asm"
INCLUDE "data/mapObjects/ViridianCity.asm"
ViridianCity_Blocks: INCBIN "maps/ViridianCity.blk"

INCLUDE "data/mapHeaders/PewterCity.asm"
	ds 1
INCLUDE "data/mapObjects/PewterCity.asm"
PewterCity_Blocks: INCBIN "maps/PewterCity.blk"

INCLUDE "data/mapHeaders/CeruleanCity.asm"
INCLUDE "data/mapObjects/CeruleanCity.asm"
CeruleanCity_Blocks: INCBIN "maps/CeruleanCity.blk"

INCLUDE "data/mapHeaders/VermilionCity.asm"
INCLUDE "data/mapObjects/VermilionCity.asm"
VermilionCity_Blocks: INCBIN "maps/VermilionCity.blk"

INCLUDE "data/mapHeaders/FuchsiaCity.asm"
INCLUDE "data/mapObjects/FuchsiaCity.asm"
FuchsiaCity_Blocks: INCBIN "maps/FuchsiaCity.blk"

INCLUDE "engine/play_time.asm"

INCLUDE "scripts/PalletTown.asm"
INCLUDE "scripts/ViridianCity.asm"
INCLUDE "scripts/PewterCity.asm"
INCLUDE "scripts/CeruleanCity.asm"
INCLUDE "scripts/VermilionCity.asm"
INCLUDE "scripts/CeladonCity.asm"
INCLUDE "scripts/FuchsiaCity.asm"

INCLUDE "data/mapHeaders/BluesHouse.asm"
INCLUDE "scripts/BluesHouse.asm"
INCLUDE "data/mapObjects/BluesHouse.asm"
BluesHouse_Blocks: INCBIN "maps/BluesHouse.blk"

INCLUDE "data/mapHeaders/VermilionTradeHouse.asm"
INCLUDE "scripts/VermilionTradeHouse.asm"
INCLUDE "data/mapObjects/VermilionTradeHouse.asm"
VermilionTradeHouse_Blocks: INCBIN "maps/VermilionTradeHouse.blk"

INCLUDE "data/mapHeaders/IndigoPlateauLobby.asm"
INCLUDE "scripts/IndigoPlateauLobby.asm"
INCLUDE "data/mapObjects/IndigoPlateauLobby.asm"
IndigoPlateauLobby_Blocks: INCBIN "maps/IndigoPlateauLobby.blk"

INCLUDE "data/mapHeaders/SilphCo4F.asm"
INCLUDE "scripts/SilphCo4F.asm"
INCLUDE "data/mapObjects/SilphCo4F.asm"
SilphCo4F_Blocks: INCBIN "maps/SilphCo4F.blk"

INCLUDE "data/mapHeaders/SilphCo5F.asm"
INCLUDE "scripts/SilphCo5F.asm"
INCLUDE "data/mapObjects/SilphCo5F.asm"
SilphCo5F_Blocks: INCBIN "maps/SilphCo5F.blk"

INCLUDE "data/mapHeaders/SilphCo6F.asm"
INCLUDE "scripts/SilphCo6F.asm"
INCLUDE "data/mapObjects/SilphCo6F.asm"
SilphCo6F_Blocks: INCBIN "maps/SilphCo6F.blk"

INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/overworld/doors.asm"
INCLUDE "engine/overworld/ledges.asm"


SECTION "bank7", ROMX

INCLUDE "data/mapHeaders/CinnabarIsland.asm"
INCLUDE "data/mapObjects/CinnabarIsland.asm"
CinnabarIsland_Blocks: INCBIN "maps/CinnabarIsland.blk"

INCLUDE "data/mapHeaders/Route1.asm"
INCLUDE "data/mapObjects/Route1.asm"
Route1_Blocks: INCBIN "maps/Route1.blk"

UndergroundPathRoute8_Blocks: INCBIN "maps/UndergroundPathRoute8.blk"

OaksLab_Blocks: INCBIN "maps/OaksLab.blk"

MrPsychicsHouse_Blocks:
NameRatersHouse_Blocks:
MrFujisHouse_Blocks:
Route16FlyHouse_Blocks:
Route2TradeHouse_Blocks:
SaffronPidgeyHouse_Blocks:
VermilionPidgeyHouse_Blocks:
LavenderCuboneHouse_Blocks:
CeruleanTradeHouse_Blocks:
PewterNidoranHouse_Blocks:
PewterSpeechHouse_Blocks:
ViridianNicknameHouse_Blocks: INCBIN "maps/ViridianNicknameHouse.blk"

CeladonMansionRoofHouse_Blocks:
ViridianSchoolHouse_Blocks: INCBIN "maps/ViridianSchoolHouse.blk"

CeruleanTrashedHouse_Blocks: INCBIN "maps/CeruleanTrashedHouse.blk"

DiglettsCaveRoute11_Blocks:
DiglettsCaveRoute2_Blocks: INCBIN "maps/DiglettsCaveRoute2.blk"

INCLUDE "text/monster_names.asm"

INCLUDE "engine/clear_save.asm"

INCLUDE "engine/predefs7.asm"

INCLUDE "scripts/CinnabarIsland.asm"

INCLUDE "scripts/Route1.asm"

INCLUDE "data/mapHeaders/OaksLab.asm"
INCLUDE "scripts/OaksLab.asm"
INCLUDE "data/mapObjects/OaksLab.asm"

INCLUDE "data/mapHeaders/ViridianMart.asm"
INCLUDE "scripts/ViridianMart.asm"
INCLUDE "data/mapObjects/ViridianMart.asm"
ViridianMart_Blocks: INCBIN "maps/ViridianMart.blk"

INCLUDE "data/mapHeaders/ViridianSchoolHouse.asm"
INCLUDE "scripts/ViridianSchoolHouse.asm"
INCLUDE "data/mapObjects/ViridianSchoolHouse.asm"

INCLUDE "data/mapHeaders/ViridianNicknameHouse.asm"
	ds 1
INCLUDE "scripts/ViridianNicknameHouse.asm"
INCLUDE "data/mapObjects/ViridianNicknameHouse.asm"

INCLUDE "data/mapHeaders/PewterNidoranHouse.asm"
INCLUDE "scripts/PewterNidoranHouse.asm"
INCLUDE "data/mapObjects/PewterNidoranHouse.asm"

INCLUDE "data/mapHeaders/PewterSpeechHouse.asm"
INCLUDE "scripts/PewterSpeechHouse.asm"
INCLUDE "data/mapObjects/PewterSpeechHouse.asm"

INCLUDE "data/mapHeaders/CeruleanTrashedHouse.asm"
INCLUDE "scripts/CeruleanTrashedHouse.asm"
INCLUDE "data/mapObjects/CeruleanTrashedHouse.asm"

INCLUDE "data/mapHeaders/CeruleanTradeHouse.asm"
INCLUDE "scripts/CeruleanTradeHouse.asm"
INCLUDE "data/mapObjects/CeruleanTradeHouse.asm"

INCLUDE "data/mapHeaders/BikeShop.asm"
INCLUDE "scripts/BikeShop.asm"
INCLUDE "data/mapObjects/BikeShop.asm"
BikeShop_Blocks: INCBIN "maps/BikeShop.blk"

INCLUDE "data/mapHeaders/MrFujisHouse.asm"
INCLUDE "scripts/MrFujisHouse.asm"
INCLUDE "data/mapObjects/MrFujisHouse.asm"

INCLUDE "data/mapHeaders/LavenderCuboneHouse.asm"
INCLUDE "scripts/LavenderCuboneHouse.asm"
INCLUDE "data/mapObjects/LavenderCuboneHouse.asm"

INCLUDE "data/mapHeaders/NameRatersHouse.asm"
INCLUDE "scripts/NameRatersHouse.asm"
INCLUDE "data/mapObjects/NameRatersHouse.asm"

INCLUDE "data/mapHeaders/VermilionPidgeyHouse.asm"
INCLUDE "scripts/VermilionPidgeyHouse.asm"
INCLUDE "data/mapObjects/VermilionPidgeyHouse.asm"

INCLUDE "data/mapHeaders/VermilionDock.asm"
INCLUDE "scripts/VermilionDock.asm"
INCLUDE "data/mapObjects/VermilionDock.asm"
VermilionDock_Blocks: INCBIN "maps/VermilionDock.blk"

INCLUDE "data/mapHeaders/CeladonMansionRoofHouse.asm"
INCLUDE "scripts/CeladonMansionRoofHouse.asm"
INCLUDE "data/mapObjects/CeladonMansionRoofHouse.asm"

INCLUDE "data/mapHeaders/FuchsiaMart.asm"
INCLUDE "scripts/FuchsiaMart.asm"
INCLUDE "data/mapObjects/FuchsiaMart.asm"
FuchsiaMart_Blocks: INCBIN "maps/FuchsiaMart.blk"

INCLUDE "data/mapHeaders/SaffronPidgeyHouse.asm"
INCLUDE "scripts/SaffronPidgeyHouse.asm"
INCLUDE "data/mapObjects/SaffronPidgeyHouse.asm"

INCLUDE "data/mapHeaders/MrPsychicsHouse.asm"
INCLUDE "scripts/MrPsychicsHouse.asm"
INCLUDE "data/mapObjects/MrPsychicsHouse.asm"

INCLUDE "data/mapHeaders/DiglettsCaveRoute2.asm"
INCLUDE "scripts/DiglettsCaveRoute2.asm"
INCLUDE "data/mapObjects/DiglettsCaveRoute2.asm"

INCLUDE "data/mapHeaders/Route2TradeHouse.asm"
INCLUDE "scripts/Route2TradeHouse.asm"
INCLUDE "data/mapObjects/Route2TradeHouse.asm"

INCLUDE "data/mapHeaders/Route5Gate.asm"
INCLUDE "scripts/Route5Gate.asm"
INCLUDE "data/mapObjects/Route5Gate.asm"
Route5Gate_Blocks: INCBIN "maps/Route5Gate.blk"

INCLUDE "data/mapHeaders/Route6Gate.asm"
INCLUDE "scripts/Route6Gate.asm"
INCLUDE "data/mapObjects/Route6Gate.asm"
Route6Gate_Blocks: INCBIN "maps/Route6Gate.blk"

INCLUDE "data/mapHeaders/Route7Gate.asm"
INCLUDE "scripts/Route7Gate.asm"
INCLUDE "data/mapObjects/Route7Gate.asm"
Route7Gate_Blocks: INCBIN "maps/Route7Gate.blk"

INCLUDE "data/mapHeaders/Route8Gate.asm"
INCLUDE "scripts/Route8Gate.asm"
INCLUDE "data/mapObjects/Route8Gate.asm"
Route8Gate_Blocks: INCBIN "maps/Route8Gate.blk"

INCLUDE "data/mapHeaders/UndergroundPathRoute8.asm"
INCLUDE "scripts/UndergroundPathRoute8.asm"
INCLUDE "data/mapObjects/UndergroundPathRoute8.asm"

INCLUDE "data/mapHeaders/PowerPlant.asm"
INCLUDE "scripts/PowerPlant.asm"
INCLUDE "data/mapObjects/PowerPlant.asm"
PowerPlant_Blocks: INCBIN "maps/PowerPlant.blk"

INCLUDE "data/mapHeaders/DiglettsCaveRoute11.asm"
INCLUDE "scripts/DiglettsCaveRoute11.asm"
INCLUDE "data/mapObjects/DiglettsCaveRoute11.asm"

INCLUDE "data/mapHeaders/Route16FlyHouse.asm"
INCLUDE "scripts/Route16FlyHouse.asm"
INCLUDE "data/mapObjects/Route16FlyHouse.asm"

INCLUDE "data/mapHeaders/Route22Gate.asm"
INCLUDE "scripts/Route22Gate.asm"
INCLUDE "data/mapObjects/Route22Gate.asm"
Route22Gate_Blocks: INCBIN "maps/Route22Gate.blk"

INCLUDE "data/mapHeaders/BillsHouse.asm"
INCLUDE "scripts/BillsHouse.asm"
INCLUDE "data/mapObjects/BillsHouse.asm"
BillsHouse_Blocks: INCBIN "maps/BillsHouse.blk"

INCLUDE "engine/menu/oaks_pc.asm"

INCLUDE "engine/hidden_object_functions7.asm"


SECTION "Pics 1", ROMX ; BANK $09

RhydonPicFront::      INCBIN "pic/bmon/rhydon.pic"
RhydonPicBack::       INCBIN "pic/monback/rhydonb.pic"
KangaskhanPicFront::  INCBIN "pic/bmon/kangaskhan.pic"
KangaskhanPicBack::   INCBIN "pic/monback/kangaskhanb.pic"
NidoranMPicFront::    INCBIN "pic/bmon/nidoranm.pic"
NidoranMPicBack::     INCBIN "pic/monback/nidoranmb.pic"
ClefairyPicFront::    INCBIN "pic/bmon/clefairy.pic"
ClefairyPicBack::     INCBIN "pic/monback/clefairyb.pic"
SpearowPicFront::     INCBIN "pic/bmon/spearow.pic"
SpearowPicBack::      INCBIN "pic/monback/spearowb.pic"
VoltorbPicFront::     INCBIN "pic/bmon/voltorb.pic"
VoltorbPicBack::      INCBIN "pic/monback/voltorbb.pic"
NidokingPicFront::    INCBIN "pic/bmon/nidoking.pic"
NidokingPicBack::     INCBIN "pic/monback/nidokingb.pic"
SlowbroPicFront::     INCBIN "pic/bmon/slowbro.pic"
SlowbroPicBack::      INCBIN "pic/monback/slowbrob.pic"
IvysaurPicFront::     INCBIN "pic/bmon/ivysaur.pic"
IvysaurPicBack::      INCBIN "pic/monback/ivysaurb.pic"
ExeggutorPicFront::   INCBIN "pic/bmon/exeggutor.pic"
ExeggutorPicBack::    INCBIN "pic/monback/exeggutorb.pic"
LickitungPicFront::   INCBIN "pic/bmon/lickitung.pic"
LickitungPicBack::    INCBIN "pic/monback/lickitungb.pic"
ExeggcutePicFront::   INCBIN "pic/bmon/exeggcute.pic"
ExeggcutePicBack::    INCBIN "pic/monback/exeggcuteb.pic"
GrimerPicFront::      INCBIN "pic/bmon/grimer.pic"
GrimerPicBack::       INCBIN "pic/monback/grimerb.pic"
GengarPicFront::      INCBIN "pic/bmon/gengar.pic"
GengarPicBack::       INCBIN "pic/monback/gengarb.pic"
NidoranFPicFront::    INCBIN "pic/bmon/nidoranf.pic"
NidoranFPicBack::     INCBIN "pic/monback/nidoranfb.pic"
NidoqueenPicFront::   INCBIN "pic/bmon/nidoqueen.pic"
NidoqueenPicBack::    INCBIN "pic/monback/nidoqueenb.pic"
CubonePicFront::      INCBIN "pic/bmon/cubone.pic"
CubonePicBack::       INCBIN "pic/monback/cuboneb.pic"
RhyhornPicFront::     INCBIN "pic/bmon/rhyhorn.pic"
RhyhornPicBack::      INCBIN "pic/monback/rhyhornb.pic"
LaprasPicFront::      INCBIN "pic/bmon/lapras.pic"
LaprasPicBack::       INCBIN "pic/monback/laprasb.pic"
ArcaninePicFront::    INCBIN "pic/bmon/arcanine.pic"
ArcaninePicBack::     INCBIN "pic/monback/arcanineb.pic"
GyaradosPicFront::    INCBIN "pic/bmon/gyarados.pic"
GyaradosPicBack::     INCBIN "pic/monback/gyaradosb.pic"
ShellderPicFront::    INCBIN "pic/bmon/shellder.pic"
ShellderPicBack::     INCBIN "pic/monback/shellderb.pic"
TentacoolPicFront::   INCBIN "pic/bmon/tentacool.pic"
TentacoolPicBack::    INCBIN "pic/monback/tentacoolb.pic"
GastlyPicFront::      INCBIN "pic/bmon/gastly.pic"
GastlyPicBack::       INCBIN "pic/monback/gastlyb.pic"
ScytherPicFront::     INCBIN "pic/bmon/scyther.pic"
ScytherPicBack::      INCBIN "pic/monback/scytherb.pic"
StaryuPicFront::      INCBIN "pic/bmon/staryu.pic"
StaryuPicBack::       INCBIN "pic/monback/staryub.pic"
BlastoisePicFront::   INCBIN "pic/bmon/blastoise.pic"
BlastoisePicBack::    INCBIN "pic/monback/blastoiseb.pic"
PinsirPicFront::      INCBIN "pic/bmon/pinsir.pic"
PinsirPicBack::       INCBIN "pic/monback/pinsirb.pic"
TangelaPicFront::     INCBIN "pic/bmon/tangela.pic"
TangelaPicBack::      INCBIN "pic/monback/tangelab.pic"


SECTION "Battle (BANK 9)", ROMX

INCLUDE "engine/battle/print_type.asm"
INCLUDE "engine/battle/save_trainer_name.asm"
INCLUDE "engine/battle/moveEffects/focus_energy_effect.asm"


SECTION "Pics 2", ROMX ; BANK $0A

GrowlithePicFront::   INCBIN "pic/bmon/growlithe.pic"
GrowlithePicBack::    INCBIN "pic/monback/growlitheb.pic"
OnixPicFront::        INCBIN "pic/bmon/onix.pic"
OnixPicBack::         INCBIN "pic/monback/onixb.pic"
FearowPicFront::      INCBIN "pic/bmon/fearow.pic"
FearowPicBack::       INCBIN "pic/monback/fearowb.pic"
PidgeyPicFront::      INCBIN "pic/bmon/pidgey.pic"
PidgeyPicBack::       INCBIN "pic/monback/pidgeyb.pic"
SlowpokePicFront::    INCBIN "pic/bmon/slowpoke.pic"
SlowpokePicBack::     INCBIN "pic/monback/slowpokeb.pic"
KadabraPicFront::     INCBIN "pic/bmon/kadabra.pic"
KadabraPicBack::      INCBIN "pic/monback/kadabrab.pic"
GravelerPicFront::    INCBIN "pic/bmon/graveler.pic"
GravelerPicBack::     INCBIN "pic/monback/gravelerb.pic"
ChanseyPicFront::     INCBIN "pic/bmon/chansey.pic"
ChanseyPicBack::      INCBIN "pic/monback/chanseyb.pic"
MachokePicFront::     INCBIN "pic/bmon/machoke.pic"
MachokePicBack::      INCBIN "pic/monback/machokeb.pic"
MrMimePicFront::      INCBIN "pic/bmon/mr.mime.pic"
MrMimePicBack::       INCBIN "pic/monback/mr.mimeb.pic"
HitmonleePicFront::   INCBIN "pic/bmon/hitmonlee.pic"
HitmonleePicBack::    INCBIN "pic/monback/hitmonleeb.pic"
HitmonchanPicFront::  INCBIN "pic/bmon/hitmonchan.pic"
HitmonchanPicBack::   INCBIN "pic/monback/hitmonchanb.pic"
ArbokPicFront::       INCBIN "pic/bmon/arbok.pic"
ArbokPicBack::        INCBIN "pic/monback/arbokb.pic"
ParasectPicFront::    INCBIN "pic/bmon/parasect.pic"
ParasectPicBack::     INCBIN "pic/monback/parasectb.pic"
PsyduckPicFront::     INCBIN "pic/bmon/psyduck.pic"
PsyduckPicBack::      INCBIN "pic/monback/psyduckb.pic"
DrowzeePicFront::     INCBIN "pic/bmon/drowzee.pic"
DrowzeePicBack::      INCBIN "pic/monback/drowzeeb.pic"
GolemPicFront::       INCBIN "pic/bmon/golem.pic"
GolemPicBack::        INCBIN "pic/monback/golemb.pic"
MagmarPicFront::      INCBIN "pic/bmon/magmar.pic"
MagmarPicBack::       INCBIN "pic/monback/magmarb.pic"
ElectabuzzPicFront::  INCBIN "pic/bmon/electabuzz.pic"
ElectabuzzPicBack::   INCBIN "pic/monback/electabuzzb.pic"
MagnetonPicFront::    INCBIN "pic/bmon/magneton.pic"
MagnetonPicBack::     INCBIN "pic/monback/magnetonb.pic"
KoffingPicFront::     INCBIN "pic/bmon/koffing.pic"
KoffingPicBack::      INCBIN "pic/monback/koffingb.pic"
MankeyPicFront::      INCBIN "pic/bmon/mankey.pic"
MankeyPicBack::       INCBIN "pic/monback/mankeyb.pic"
SeelPicFront::        INCBIN "pic/bmon/seel.pic"
SeelPicBack::         INCBIN "pic/monback/seelb.pic"
DiglettPicFront::     INCBIN "pic/bmon/diglett.pic"
DiglettPicBack::      INCBIN "pic/monback/diglettb.pic"
TaurosPicFront::      INCBIN "pic/bmon/tauros.pic"
TaurosPicBack::       INCBIN "pic/monback/taurosb.pic"
FarfetchdPicFront::   INCBIN "pic/bmon/farfetchd.pic"
FarfetchdPicBack::    INCBIN "pic/monback/farfetchdb.pic"
VenonatPicFront::     INCBIN "pic/bmon/venonat.pic"
VenonatPicBack::      INCBIN "pic/monback/venonatb.pic"
DragonitePicFront::   INCBIN "pic/bmon/dragonite.pic"
DragonitePicBack::    INCBIN "pic/monback/dragoniteb.pic"
DoduoPicFront::       INCBIN "pic/bmon/doduo.pic"
DoduoPicBack::        INCBIN "pic/monback/doduob.pic"
PoliwagPicFront::     INCBIN "pic/bmon/poliwag.pic"
PoliwagPicBack::      INCBIN "pic/monback/poliwagb.pic"
JynxPicFront::        INCBIN "pic/bmon/jynx.pic"
JynxPicBack::         INCBIN "pic/monback/jynxb.pic"
MoltresPicFront::     INCBIN "pic/bmon/moltres.pic"
MoltresPicBack::      INCBIN "pic/monback/moltresb.pic"


SECTION "Battle (BANK A)", ROMX

INCLUDE "engine/battle/moveEffects/leech_seed_effect.asm"


SECTION "Pics 3", ROMX ; BANK $0B

ArticunoPicFront::    INCBIN "pic/bmon/articuno.pic"
ArticunoPicBack::     INCBIN "pic/monback/articunob.pic"
ZapdosPicFront::      INCBIN "pic/bmon/zapdos.pic"
ZapdosPicBack::       INCBIN "pic/monback/zapdosb.pic"
DittoPicFront::       INCBIN "pic/bmon/ditto.pic"
DittoPicBack::        INCBIN "pic/monback/dittob.pic"
MeowthPicFront::      INCBIN "pic/bmon/meowth.pic"
MeowthPicBack::       INCBIN "pic/monback/meowthb.pic"
KrabbyPicFront::      INCBIN "pic/bmon/krabby.pic"
KrabbyPicBack::       INCBIN "pic/monback/krabbyb.pic"
VulpixPicFront::      INCBIN "pic/bmon/vulpix.pic"
VulpixPicBack::       INCBIN "pic/monback/vulpixb.pic"
NinetalesPicFront::   INCBIN "pic/bmon/ninetales.pic"
NinetalesPicBack::    INCBIN "pic/monback/ninetalesb.pic"
PikachuPicFront::     INCBIN "pic/bmon/pikachu.pic"
PikachuPicBack::      INCBIN "pic/monback/pikachub.pic"
RaichuPicFront::      INCBIN "pic/bmon/raichu.pic"
RaichuPicBack::       INCBIN "pic/monback/raichub.pic"
DratiniPicFront::     INCBIN "pic/bmon/dratini.pic"
DratiniPicBack::      INCBIN "pic/monback/dratinib.pic"
DragonairPicFront::   INCBIN "pic/bmon/dragonair.pic"
DragonairPicBack::    INCBIN "pic/monback/dragonairb.pic"
KabutoPicFront::      INCBIN "pic/bmon/kabuto.pic"
KabutoPicBack::       INCBIN "pic/monback/kabutob.pic"
KabutopsPicFront::    INCBIN "pic/bmon/kabutops.pic"
KabutopsPicBack::     INCBIN "pic/monback/kabutopsb.pic"
HorseaPicFront::      INCBIN "pic/bmon/horsea.pic"
HorseaPicBack::       INCBIN "pic/monback/horseab.pic"
SeadraPicFront::      INCBIN "pic/bmon/seadra.pic"
SeadraPicBack::       INCBIN "pic/monback/seadrab.pic"
SandshrewPicFront::   INCBIN "pic/bmon/sandshrew.pic"
SandshrewPicBack::    INCBIN "pic/monback/sandshrewb.pic"
SandslashPicFront::   INCBIN "pic/bmon/sandslash.pic"
SandslashPicBack::    INCBIN "pic/monback/sandslashb.pic"
OmanytePicFront::     INCBIN "pic/bmon/omanyte.pic"
OmanytePicBack::      INCBIN "pic/monback/omanyteb.pic"
OmastarPicFront::     INCBIN "pic/bmon/omastar.pic"
OmastarPicBack::      INCBIN "pic/monback/omastarb.pic"
JigglypuffPicFront::  INCBIN "pic/bmon/jigglypuff.pic"
JigglypuffPicBack::   INCBIN "pic/monback/jigglypuffb.pic"
WigglytuffPicFront::  INCBIN "pic/bmon/wigglytuff.pic"
WigglytuffPicBack::   INCBIN "pic/monback/wigglytuffb.pic"
EeveePicFront::       INCBIN "pic/bmon/eevee.pic"
EeveePicBack::        INCBIN "pic/monback/eeveeb.pic"
FlareonPicFront::     INCBIN "pic/bmon/flareon.pic"
FlareonPicBack::      INCBIN "pic/monback/flareonb.pic"
JolteonPicFront::     INCBIN "pic/bmon/jolteon.pic"
JolteonPicBack::      INCBIN "pic/monback/jolteonb.pic"
VaporeonPicFront::    INCBIN "pic/bmon/vaporeon.pic"
VaporeonPicBack::     INCBIN "pic/monback/vaporeonb.pic"
MachopPicFront::      INCBIN "pic/bmon/machop.pic"
MachopPicBack::       INCBIN "pic/monback/machopb.pic"
ZubatPicFront::       INCBIN "pic/bmon/zubat.pic"
ZubatPicBack::        INCBIN "pic/monback/zubatb.pic"
EkansPicFront::       INCBIN "pic/bmon/ekans.pic"
EkansPicBack::        INCBIN "pic/monback/ekansb.pic"
ParasPicFront::       INCBIN "pic/bmon/paras.pic"
ParasPicBack::        INCBIN "pic/monback/parasb.pic"
PoliwhirlPicFront::   INCBIN "pic/bmon/poliwhirl.pic"
PoliwhirlPicBack::    INCBIN "pic/monback/poliwhirlb.pic"
PoliwrathPicFront::   INCBIN "pic/bmon/poliwrath.pic"
PoliwrathPicBack::    INCBIN "pic/monback/poliwrathb.pic"
WeedlePicFront::      INCBIN "pic/bmon/weedle.pic"
WeedlePicBack::       INCBIN "pic/monback/weedleb.pic"
KakunaPicFront::      INCBIN "pic/bmon/kakuna.pic"
KakunaPicBack::       INCBIN "pic/monback/kakunab.pic"
BeedrillPicFront::    INCBIN "pic/bmon/beedrill.pic"
BeedrillPicBack::     INCBIN "pic/monback/beedrillb.pic"

FossilKabutopsPic::   INCBIN "pic/bmon/fossilkabutops.pic"


SECTION "Battle (BANK B)", ROMX

INCLUDE "engine/battle/display_effectiveness.asm"

TrainerInfoTextBoxTileGraphics:  INCBIN "gfx/trainer_info.2bpp"
TrainerInfoTextBoxTileGraphicsEnd:
BlankLeaderNames:                INCBIN "gfx/blank_leader_names.2bpp"
CircleTile:                      INCBIN "gfx/circle_tile.2bpp"
BadgeNumbersTileGraphics:        INCBIN "gfx/badge_numbers.2bpp"

INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/battle/scale_sprites.asm"
INCLUDE "engine/battle/moveEffects/pay_day_effect.asm"
INCLUDE "engine/game_corner_slots2.asm"


SECTION "Pics 4", ROMX ; BANK $0C

DodrioPicFront::       INCBIN "pic/bmon/dodrio.pic"
DodrioPicBack::        INCBIN "pic/monback/dodriob.pic"
PrimeapePicFront::     INCBIN "pic/bmon/primeape.pic"
PrimeapePicBack::      INCBIN "pic/monback/primeapeb.pic"
DugtrioPicFront::      INCBIN "pic/bmon/dugtrio.pic"
DugtrioPicBack::       INCBIN "pic/monback/dugtriob.pic"
VenomothPicFront::     INCBIN "pic/bmon/venomoth.pic"
VenomothPicBack::      INCBIN "pic/monback/venomothb.pic"
DewgongPicFront::      INCBIN "pic/bmon/dewgong.pic"
DewgongPicBack::       INCBIN "pic/monback/dewgongb.pic"
CaterpiePicFront::     INCBIN "pic/bmon/caterpie.pic"
CaterpiePicBack::      INCBIN "pic/monback/caterpieb.pic"
MetapodPicFront::      INCBIN "pic/bmon/metapod.pic"
MetapodPicBack::       INCBIN "pic/monback/metapodb.pic"
ButterfreePicFront::   INCBIN "pic/bmon/butterfree.pic"
ButterfreePicBack::    INCBIN "pic/monback/butterfreeb.pic"
MachampPicFront::      INCBIN "pic/bmon/machamp.pic"
MachampPicBack::       INCBIN "pic/monback/machampb.pic"
GolduckPicFront::      INCBIN "pic/bmon/golduck.pic"
GolduckPicBack::       INCBIN "pic/monback/golduckb.pic"
HypnoPicFront::        INCBIN "pic/bmon/hypno.pic"
HypnoPicBack::         INCBIN "pic/monback/hypnob.pic"
GolbatPicFront::       INCBIN "pic/bmon/golbat.pic"
GolbatPicBack::        INCBIN "pic/monback/golbatb.pic"
MewtwoPicFront::       INCBIN "pic/bmon/mewtwo.pic"
MewtwoPicBack::        INCBIN "pic/monback/mewtwob.pic"
SnorlaxPicFront::      INCBIN "pic/bmon/snorlax.pic"
SnorlaxPicBack::       INCBIN "pic/monback/snorlaxb.pic"
MagikarpPicFront::     INCBIN "pic/bmon/magikarp.pic"
MagikarpPicBack::      INCBIN "pic/monback/magikarpb.pic"
MukPicFront::          INCBIN "pic/bmon/muk.pic"
MukPicBack::           INCBIN "pic/monback/mukb.pic"
KinglerPicFront::      INCBIN "pic/bmon/kingler.pic"
KinglerPicBack::       INCBIN "pic/monback/kinglerb.pic"
CloysterPicFront::     INCBIN "pic/bmon/cloyster.pic"
CloysterPicBack::      INCBIN "pic/monback/cloysterb.pic"
ElectrodePicFront::    INCBIN "pic/bmon/electrode.pic"
ElectrodePicBack::     INCBIN "pic/monback/electrodeb.pic"
ClefablePicFront::     INCBIN "pic/bmon/clefable.pic"
ClefablePicBack::      INCBIN "pic/monback/clefableb.pic"
WeezingPicFront::      INCBIN "pic/bmon/weezing.pic"
WeezingPicBack::       INCBIN "pic/monback/weezingb.pic"
PersianPicFront::      INCBIN "pic/bmon/persian.pic"
PersianPicBack::       INCBIN "pic/monback/persianb.pic"
MarowakPicFront::      INCBIN "pic/bmon/marowak.pic"
MarowakPicBack::       INCBIN "pic/monback/marowakb.pic"
HaunterPicFront::      INCBIN "pic/bmon/haunter.pic"
HaunterPicBack::       INCBIN "pic/monback/haunterb.pic"
AbraPicFront::         INCBIN "pic/bmon/abra.pic"
AbraPicBack::          INCBIN "pic/monback/abrab.pic"
AlakazamPicFront::     INCBIN "pic/bmon/alakazam.pic"
AlakazamPicBack::      INCBIN "pic/monback/alakazamb.pic"
PidgeottoPicFront::    INCBIN "pic/bmon/pidgeotto.pic"
PidgeottoPicBack::     INCBIN "pic/monback/pidgeottob.pic"
PidgeotPicFront::      INCBIN "pic/bmon/pidgeot.pic"
PidgeotPicBack::       INCBIN "pic/monback/pidgeotb.pic"
StarmiePicFront::      INCBIN "pic/bmon/starmie.pic"
StarmiePicBack::       INCBIN "pic/monback/starmieb.pic"

RedPicBack::           INCBIN "pic/trainer/redb.pic"
OldManPic::            INCBIN "pic/trainer/oldman.pic"


SECTION "Battle (BANK C)", ROMX

INCLUDE "engine/battle/moveEffects/mist_effect.asm"
INCLUDE "engine/battle/moveEffects/one_hit_ko_effect.asm"


SECTION "Pics 5", ROMX ; BANK $0D

BulbasaurPicFront::    INCBIN "pic/bmon/bulbasaur.pic"
BulbasaurPicBack::     INCBIN "pic/monback/bulbasaurb.pic"
VenusaurPicFront::     INCBIN "pic/bmon/venusaur.pic"
VenusaurPicBack::      INCBIN "pic/monback/venusaurb.pic"
TentacruelPicFront::   INCBIN "pic/bmon/tentacruel.pic"
TentacruelPicBack::    INCBIN "pic/monback/tentacruelb.pic"
GoldeenPicFront::      INCBIN "pic/bmon/goldeen.pic"
GoldeenPicBack::       INCBIN "pic/monback/goldeenb.pic"
SeakingPicFront::      INCBIN "pic/bmon/seaking.pic"
SeakingPicBack::       INCBIN "pic/monback/seakingb.pic"
PonytaPicFront::       INCBIN "pic/bmon/ponyta.pic"
RapidashPicFront::     INCBIN "pic/bmon/rapidash.pic"
PonytaPicBack::        INCBIN "pic/monback/ponytab.pic"
RapidashPicBack::      INCBIN "pic/monback/rapidashb.pic"
RattataPicFront::      INCBIN "pic/bmon/rattata.pic"
RattataPicBack::       INCBIN "pic/monback/rattatab.pic"
RaticatePicFront::     INCBIN "pic/bmon/raticate.pic"
RaticatePicBack::      INCBIN "pic/monback/raticateb.pic"
NidorinoPicFront::     INCBIN "pic/bmon/nidorino.pic"
NidorinoPicBack::      INCBIN "pic/monback/nidorinob.pic"
NidorinaPicFront::     INCBIN "pic/bmon/nidorina.pic"
NidorinaPicBack::      INCBIN "pic/monback/nidorinab.pic"
GeodudePicFront::      INCBIN "pic/bmon/geodude.pic"
GeodudePicBack::       INCBIN "pic/monback/geodudeb.pic"
PorygonPicFront::      INCBIN "pic/bmon/porygon.pic"
PorygonPicBack::       INCBIN "pic/monback/porygonb.pic"
AerodactylPicFront::   INCBIN "pic/bmon/aerodactyl.pic"
AerodactylPicBack::    INCBIN "pic/monback/aerodactylb.pic"
MagnemitePicFront::    INCBIN "pic/bmon/magnemite.pic"
MagnemitePicBack::     INCBIN "pic/monback/magnemiteb.pic"
CharmanderPicFront::   INCBIN "pic/bmon/charmander.pic"
CharmanderPicBack::    INCBIN "pic/monback/charmanderb.pic"
SquirtlePicFront::     INCBIN "pic/bmon/squirtle.pic"
SquirtlePicBack::      INCBIN "pic/monback/squirtleb.pic"
CharmeleonPicFront::   INCBIN "pic/bmon/charmeleon.pic"
CharmeleonPicBack::    INCBIN "pic/monback/charmeleonb.pic"
WartortlePicFront::    INCBIN "pic/bmon/wartortle.pic"
WartortlePicBack::     INCBIN "pic/monback/wartortleb.pic"
CharizardPicFront::    INCBIN "pic/bmon/charizard.pic"
CharizardPicBack::     INCBIN "pic/monback/charizardb.pic"
FossilAerodactylPic::  INCBIN "pic/bmon/fossilaerodactyl.pic"
GhostPic::             INCBIN "pic/other/ghost.pic"
OddishPicFront::       INCBIN "pic/bmon/oddish.pic"
OddishPicBack::        INCBIN "pic/monback/oddishb.pic"
GloomPicFront::        INCBIN "pic/bmon/gloom.pic"
GloomPicBack::         INCBIN "pic/monback/gloomb.pic"
VileplumePicFront::    INCBIN "pic/bmon/vileplume.pic"
VileplumePicBack::     INCBIN "pic/monback/vileplumeb.pic"
BellsproutPicFront::   INCBIN "pic/bmon/bellsprout.pic"
BellsproutPicBack::    INCBIN "pic/monback/bellsproutb.pic"
WeepinbellPicFront::   INCBIN "pic/bmon/weepinbell.pic"
WeepinbellPicBack::    INCBIN "pic/monback/weepinbellb.pic"
VictreebelPicFront::   INCBIN "pic/bmon/victreebel.pic"
VictreebelPicBack::    INCBIN "pic/monback/victreebelb.pic"


SECTION "Battle (BANK D)", ROMX

INCLUDE "engine/titlescreen2.asm"
INCLUDE "engine/battle/link_battle_versus_text.asm"
INCLUDE "engine/slot_machine.asm"
INCLUDE "engine/overworld/pewter_guys.asm"
INCLUDE "engine/multiply_divide.asm"
INCLUDE "engine/game_corner_slots.asm"


SECTION "bankE", ROMX

INCLUDE "data/moves.asm"
BaseStats: INCLUDE "data/base_stats.asm"
INCLUDE "data/cries.asm"
INCLUDE "engine/battle/unused_stats_functions.asm"
INCLUDE "engine/battle/scroll_draw_trainer_pic.asm"
INCLUDE "engine/battle/trainer_ai.asm"
INCLUDE "engine/battle/draw_hud_pokeball_gfx.asm"

TradingAnimationGraphics:
INCBIN "gfx/game_boy.2bpp"
INCBIN "gfx/link_cable.2bpp"
TradingAnimationGraphicsEnd:

; Pokeball traveling through the link cable.
TradingAnimationGraphics2: INCBIN "gfx/trade2.2bpp"
TradingAnimationGraphics2End:

INCLUDE "engine/evos_moves.asm"
INCLUDE "engine/battle/moveEffects/heal_effect.asm"
INCLUDE "engine/battle/moveEffects/transform_effect.asm"
INCLUDE "engine/battle/moveEffects/reflect_light_screen_effect.asm"


SECTION "bankF", ROMX

INCLUDE "engine/battle/core.asm"


SECTION "bank10", ROMX

INCLUDE "engine/menu/pokedex.asm"
INCLUDE "engine/trade.asm"
INCLUDE "engine/intro.asm"
INCLUDE "engine/trade2.asm"


SECTION "bank11", ROMX

INCLUDE "data/mapHeaders/LavenderTown.asm"
INCLUDE "data/mapObjects/LavenderTown.asm"
LavenderTown_Blocks: INCBIN "maps/LavenderTown.blk"

ViridianPokecenter_Blocks: INCBIN "maps/ViridianPokecenter.blk"

SafariZoneCenterRestHouse_Blocks:
SafariZoneWestRestHouse_Blocks:
SafariZoneEastRestHouse_Blocks:
SafariZoneNorthRestHouse_Blocks: INCBIN "maps/SafariZoneCenterRestHouse.blk"

INCLUDE "scripts/LavenderTown.asm"

INCLUDE "engine/pokedex_rating.asm"

INCLUDE "data/mapHeaders/ViridianPokecenter.asm"
INCLUDE "scripts/ViridianPokecenter.asm"
INCLUDE "data/mapObjects/ViridianPokecenter.asm"

INCLUDE "data/mapHeaders/PokemonMansion1F.asm"
INCLUDE "scripts/PokemonMansion1F.asm"
INCLUDE "data/mapObjects/PokemonMansion1F.asm"
PokemonMansion1F_Blocks: INCBIN "maps/PokemonMansion1F.blk"

INCLUDE "data/mapHeaders/RockTunnel1F.asm"
INCLUDE "scripts/RockTunnel1F.asm"
INCLUDE "data/mapObjects/RockTunnel1F.asm"
RockTunnel1F_Blocks: INCBIN "maps/RockTunnel1F.blk"

INCLUDE "data/mapHeaders/SeafoamIslands1F.asm"
INCLUDE "scripts/SeafoamIslands1F.asm"
INCLUDE "data/mapObjects/SeafoamIslands1F.asm"
SeafoamIslands1F_Blocks: INCBIN "maps/SeafoamIslands1F.blk"

INCLUDE "data/mapHeaders/SSAnne3F.asm"
INCLUDE "scripts/SSAnne3F.asm"
INCLUDE "data/mapObjects/SSAnne3F.asm"
SSAnne3F_Blocks: INCBIN "maps/SSAnne3F.blk"

INCLUDE "data/mapHeaders/VictoryRoad3F.asm"
INCLUDE "scripts/VictoryRoad3F.asm"
INCLUDE "data/mapObjects/VictoryRoad3F.asm"
VictoryRoad3F_Blocks: INCBIN "maps/VictoryRoad3F.blk"

INCLUDE "data/mapHeaders/RocketHideoutB1F.asm"
INCLUDE "scripts/RocketHideoutB1F.asm"
INCLUDE "data/mapObjects/RocketHideoutB1F.asm"
RocketHideoutB1F_Blocks: INCBIN "maps/RocketHideoutB1F.blk"

INCLUDE "data/mapHeaders/RocketHideoutB2F.asm"
INCLUDE "scripts/RocketHideoutB2F.asm"
INCLUDE "data/mapObjects/RocketHideoutB2F.asm"
RocketHideoutB2F_Blocks: INCBIN "maps/RocketHideoutB2F.blk"

INCLUDE "data/mapHeaders/RocketHideoutB3F.asm"
INCLUDE "scripts/RocketHideoutB3F.asm"
INCLUDE "data/mapObjects/RocketHideoutB3F.asm"
RocketHideoutB3F_Blocks: INCBIN "maps/RocketHideoutB3F.blk"

INCLUDE "data/mapHeaders/RocketHideoutB4F.asm"
INCLUDE "scripts/RocketHideoutB4F.asm"
INCLUDE "data/mapObjects/RocketHideoutB4F.asm"
RocketHideoutB4F_Blocks: INCBIN "maps/RocketHideoutB4F.blk"

INCLUDE "data/mapHeaders/RocketHideoutElevator.asm"
INCLUDE "scripts/RocketHideoutElevator.asm"
INCLUDE "data/mapObjects/RocketHideoutElevator.asm"
RocketHideoutElevator_Blocks: INCBIN "maps/RocketHideoutElevator.blk"

INCLUDE "data/mapHeaders/SilphCoElevator.asm"
INCLUDE "scripts/SilphCoElevator.asm"
INCLUDE "data/mapObjects/SilphCoElevator.asm"
SilphCoElevator_Blocks: INCBIN "maps/SilphCoElevator.blk"

INCLUDE "data/mapHeaders/SafariZoneEast.asm"
INCLUDE "scripts/SafariZoneEast.asm"
INCLUDE "data/mapObjects/SafariZoneEast.asm"
SafariZoneEast_Blocks: INCBIN "maps/SafariZoneEast.blk"

INCLUDE "data/mapHeaders/SafariZoneNorth.asm"
INCLUDE "scripts/SafariZoneNorth.asm"
INCLUDE "data/mapObjects/SafariZoneNorth.asm"
SafariZoneNorth_Blocks: INCBIN "maps/SafariZoneNorth.blk"

INCLUDE "data/mapHeaders/SafariZoneCenter.asm"
INCLUDE "scripts/SafariZoneCenter.asm"
INCLUDE "data/mapObjects/SafariZoneCenter.asm"
SafariZoneCenter_Blocks: INCBIN "maps/SafariZoneCenter.blk"

INCLUDE "data/mapHeaders/SafariZoneCenterRestHouse.asm"
INCLUDE "scripts/SafariZoneCenterRestHouse.asm"
INCLUDE "data/mapObjects/SafariZoneCenterRestHouse.asm"

INCLUDE "data/mapHeaders/SafariZoneWestRestHouse.asm"
INCLUDE "scripts/SafariZoneWestRestHouse.asm"
INCLUDE "data/mapObjects/SafariZoneWestRestHouse.asm"

INCLUDE "data/mapHeaders/SafariZoneEastRestHouse.asm"
INCLUDE "scripts/SafariZoneEastRestHouse.asm"
INCLUDE "data/mapObjects/SafariZoneEastRestHouse.asm"

INCLUDE "data/mapHeaders/SafariZoneNorthRestHouse.asm"
INCLUDE "scripts/SafariZoneNorthRestHouse.asm"
INCLUDE "data/mapObjects/SafariZoneNorthRestHouse.asm"

INCLUDE "data/mapHeaders/CeruleanCave2F.asm"
INCLUDE "scripts/CeruleanCave2F.asm"
INCLUDE "data/mapObjects/CeruleanCave2F.asm"
CeruleanCave2F_Blocks: INCBIN "maps/CeruleanCave2F.blk"

INCLUDE "data/mapHeaders/CeruleanCaveB1F.asm"
INCLUDE "scripts/CeruleanCaveB1F.asm"
INCLUDE "data/mapObjects/CeruleanCaveB1F.asm"
CeruleanCaveB1F_Blocks: INCBIN "maps/CeruleanCaveB1F.blk"

INCLUDE "data/mapHeaders/RockTunnelB1F.asm"
INCLUDE "scripts/RockTunnelB1F.asm"
INCLUDE "data/mapObjects/RockTunnelB1F.asm"
RockTunnelB1F_Blocks: INCBIN "maps/RockTunnelB1F.blk"

INCLUDE "data/mapHeaders/SeafoamIslandsB1F.asm"
INCLUDE "scripts/SeafoamIslandsB1F.asm"
INCLUDE "data/mapObjects/SeafoamIslandsB1F.asm"
SeafoamIslandsB1F_Blocks: INCBIN "maps/SeafoamIslandsB1F.blk"

INCLUDE "data/mapHeaders/SeafoamIslandsB2F.asm"
INCLUDE "scripts/SeafoamIslandsB2F.asm"
INCLUDE "data/mapObjects/SeafoamIslandsB2F.asm"
SeafoamIslandsB2F_Blocks: INCBIN "maps/SeafoamIslandsB2F.blk"

INCLUDE "data/mapHeaders/SeafoamIslandsB3F.asm"
INCLUDE "scripts/SeafoamIslandsB3F.asm"
INCLUDE "data/mapObjects/SeafoamIslandsB3F.asm"
SeafoamIslandsB3F_Blocks: INCBIN "maps/SeafoamIslandsB3F.blk"

INCLUDE "data/mapHeaders/SeafoamIslandsB4F.asm"
INCLUDE "scripts/SeafoamIslandsB4F.asm"
INCLUDE "data/mapObjects/SeafoamIslandsB4F.asm"
SeafoamIslandsB4F_Blocks: INCBIN "maps/SeafoamIslandsB4F.blk"

INCLUDE "engine/overworld/hidden_objects.asm"


SECTION "bank12", ROMX

INCLUDE "data/mapHeaders/Route7.asm"
INCLUDE "data/mapObjects/Route7.asm"
Route7_Blocks: INCBIN "maps/Route7.blk"

CeladonPokecenter_Blocks:
RockTunnelPokecenter_Blocks:
MtMoonPokecenter_Blocks: INCBIN "maps/MtMoonPokecenter.blk"

Route18Gate1F_Blocks:
Route15Gate1F_Blocks:
Route11Gate1F_Blocks: INCBIN "maps/Route11Gate1F.blk"

Route18Gate2F_Blocks:
Route16Gate2F_Blocks:
Route15Gate2F_Blocks:
Route12Gate2F_Blocks:
Route11Gate2F_Blocks: INCBIN "maps/Route11Gate2F.blk"

INCLUDE "engine/predefs12.asm"

INCLUDE "scripts/Route7.asm"

INCLUDE "data/mapHeaders/RedsHouse1F.asm"
INCLUDE "scripts/RedsHouse1F.asm"
INCLUDE "data/mapObjects/RedsHouse1F.asm"
RedsHouse1F_Blocks: INCBIN "maps/RedsHouse1F.blk"

INCLUDE "data/mapHeaders/CeladonMart3F.asm"
INCLUDE "scripts/CeladonMart3F.asm"
INCLUDE "data/mapObjects/CeladonMart3F.asm"
CeladonMart3F_Blocks: INCBIN "maps/CeladonMart3F.blk"

INCLUDE "data/mapHeaders/CeladonMart4F.asm"
INCLUDE "scripts/CeladonMart4F.asm"
INCLUDE "data/mapObjects/CeladonMart4F.asm"
CeladonMart4F_Blocks: INCBIN "maps/CeladonMart4F.blk"

INCLUDE "data/mapHeaders/CeladonMartRoof.asm"
INCLUDE "scripts/CeladonMartRoof.asm"
INCLUDE "data/mapObjects/CeladonMartRoof.asm"
CeladonMartRoof_Blocks: INCBIN "maps/CeladonMartRoof.blk"

INCLUDE "data/mapHeaders/CeladonMartElevator.asm"
INCLUDE "scripts/CeladonMartElevator.asm"
INCLUDE "data/mapObjects/CeladonMartElevator.asm"
CeladonMartElevator_Blocks: INCBIN "maps/CeladonMartElevator.blk"

INCLUDE "data/mapHeaders/CeladonMansion1F.asm"
INCLUDE "scripts/CeladonMansion1F.asm"
INCLUDE "data/mapObjects/CeladonMansion1F.asm"
CeladonMansion1F_Blocks: INCBIN "maps/CeladonMansion1F.blk"

INCLUDE "data/mapHeaders/CeladonMansion2F.asm"
INCLUDE "scripts/CeladonMansion2F.asm"
INCLUDE "data/mapObjects/CeladonMansion2F.asm"
CeladonMansion2F_Blocks: INCBIN "maps/CeladonMansion2F.blk"

INCLUDE "data/mapHeaders/CeladonMansion3F.asm"
INCLUDE "scripts/CeladonMansion3F.asm"
INCLUDE "data/mapObjects/CeladonMansion3F.asm"
CeladonMansion3F_Blocks: INCBIN "maps/CeladonMansion3F.blk"

INCLUDE "data/mapHeaders/CeladonMansionRoof.asm"
INCLUDE "scripts/CeladonMansionRoof.asm"
INCLUDE "data/mapObjects/CeladonMansionRoof.asm"
CeladonMansionRoof_Blocks: INCBIN "maps/CeladonMansionRoof.blk"

INCLUDE "data/mapHeaders/CeladonPokecenter.asm"
INCLUDE "scripts/CeladonPokecenter.asm"
INCLUDE "data/mapObjects/CeladonPokecenter.asm"

INCLUDE "data/mapHeaders/CeladonGym.asm"
INCLUDE "scripts/CeladonGym.asm"
INCLUDE "data/mapObjects/CeladonGym.asm"
CeladonGym_Blocks: INCBIN "maps/CeladonGym.blk"

INCLUDE "data/mapHeaders/GameCorner.asm"
INCLUDE "scripts/GameCorner.asm"
INCLUDE "data/mapObjects/GameCorner.asm"
GameCorner_Blocks: INCBIN "maps/GameCorner.blk"

INCLUDE "data/mapHeaders/CeladonMart5F.asm"
INCLUDE "scripts/CeladonMart5F.asm"
INCLUDE "data/mapObjects/CeladonMart5F.asm"
CeladonMart5F_Blocks: INCBIN "maps/CeladonMart5F.blk"

INCLUDE "data/mapHeaders/GameCornerPrizeRoom.asm"
INCLUDE "scripts/GameCornerPrizeRoom.asm"
INCLUDE "data/mapObjects/GameCornerPrizeRoom.asm"
GameCornerPrizeRoom_Blocks: INCBIN "maps/GameCornerPrizeRoom.blk"

INCLUDE "data/mapHeaders/CeladonDiner.asm"
INCLUDE "scripts/CeladonDiner.asm"
INCLUDE "data/mapObjects/CeladonDiner.asm"
CeladonDiner_Blocks: INCBIN "maps/CeladonDiner.blk"

INCLUDE "data/mapHeaders/CeladonChiefHouse.asm"
INCLUDE "scripts/CeladonChiefHouse.asm"
INCLUDE "data/mapObjects/CeladonChiefHouse.asm"
CeladonChiefHouse_Blocks: INCBIN "maps/CeladonChiefHouse.blk"

INCLUDE "data/mapHeaders/CeladonHotel.asm"
INCLUDE "scripts/CeladonHotel.asm"
INCLUDE "data/mapObjects/CeladonHotel.asm"
CeladonHotel_Blocks: INCBIN "maps/CeladonHotel.blk"

INCLUDE "data/mapHeaders/MtMoonPokecenter.asm"
INCLUDE "scripts/MtMoonPokecenter.asm"
INCLUDE "data/mapObjects/MtMoonPokecenter.asm"

INCLUDE "data/mapHeaders/RockTunnelPokecenter.asm"
INCLUDE "scripts/RockTunnelPokecenter.asm"
INCLUDE "data/mapObjects/RockTunnelPokecenter.asm"

INCLUDE "data/mapHeaders/Route11Gate1F.asm"
INCLUDE "scripts/Route11Gate1F.asm"
INCLUDE "data/mapObjects/Route11Gate1F.asm"

INCLUDE "data/mapHeaders/Route11Gate2F.asm"
INCLUDE "scripts/Route11Gate2F.asm"
INCLUDE "data/mapObjects/Route11Gate2F.asm"

INCLUDE "data/mapHeaders/Route12Gate1F.asm"
INCLUDE "scripts/Route12Gate1F.asm"
INCLUDE "data/mapObjects/Route12Gate1F.asm"
Route12Gate1F_Blocks: INCBIN "maps/Route12Gate1F.blk"

INCLUDE "data/mapHeaders/Route12Gate2F.asm"
INCLUDE "scripts/Route12Gate2F.asm"
INCLUDE "data/mapObjects/Route12Gate2F.asm"

INCLUDE "data/mapHeaders/Route15Gate1F.asm"
INCLUDE "scripts/Route15Gate1F.asm"
INCLUDE "data/mapObjects/Route15Gate1F.asm"

INCLUDE "data/mapHeaders/Route15Gate2F.asm"
INCLUDE "scripts/Route15Gate2F.asm"
INCLUDE "data/mapObjects/Route15Gate2F.asm"

INCLUDE "data/mapHeaders/Route16Gate1F.asm"
INCLUDE "scripts/Route16Gate1F.asm"
INCLUDE "data/mapObjects/Route16Gate1F.asm"
Route16Gate1F_Blocks: INCBIN "maps/Route16Gate1F.blk"

INCLUDE "data/mapHeaders/Route16Gate2F.asm"
INCLUDE "scripts/Route16Gate2F.asm"
INCLUDE "data/mapObjects/Route16Gate2F.asm"

INCLUDE "data/mapHeaders/Route18Gate1F.asm"
INCLUDE "scripts/Route18Gate1F.asm"
INCLUDE "data/mapObjects/Route18Gate1F.asm"

INCLUDE "data/mapHeaders/Route18Gate2F.asm"
INCLUDE "scripts/Route18Gate2F.asm"
INCLUDE "data/mapObjects/Route18Gate2F.asm"

INCLUDE "data/mapHeaders/MtMoon1F.asm"
INCLUDE "scripts/MtMoon1F.asm"
INCLUDE "data/mapObjects/MtMoon1F.asm"
MtMoon1F_Blocks: INCBIN "maps/MtMoon1F.blk"

INCLUDE "data/mapHeaders/MtMoonB2F.asm"
INCLUDE "scripts/MtMoonB2F.asm"
INCLUDE "data/mapObjects/MtMoonB2F.asm"
MtMoonB2F_Blocks: INCBIN "maps/MtMoonB2F.blk"

INCLUDE "data/mapHeaders/SafariZoneWest.asm"
INCLUDE "scripts/SafariZoneWest.asm"
INCLUDE "data/mapObjects/SafariZoneWest.asm"
SafariZoneWest_Blocks: INCBIN "maps/SafariZoneWest.blk"

INCLUDE "data/mapHeaders/SafariZoneSecretHouse.asm"
INCLUDE "scripts/SafariZoneSecretHouse.asm"
INCLUDE "data/mapObjects/SafariZoneSecretHouse.asm"
SafariZoneSecretHouse_Blocks: INCBIN "maps/SafariZoneSecretHouse.blk"


SECTION "bank13", ROMX

TrainerPics::
YoungsterPic::     INCBIN "pic/trainer/youngster.pic"
BugCatcherPic::    INCBIN "pic/trainer/bugcatcher.pic"
LassPic::          INCBIN "pic/trainer/lass.pic"
SailorPic::        INCBIN "pic/trainer/sailor.pic"
JrTrainerMPic::    INCBIN "pic/trainer/jr.trainerm.pic"
JrTrainerFPic::    INCBIN "pic/trainer/jr.trainerf.pic"
PokemaniacPic::    INCBIN "pic/trainer/pokemaniac.pic"
SuperNerdPic::     INCBIN "pic/trainer/supernerd.pic"
HikerPic::         INCBIN "pic/trainer/hiker.pic"
BikerPic::         INCBIN "pic/trainer/biker.pic"
BurglarPic::       INCBIN "pic/trainer/burglar.pic"
EngineerPic::      INCBIN "pic/trainer/engineer.pic"
FisherPic::        INCBIN "pic/trainer/fisher.pic"
SwimmerPic::       INCBIN "pic/trainer/swimmer.pic"
CueBallPic::       INCBIN "pic/trainer/cueball.pic"
GamblerPic::       INCBIN "pic/trainer/gambler.pic"
BeautyPic::        INCBIN "pic/trainer/beauty.pic"
PsychicPic::       INCBIN "pic/trainer/psychic.pic"
RockerPic::        INCBIN "pic/trainer/rocker.pic"
JugglerPic::       INCBIN "pic/trainer/juggler.pic"
TamerPic::         INCBIN "pic/trainer/tamer.pic"
BirdKeeperPic::    INCBIN "pic/trainer/birdkeeper.pic"
BlackbeltPic::     INCBIN "pic/trainer/blackbelt.pic"
Rival1Pic::        INCBIN "pic/trainer/rival1.pic"
ProfOakPic::       INCBIN "pic/trainer/prof.oak.pic"
ChiefPic::
ScientistPic::     INCBIN "pic/trainer/scientist.pic"
GiovanniPic::      INCBIN "pic/trainer/giovanni.pic"
RocketPic::        INCBIN "pic/trainer/rocket.pic"
CooltrainerMPic::  INCBIN "pic/trainer/cooltrainerm.pic"
CooltrainerFPic::  INCBIN "pic/trainer/cooltrainerf.pic"
BrunoPic::         INCBIN "pic/trainer/bruno.pic"
BrockPic::         INCBIN "pic/trainer/brock.pic"
MistyPic::         INCBIN "pic/trainer/misty.pic"
LtSurgePic::       INCBIN "pic/trainer/lt.surge.pic"
ErikaPic::         INCBIN "pic/trainer/erika.pic"
KogaPic::          INCBIN "pic/trainer/koga.pic"
BlainePic::        INCBIN "pic/trainer/blaine.pic"
SabrinaPic::       INCBIN "pic/trainer/sabrina.pic"
GentlemanPic::     INCBIN "pic/trainer/gentleman.pic"
Rival2Pic::        INCBIN "pic/trainer/rival2.pic"
Rival3Pic::        INCBIN "pic/trainer/rival3.pic"
LoreleiPic::       INCBIN "pic/trainer/lorelei.pic"
ChannelerPic::     INCBIN "pic/trainer/channeler.pic"
AgathaPic::        INCBIN "pic/trainer/agatha.pic"
LancePic::         INCBIN "pic/trainer/lance.pic"

INCLUDE "data/mapHeaders/TradeCenter.asm"
INCLUDE "scripts/TradeCenter.asm"
INCLUDE "data/mapObjects/TradeCenter.asm"
TradeCenter_Blocks: INCBIN "maps/TradeCenter.blk"

INCLUDE "data/mapHeaders/Colosseum.asm"
INCLUDE "scripts/Colosseum.asm"
INCLUDE "data/mapObjects/Colosseum.asm"
Colosseum_Blocks: INCBIN "maps/Colosseum.blk"

INCLUDE "engine/give_pokemon.asm"

INCLUDE "engine/predefs.asm"


SECTION "bank14", ROMX

INCLUDE "data/mapHeaders/Route22.asm"
INCLUDE "data/mapObjects/Route22.asm"
Route22_Blocks: INCBIN "maps/Route22.blk"

INCLUDE "data/mapHeaders/Route20.asm"
INCLUDE "data/mapObjects/Route20.asm"
Route20_Blocks: INCBIN "maps/Route20.blk"

INCLUDE "data/mapHeaders/Route23.asm"
INCLUDE "data/mapObjects/Route23.asm"
Route23_Blocks: INCBIN "maps/Route23.blk"

INCLUDE "data/mapHeaders/Route24.asm"
INCLUDE "data/mapObjects/Route24.asm"
Route24_Blocks: INCBIN "maps/Route24.blk"

INCLUDE "data/mapHeaders/Route25.asm"
INCLUDE "data/mapObjects/Route25.asm"
Route25_Blocks: INCBIN "maps/Route25.blk"

INCLUDE "data/mapHeaders/IndigoPlateau.asm"
INCLUDE "scripts/IndigoPlateau.asm"
INCLUDE "data/mapObjects/IndigoPlateau.asm"
IndigoPlateau_Blocks: INCBIN "maps/IndigoPlateau.blk"

INCLUDE "data/mapHeaders/SaffronCity.asm"
INCLUDE "data/mapObjects/SaffronCity.asm"
SaffronCity_Blocks: INCBIN "maps/SaffronCity.blk"
INCLUDE "scripts/SaffronCity.asm"

INCLUDE "scripts/Route20.asm"
INCLUDE "scripts/Route22.asm"
INCLUDE "scripts/Route23.asm"
INCLUDE "scripts/Route24.asm"
INCLUDE "scripts/Route25.asm"

INCLUDE "data/mapHeaders/VictoryRoad2F.asm"
INCLUDE "scripts/VictoryRoad2F.asm"
INCLUDE "data/mapObjects/VictoryRoad2F.asm"
VictoryRoad2F_Blocks: INCBIN "maps/VictoryRoad2F.blk"

INCLUDE "data/mapHeaders/MtMoonB1F.asm"
INCLUDE "scripts/MtMoonB1F.asm"
INCLUDE "data/mapObjects/MtMoonB1F.asm"
MtMoonB1F_Blocks: INCBIN "maps/MtMoonB1F.blk"

INCLUDE "data/mapHeaders/SilphCo7F.asm"
INCLUDE "scripts/SilphCo7F.asm"
INCLUDE "data/mapObjects/SilphCo7F.asm"
SilphCo7F_Blocks: INCBIN "maps/SilphCo7F.blk"

INCLUDE "data/mapHeaders/PokemonMansion2F.asm"
INCLUDE "scripts/PokemonMansion2F.asm"
INCLUDE "data/mapObjects/PokemonMansion2F.asm"
PokemonMansion2F_Blocks: INCBIN "maps/PokemonMansion2F.blk"

INCLUDE "data/mapHeaders/PokemonMansion3F.asm"
INCLUDE "scripts/PokemonMansion3F.asm"
INCLUDE "data/mapObjects/PokemonMansion3F.asm"
PokemonMansion3F_Blocks: INCBIN "maps/PokemonMansion3F.blk"

INCLUDE "data/mapHeaders/PokemonMansionB1F.asm"
INCLUDE "scripts/PokemonMansionB1F.asm"
INCLUDE "data/mapObjects/PokemonMansionB1F.asm"
PokemonMansionB1F_Blocks: INCBIN "maps/PokemonMansionB1F.blk"

INCLUDE "engine/battle/init_battle_variables.asm"
INCLUDE "engine/battle/moveEffects/paralyze_effect.asm"

INCLUDE "engine/overworld/card_key.asm"

INCLUDE "engine/menu/prize_menu.asm"

INCLUDE "engine/hidden_object_functions14.asm"


SECTION "bank15", ROMX

INCLUDE "data/mapHeaders/Route2.asm"
INCLUDE "data/mapObjects/Route2.asm"
Route2_Blocks: INCBIN "maps/Route2.blk"

INCLUDE "data/mapHeaders/Route3.asm"
INCLUDE "data/mapObjects/Route3.asm"
Route3_Blocks: INCBIN "maps/Route3.blk"

INCLUDE "data/mapHeaders/Route4.asm"
INCLUDE "data/mapObjects/Route4.asm"
Route4_Blocks: INCBIN "maps/Route4.blk"

INCLUDE "data/mapHeaders/Route5.asm"
INCLUDE "data/mapObjects/Route5.asm"
Route5_Blocks: INCBIN "maps/Route5.blk"

INCLUDE "data/mapHeaders/Route9.asm"
INCLUDE "data/mapObjects/Route9.asm"
Route9_Blocks: INCBIN "maps/Route9.blk"

INCLUDE "data/mapHeaders/Route13.asm"
INCLUDE "data/mapObjects/Route13.asm"
Route13_Blocks: INCBIN "maps/Route13.blk"

INCLUDE "data/mapHeaders/Route14.asm"
INCLUDE "data/mapObjects/Route14.asm"
Route14_Blocks: INCBIN "maps/Route14.blk"

INCLUDE "data/mapHeaders/Route17.asm"
INCLUDE "data/mapObjects/Route17.asm"
Route17_Blocks: INCBIN "maps/Route17.blk"

INCLUDE "data/mapHeaders/Route19.asm"
INCLUDE "data/mapObjects/Route19.asm"
Route19_Blocks: INCBIN "maps/Route19.blk"

INCLUDE "data/mapHeaders/Route21.asm"
INCLUDE "data/mapObjects/Route21.asm"
Route21_Blocks: INCBIN "maps/Route21.blk"

VermilionOldRodHouse_Blocks:
Route12SuperRodHouse_Blocks:
Daycare_Blocks: INCBIN "maps/Daycare.blk"

FuchsiaGoodRodHouse_Blocks: INCBIN "maps/FuchsiaGoodRodHouse.blk"

INCLUDE "engine/battle/experience.asm"

INCLUDE "scripts/Route2.asm"
INCLUDE "scripts/Route3.asm"
INCLUDE "scripts/Route4.asm"
INCLUDE "scripts/Route5.asm"
INCLUDE "scripts/Route9.asm"
INCLUDE "scripts/Route13.asm"
INCLUDE "scripts/Route14.asm"
INCLUDE "scripts/Route17.asm"
INCLUDE "scripts/Route19.asm"
INCLUDE "scripts/Route21.asm"

INCLUDE "data/mapHeaders/VermilionOldRodHouse.asm"
INCLUDE "scripts/VermilionOldRodHouse.asm"
INCLUDE "data/mapObjects/VermilionOldRodHouse.asm"

INCLUDE "data/mapHeaders/CeladonMart2F.asm"
INCLUDE "scripts/CeladonMart2F.asm"
INCLUDE "data/mapObjects/CeladonMart2F.asm"
CeladonMart2F_Blocks: INCBIN "maps/CeladonMart2F.blk"

INCLUDE "data/mapHeaders/FuchsiaGoodRodHouse.asm"
INCLUDE "scripts/FuchsiaGoodRodHouse.asm"
INCLUDE "data/mapObjects/FuchsiaGoodRodHouse.asm"

INCLUDE "data/mapHeaders/Daycare.asm"
INCLUDE "scripts/Daycare.asm"
INCLUDE "data/mapObjects/Daycare.asm"

INCLUDE "data/mapHeaders/Route12SuperRodHouse.asm"
INCLUDE "scripts/Route12SuperRodHouse.asm"
INCLUDE "data/mapObjects/Route12SuperRodHouse.asm"

INCLUDE "data/mapHeaders/SilphCo8F.asm"
INCLUDE "scripts/SilphCo8F.asm"
INCLUDE "data/mapObjects/SilphCo8F.asm"
SilphCo8F_Blocks: INCBIN "maps/SilphCo8F.blk"

INCLUDE "engine/menu/diploma.asm"

INCLUDE "engine/overworld/trainers.asm"


SECTION "bank16", ROMX

INCLUDE "data/mapHeaders/Route6.asm"
INCLUDE "data/mapObjects/Route6.asm"
Route6_Blocks: INCBIN "maps/Route6.blk"

INCLUDE "data/mapHeaders/Route8.asm"
INCLUDE "data/mapObjects/Route8.asm"
Route8_Blocks: INCBIN "maps/Route8.blk"

INCLUDE "data/mapHeaders/Route10.asm"
INCLUDE "data/mapObjects/Route10.asm"
Route10_Blocks: INCBIN "maps/Route10.blk"

INCLUDE "data/mapHeaders/Route11.asm"
INCLUDE "data/mapObjects/Route11.asm"
Route11_Blocks: INCBIN "maps/Route11.blk"

INCLUDE "data/mapHeaders/Route12.asm"
INCLUDE "data/mapObjects/Route12.asm"
Route12_Blocks: INCBIN "maps/Route12.blk"

INCLUDE "data/mapHeaders/Route15.asm"
INCLUDE "data/mapObjects/Route15.asm"
Route15_Blocks: INCBIN "maps/Route15.blk"

INCLUDE "data/mapHeaders/Route16.asm"
INCLUDE "data/mapObjects/Route16.asm"
Route16_Blocks: INCBIN "maps/Route16.blk"

INCLUDE "data/mapHeaders/Route18.asm"
INCLUDE "data/mapObjects/Route18.asm"
Route18_Blocks: INCBIN "maps/Route18.blk"

	INCBIN "maps/UnusedPokecenterCopy.blk"

INCLUDE "engine/battle/common_text.asm"

INCLUDE "engine/experience.asm"

INCLUDE "engine/overworld/oaks_aide.asm"

INCLUDE "scripts/Route6.asm"
INCLUDE "scripts/Route8.asm"
INCLUDE "scripts/Route10.asm"
INCLUDE "scripts/Route11.asm"
INCLUDE "scripts/Route12.asm"
INCLUDE "scripts/Route15.asm"
INCLUDE "scripts/Route16.asm"
INCLUDE "scripts/Route18.asm"

INCLUDE "data/mapHeaders/PokemonFanClub.asm"
INCLUDE "scripts/PokemonFanClub.asm"
INCLUDE "data/mapObjects/PokemonFanClub.asm"
PokemonFanClub_Blocks: INCBIN "maps/PokemonFanClub.blk"

INCLUDE "data/mapHeaders/SilphCo2F.asm"
INCLUDE "scripts/SilphCo2F.asm"
INCLUDE "data/mapObjects/SilphCo2F.asm"
SilphCo2F_Blocks: INCBIN "maps/SilphCo2F.blk"

INCLUDE "data/mapHeaders/SilphCo3F.asm"
INCLUDE "scripts/SilphCo3F.asm"
INCLUDE "data/mapObjects/SilphCo3F.asm"
SilphCo3F_Blocks: INCBIN "maps/SilphCo3F.blk"

INCLUDE "data/mapHeaders/SilphCo10F.asm"
INCLUDE "scripts/SilphCo10F.asm"
INCLUDE "data/mapObjects/SilphCo10F.asm"
SilphCo10F_Blocks: INCBIN "maps/SilphCo10F.blk"

INCLUDE "data/mapHeaders/LancesRoom.asm"
INCLUDE "scripts/LancesRoom.asm"
INCLUDE "data/mapObjects/LancesRoom.asm"
LancesRoom_Blocks: INCBIN "maps/LancesRoom.blk"

INCLUDE "data/mapHeaders/HallOfFame.asm"
INCLUDE "scripts/HallOfFame.asm"
INCLUDE "data/mapObjects/HallOfFame.asm"
HallOfFame_Blocks: INCBIN "maps/HallOfFame.blk"

INCLUDE "engine/overworld/saffron_guards.asm"


SECTION "bank17", ROMX

SaffronMart_Blocks:
LavenderMart_Blocks:
CeruleanMart_Blocks:
VermilionMart_Blocks: INCBIN "maps/VermilionMart.blk"

CopycatsHouse2F_Blocks:
RedsHouse2F_Blocks: INCBIN "maps/RedsHouse2F.blk"

Museum1F_Blocks: INCBIN "maps/Museum1F.blk"

Museum2F_Blocks: INCBIN "maps/Museum2F.blk"

SaffronPokecenter_Blocks:
VermilionPokecenter_Blocks:
LavenderPokecenter_Blocks:
PewterPokecenter_Blocks: INCBIN "maps/PewterPokecenter.blk"

UndergroundPathRoute7_Blocks:
UndergroundPathRoute7Copy_Blocks:
UndergroundPathRoute6_Blocks:
UndergroundPathRoute5_Blocks: INCBIN "maps/UndergroundPathRoute5.blk"

Route2Gate_Blocks:
ViridianForestSouthGate_Blocks:
ViridianForestNorthGate_Blocks: INCBIN "maps/ViridianForestNorthGate.blk"

INCLUDE "data/mapHeaders/RedsHouse2F.asm"
INCLUDE "scripts/RedsHouse2F.asm"
INCLUDE "data/mapObjects/RedsHouse2F.asm"

INCLUDE "engine/predefs17.asm"

INCLUDE "data/mapHeaders/Museum1F.asm"
INCLUDE "scripts/Museum1F.asm"
INCLUDE "data/mapObjects/Museum1F.asm"

INCLUDE "data/mapHeaders/Museum2F.asm"
INCLUDE "scripts/Museum2F.asm"
INCLUDE "data/mapObjects/Museum2F.asm"

INCLUDE "data/mapHeaders/PewterGym.asm"
INCLUDE "scripts/PewterGym.asm"
INCLUDE "data/mapObjects/PewterGym.asm"
PewterGym_Blocks: INCBIN "maps/PewterGym.blk"

INCLUDE "data/mapHeaders/PewterPokecenter.asm"
INCLUDE "scripts/PewterPokecenter.asm"
INCLUDE "data/mapObjects/PewterPokecenter.asm"

INCLUDE "data/mapHeaders/CeruleanPokecenter.asm"
INCLUDE "scripts/CeruleanPokecenter.asm"
INCLUDE "data/mapObjects/CeruleanPokecenter.asm"
CeruleanPokecenter_Blocks: INCBIN "maps/CeruleanPokecenter.blk"

INCLUDE "data/mapHeaders/CeruleanGym.asm"
INCLUDE "scripts/CeruleanGym.asm"
INCLUDE "data/mapObjects/CeruleanGym.asm"
CeruleanGym_Blocks: INCBIN "maps/CeruleanGym.blk"

INCLUDE "data/mapHeaders/CeruleanMart.asm"
INCLUDE "scripts/CeruleanMart.asm"
INCLUDE "data/mapObjects/CeruleanMart.asm"

INCLUDE "data/mapHeaders/LavenderPokecenter.asm"
INCLUDE "scripts/LavenderPokecenter.asm"
INCLUDE "data/mapObjects/LavenderPokecenter.asm"

INCLUDE "data/mapHeaders/LavenderMart.asm"
INCLUDE "scripts/LavenderMart.asm"
INCLUDE "data/mapObjects/LavenderMart.asm"

INCLUDE "data/mapHeaders/VermilionPokecenter.asm"
INCLUDE "scripts/VermilionPokecenter.asm"
INCLUDE "data/mapObjects/VermilionPokecenter.asm"

INCLUDE "data/mapHeaders/VermilionMart.asm"
INCLUDE "scripts/VermilionMart.asm"
INCLUDE "data/mapObjects/VermilionMart.asm"

INCLUDE "data/mapHeaders/VermilionGym.asm"
INCLUDE "scripts/VermilionGym.asm"
INCLUDE "data/mapObjects/VermilionGym.asm"
VermilionGym_Blocks: INCBIN "maps/VermilionGym.blk"

INCLUDE "data/mapHeaders/CopycatsHouse2F.asm"
INCLUDE "scripts/CopycatsHouse2F.asm"
INCLUDE "data/mapObjects/CopycatsHouse2F.asm"

INCLUDE "data/mapHeaders/FightingDojo.asm"
INCLUDE "scripts/FightingDojo.asm"
INCLUDE "data/mapObjects/FightingDojo.asm"
FightingDojo_Blocks: INCBIN "maps/FightingDojo.blk"

INCLUDE "data/mapHeaders/SaffronGym.asm"
INCLUDE "scripts/SaffronGym.asm"
INCLUDE "data/mapObjects/SaffronGym.asm"
SaffronGym_Blocks: INCBIN "maps/SaffronGym.blk"

INCLUDE "data/mapHeaders/SaffronMart.asm"
INCLUDE "scripts/SaffronMart.asm"
INCLUDE "data/mapObjects/SaffronMart.asm"

INCLUDE "data/mapHeaders/SilphCo1F.asm"
INCLUDE "scripts/SilphCo1F.asm"
INCLUDE "data/mapObjects/SilphCo1F.asm"
SilphCo1F_Blocks: INCBIN "maps/SilphCo1F.blk"

INCLUDE "data/mapHeaders/SaffronPokecenter.asm"
INCLUDE "scripts/SaffronPokecenter.asm"
INCLUDE "data/mapObjects/SaffronPokecenter.asm"

INCLUDE "data/mapHeaders/ViridianForestNorthGate.asm"
INCLUDE "scripts/ViridianForestNorthGate.asm"
INCLUDE "data/mapObjects/ViridianForestNorthGate.asm"

INCLUDE "data/mapHeaders/Route2Gate.asm"
INCLUDE "scripts/Route2Gate.asm"
INCLUDE "data/mapObjects/Route2Gate.asm"

INCLUDE "data/mapHeaders/ViridianForestSouthGate.asm"
INCLUDE "scripts/ViridianForestSouthGate.asm"
INCLUDE "data/mapObjects/ViridianForestSouthGate.asm"

INCLUDE "data/mapHeaders/UndergroundPathRoute5.asm"
INCLUDE "scripts/UndergroundPathRoute5.asm"
INCLUDE "data/mapObjects/UndergroundPathRoute5.asm"

INCLUDE "data/mapHeaders/UndergroundPathRoute6.asm"
INCLUDE "scripts/UndergroundPathRoute6.asm"
INCLUDE "data/mapObjects/UndergroundPathRoute6.asm"

INCLUDE "data/mapHeaders/UndergroundPathRoute7.asm"
INCLUDE "scripts/UndergroundPathRoute7.asm"
INCLUDE "data/mapObjects/UndergroundPathRoute7.asm"

INCLUDE "data/mapHeaders/UndergroundPathRoute7Copy.asm"
INCLUDE "scripts/UndergroundPathRoute7Copy.asm"
INCLUDE "data/mapObjects/UndergroundPathRoute7Copy.asm"

INCLUDE "data/mapHeaders/SilphCo9F.asm"
INCLUDE "scripts/SilphCo9F.asm"
INCLUDE "data/mapObjects/SilphCo9F.asm"
SilphCo9F_Blocks: INCBIN "maps/SilphCo9F.blk"

INCLUDE "data/mapHeaders/VictoryRoad1F.asm"
INCLUDE "scripts/VictoryRoad1F.asm"
INCLUDE "data/mapObjects/VictoryRoad1F.asm"
VictoryRoad1F_Blocks: INCBIN "maps/VictoryRoad1F.blk"

INCLUDE "engine/predefs17_2.asm"

INCLUDE "engine/hidden_object_functions17.asm"


SECTION "bank18", ROMX

ViridianForest_Blocks: INCBIN "maps/ViridianForest.blk"
UndergroundPathNorthSouth_Blocks: INCBIN "maps/UndergroundPathNorthSouth.blk"
UndergroundPathWestEast_Blocks: INCBIN "maps/UndergroundPathWestEast.blk"

	INCBIN "maps/UnusedDiglettsCaveCopy.blk"

SSAnneB1FRooms_Blocks:
SSAnne2FRooms_Blocks: INCBIN "maps/SSAnne2FRooms.blk"

INCLUDE "data/mapHeaders/PokemonTower1F.asm"
INCLUDE "scripts/PokemonTower1F.asm"
INCLUDE "data/mapObjects/PokemonTower1F.asm"
PokemonTower1F_Blocks: INCBIN "maps/PokemonTower1F.blk"

INCLUDE "data/mapHeaders/PokemonTower2F.asm"
INCLUDE "scripts/PokemonTower2F.asm"
INCLUDE "data/mapObjects/PokemonTower2F.asm"
PokemonTower2F_Blocks: INCBIN "maps/PokemonTower2F.blk"

INCLUDE "data/mapHeaders/PokemonTower3F.asm"
INCLUDE "scripts/PokemonTower3F.asm"
INCLUDE "data/mapObjects/PokemonTower3F.asm"
PokemonTower3F_Blocks: INCBIN "maps/PokemonTower3F.blk"

INCLUDE "data/mapHeaders/PokemonTower4F.asm"
INCLUDE "scripts/PokemonTower4F.asm"
INCLUDE "data/mapObjects/PokemonTower4F.asm"
PokemonTower4F_Blocks: INCBIN "maps/PokemonTower4F.blk"

INCLUDE "data/mapHeaders/PokemonTower5F.asm"
INCLUDE "scripts/PokemonTower5F.asm"
INCLUDE "data/mapObjects/PokemonTower5F.asm"
PokemonTower5F_Blocks: INCBIN "maps/PokemonTower5F.blk"

INCLUDE "data/mapHeaders/PokemonTower6F.asm"
INCLUDE "scripts/PokemonTower6F.asm"
INCLUDE "data/mapObjects/PokemonTower6F.asm"
PokemonTower6F_Blocks: INCBIN "maps/PokemonTower6F.blk"

	INCBIN "maps/UnusedEmptyMap.blk"

INCLUDE "data/mapHeaders/PokemonTower7F.asm"
INCLUDE "scripts/PokemonTower7F.asm"
INCLUDE "data/mapObjects/PokemonTower7F.asm"
PokemonTower7F_Blocks: INCBIN "maps/PokemonTower7F.blk"

INCLUDE "data/mapHeaders/CeladonMart1F.asm"
INCLUDE "scripts/CeladonMart1F.asm"
INCLUDE "data/mapObjects/CeladonMart1F.asm"
CeladonMart1F_Blocks: INCBIN "maps/CeladonMart1F.blk"

INCLUDE "engine/overworld/cinnabar_lab.asm"

INCLUDE "data/mapHeaders/ViridianForest.asm"
INCLUDE "scripts/ViridianForest.asm"
INCLUDE "data/mapObjects/ViridianForest.asm"

INCLUDE "data/mapHeaders/SSAnne1F.asm"
INCLUDE "scripts/SSAnne1F.asm"
INCLUDE "data/mapObjects/SSAnne1F.asm"
SSAnne1F_Blocks: INCBIN "maps/SSAnne1F.blk"

INCLUDE "data/mapHeaders/SSAnne2F.asm"
INCLUDE "scripts/SSAnne2F.asm"
INCLUDE "data/mapObjects/SSAnne2F.asm"
SSAnne2F_Blocks: INCBIN "maps/SSAnne2F.blk"

INCLUDE "data/mapHeaders/SSAnneB1F.asm"
INCLUDE "scripts/SSAnneB1F.asm"
INCLUDE "data/mapObjects/SSAnneB1F.asm"
SSAnneB1F_Blocks: INCBIN "maps/SSAnneB1F.blk"

INCLUDE "data/mapHeaders/SSAnneBow.asm"
INCLUDE "scripts/SSAnneBow.asm"
INCLUDE "data/mapObjects/SSAnneBow.asm"
SSAnneBow_Blocks: INCBIN "maps/SSAnneBow.blk"

INCLUDE "data/mapHeaders/SSAnneKitchen.asm"
INCLUDE "scripts/SSAnneKitchen.asm"
INCLUDE "data/mapObjects/SSAnneKitchen.asm"
SSAnneKitchen_Blocks: INCBIN "maps/SSAnneKitchen.blk"

INCLUDE "data/mapHeaders/SSAnneCaptainsRoom.asm"
INCLUDE "scripts/SSAnneCaptainsRoom.asm"
INCLUDE "data/mapObjects/SSAnneCaptainsRoom.asm"
SSAnneCaptainsRoom_Blocks: INCBIN "maps/SSAnneCaptainsRoom.blk"

INCLUDE "data/mapHeaders/SSAnne1FRooms.asm"
INCLUDE "scripts/SSAnne1FRooms.asm"
INCLUDE "data/mapObjects/SSAnne1FRooms.asm"
SSAnne1FRooms_Blocks: INCBIN "maps/SSAnne1FRooms.blk"

INCLUDE "data/mapHeaders/SSAnne2FRooms.asm"
INCLUDE "scripts/SSAnne2FRooms.asm"
INCLUDE "data/mapObjects/SSAnne2FRooms.asm"

INCLUDE "data/mapHeaders/SSAnneB1FRooms.asm"
INCLUDE "scripts/SSAnneB1FRooms.asm"
INCLUDE "data/mapObjects/SSAnneB1FRooms.asm"

INCLUDE "data/mapHeaders/UndergroundPathNorthSouth.asm"
INCLUDE "scripts/UndergroundPathNorthSouth.asm"
INCLUDE "data/mapObjects/UndergroundPathNorthSouth.asm"

INCLUDE "data/mapHeaders/UndergroundPathWestEast.asm"
INCLUDE "scripts/UndergroundPathWestEast.asm"
INCLUDE "data/mapObjects/UndergroundPathWestEast.asm"

INCLUDE "data/mapHeaders/DiglettsCave.asm"
INCLUDE "scripts/DiglettsCave.asm"
INCLUDE "data/mapObjects/DiglettsCave.asm"
DiglettsCave_Blocks: INCBIN "maps/DiglettsCave.blk"

INCLUDE "data/mapHeaders/SilphCo11F.asm"
INCLUDE "scripts/SilphCo11F.asm"
INCLUDE "data/mapObjects/SilphCo11F.asm"
SilphCo11F_Blocks: INCBIN "maps/SilphCo11F.blk"

INCLUDE "engine/hidden_object_functions18.asm"


SECTION "bank19", ROMX

Overworld_GFX:     INCBIN "gfx/tilesets/overworld.2bpp"
Overworld_Block:   INCBIN "gfx/blocksets/overworld.bst"

RedsHouse1_GFX:
RedsHouse2_GFX:    INCBIN "gfx/tilesets/reds_house.2bpp"
	ds 16
RedsHouse1_Block:
RedsHouse2_Block:  INCBIN "gfx/blocksets/reds_house.bst"

House_GFX:         INCBIN "gfx/tilesets/house.2bpp"
House_Block:       INCBIN "gfx/blocksets/house.bst"
Mansion_GFX:       INCBIN "gfx/tilesets/mansion.2bpp"
Mansion_Block:     INCBIN "gfx/blocksets/mansion.bst"
ShipPort_GFX:      INCBIN "gfx/tilesets/ship_port.2bpp"
ShipPort_Block:    INCBIN "gfx/blocksets/ship_port.bst"
Interior_GFX:      INCBIN "gfx/tilesets/interior.2bpp"
Interior_Block:    INCBIN "gfx/blocksets/interior.bst"
Plateau_GFX:       INCBIN "gfx/tilesets/plateau.2bpp"
Plateau_Block:     INCBIN "gfx/blocksets/plateau.bst"


SECTION "bank1A", ROMX

INCLUDE "engine/battle/decrement_pp.asm"

Version_GFX:
IF DEF(_RED)
	INCBIN "gfx/red/redgreenversion.1bpp" ; 10 tiles
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/blue/blueversion.1bpp" ; 8 tiles
ENDC
Version_GFXEnd:

Dojo_GFX:
Gym_GFX:           INCBIN "gfx/tilesets/gym.2bpp"
Dojo_Block:
Gym_Block:         INCBIN "gfx/blocksets/gym.bst"

Mart_GFX:
Pokecenter_GFX:    INCBIN "gfx/tilesets/pokecenter.2bpp"
Mart_Block:
Pokecenter_Block:  INCBIN "gfx/blocksets/pokecenter.bst"

ForestGate_GFX:
Museum_GFX:
Gate_GFX:          INCBIN "gfx/tilesets/gate.2bpp"
ForestGate_Block:
Museum_Block:
Gate_Block:        INCBIN "gfx/blocksets/gate.bst"

Forest_GFX:        INCBIN "gfx/tilesets/forest.2bpp"
Forest_Block:      INCBIN "gfx/blocksets/forest.bst"
Facility_GFX:      INCBIN "gfx/tilesets/facility.2bpp"
Facility_Block:    INCBIN "gfx/blocksets/facility.bst"
	ds 1


SECTION "bank1B", ROMX

Cemetery_GFX:      INCBIN "gfx/tilesets/cemetery.2bpp"
Cemetery_Block:    INCBIN "gfx/blocksets/cemetery.bst"
Cavern_GFX:        INCBIN "gfx/tilesets/cavern.2bpp"
Cavern_Block:      INCBIN "gfx/blocksets/cavern.bst"
Lobby_GFX:         INCBIN "gfx/tilesets/lobby.2bpp"
Lobby_Block:       INCBIN "gfx/blocksets/lobby.bst"
Ship_GFX:          INCBIN "gfx/tilesets/ship.2bpp"
Ship_Block:        INCBIN "gfx/blocksets/ship.bst"
Lab_GFX:           INCBIN "gfx/tilesets/lab.2bpp"
Lab_Block:         INCBIN "gfx/blocksets/lab.bst"
Club_GFX:          INCBIN "gfx/tilesets/club.2bpp"
Club_Block:        INCBIN "gfx/blocksets/club.bst"
Underground_GFX:   INCBIN "gfx/tilesets/underground.2bpp"
Underground_Block: INCBIN "gfx/blocksets/underground.bst"


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


SECTION "bank1D", ROMX

CopycatsHouse1F_Blocks: INCBIN "maps/CopycatsHouse1F.blk"

CinnabarMart_Blocks:
PewterMart_Blocks: INCBIN "maps/PewterMart.blk"

FuchsiaBillsGrandpasHouse_Blocks: INCBIN "maps/FuchsiaBillsGrandpasHouse.blk"

CinnabarPokecenter_Blocks:
FuchsiaPokecenter_Blocks: INCBIN "maps/FuchsiaPokecenter.blk"

CeruleanBadgeHouse_Blocks: INCBIN "maps/CeruleanBadgeHouse.blk"

INCLUDE "engine/HoF_room_pc.asm"

INCLUDE "engine/status_ailments.asm"

INCLUDE "engine/items/itemfinder.asm"

INCLUDE "scripts/CeruleanCity_2.asm"

INCLUDE "data/mapHeaders/ViridianGym.asm"
INCLUDE "scripts/ViridianGym.asm"
INCLUDE "data/mapObjects/ViridianGym.asm"
ViridianGym_Blocks: INCBIN "maps/ViridianGym.blk"

INCLUDE "data/mapHeaders/PewterMart.asm"
INCLUDE "scripts/PewterMart.asm"
INCLUDE "data/mapObjects/PewterMart.asm"

INCLUDE "data/mapHeaders/CeruleanCave1F.asm"
INCLUDE "scripts/CeruleanCave1F.asm"
INCLUDE "data/mapObjects/CeruleanCave1F.asm"
CeruleanCave1F_Blocks: INCBIN "maps/CeruleanCave1F.blk"

INCLUDE "data/mapHeaders/CeruleanBadgeHouse.asm"
INCLUDE "scripts/CeruleanBadgeHouse.asm"
INCLUDE "data/mapObjects/CeruleanBadgeHouse.asm"

INCLUDE "engine/menu/vending_machine.asm"

INCLUDE "data/mapHeaders/FuchsiaBillsGrandpasHouse.asm"
INCLUDE "scripts/FuchsiaBillsGrandpasHouse.asm"
INCLUDE "data/mapObjects/FuchsiaBillsGrandpasHouse.asm"

INCLUDE "data/mapHeaders/FuchsiaPokecenter.asm"
INCLUDE "scripts/FuchsiaPokecenter.asm"
INCLUDE "data/mapObjects/FuchsiaPokecenter.asm"

INCLUDE "data/mapHeaders/WardensHouse.asm"
INCLUDE "scripts/WardensHouse.asm"
INCLUDE "data/mapObjects/WardensHouse.asm"
WardensHouse_Blocks: INCBIN "maps/WardensHouse.blk"

INCLUDE "data/mapHeaders/SafariZoneGate.asm"
INCLUDE "scripts/SafariZoneGate.asm"
INCLUDE "data/mapObjects/SafariZoneGate.asm"
SafariZoneGate_Blocks: INCBIN "maps/SafariZoneGate.blk"

INCLUDE "data/mapHeaders/FuchsiaGym.asm"
INCLUDE "scripts/FuchsiaGym.asm"
INCLUDE "data/mapObjects/FuchsiaGym.asm"
FuchsiaGym_Blocks: INCBIN "maps/FuchsiaGym.blk"

INCLUDE "data/mapHeaders/FuchsiaMeetingRoom.asm"
INCLUDE "scripts/FuchsiaMeetingRoom.asm"
INCLUDE "data/mapObjects/FuchsiaMeetingRoom.asm"
FuchsiaMeetingRoom_Blocks: INCBIN "maps/FuchsiaMeetingRoom.blk"

INCLUDE "data/mapHeaders/CinnabarGym.asm"
INCLUDE "scripts/CinnabarGym.asm"
INCLUDE "data/mapObjects/CinnabarGym.asm"
CinnabarGym_Blocks: INCBIN "maps/CinnabarGym.blk"

INCLUDE "data/mapHeaders/CinnabarLab.asm"
INCLUDE "scripts/CinnabarLab.asm"
INCLUDE "data/mapObjects/CinnabarLab.asm"
CinnabarLab_Blocks: INCBIN "maps/CinnabarLab.blk"

INCLUDE "data/mapHeaders/CinnabarLabTradeRoom.asm"
INCLUDE "scripts/CinnabarLabTradeRoom.asm"
INCLUDE "data/mapObjects/CinnabarLabTradeRoom.asm"
CinnabarLabTradeRoom_Blocks: INCBIN "maps/CinnabarLabTradeRoom.blk"

INCLUDE "data/mapHeaders/CinnabarLabMetronomeRoom.asm"
INCLUDE "scripts/CinnabarLabMetronomeRoom.asm"
INCLUDE "data/mapObjects/CinnabarLabMetronomeRoom.asm"
CinnabarLabMetronomeRoom_Blocks: INCBIN "maps/CinnabarLabMetronomeRoom.blk"

INCLUDE "data/mapHeaders/CinnabarLabFossilRoom.asm"
INCLUDE "scripts/CinnabarLabFossilRoom.asm"
INCLUDE "data/mapObjects/CinnabarLabFossilRoom.asm"
CinnabarLabFossilRoom_Blocks: INCBIN "maps/CinnabarLabFossilRoom.blk"

INCLUDE "data/mapHeaders/CinnabarPokecenter.asm"
INCLUDE "scripts/CinnabarPokecenter.asm"
INCLUDE "data/mapObjects/CinnabarPokecenter.asm"

INCLUDE "data/mapHeaders/CinnabarMart.asm"
INCLUDE "scripts/CinnabarMart.asm"
INCLUDE "data/mapObjects/CinnabarMart.asm"

INCLUDE "data/mapHeaders/CopycatsHouse1F.asm"
INCLUDE "scripts/CopycatsHouse1F.asm"
INCLUDE "data/mapObjects/CopycatsHouse1F.asm"

INCLUDE "data/mapHeaders/ChampionsRoom.asm"
INCLUDE "scripts/ChampionsRoom.asm"
INCLUDE "data/mapObjects/ChampionsRoom.asm"
ChampionsRoom_Blocks: INCBIN "maps/ChampionsRoom.blk"

INCLUDE "data/mapHeaders/LoreleisRoom.asm"
INCLUDE "scripts/LoreleisRoom.asm"
INCLUDE "data/mapObjects/LoreleisRoom.asm"
LoreleisRoom_Blocks: INCBIN "maps/LoreleisRoom.blk"

INCLUDE "data/mapHeaders/BrunosRoom.asm"
INCLUDE "scripts/BrunosRoom.asm"
INCLUDE "data/mapObjects/BrunosRoom.asm"
BrunosRoom_Blocks: INCBIN "maps/BrunosRoom.blk"

INCLUDE "data/mapHeaders/AgathasRoom.asm"
INCLUDE "scripts/AgathasRoom.asm"
INCLUDE "data/mapObjects/AgathasRoom.asm"
AgathasRoom_Blocks: INCBIN "maps/AgathasRoom.blk"

INCLUDE "engine/menu/league_pc.asm"

INCLUDE "engine/overworld/hidden_items.asm"


SECTION "bank1E", ROMX

INCLUDE "engine/battle/animations.asm"

INCLUDE "engine/overworld/cut2.asm"

INCLUDE "engine/overworld/ssanne.asm"

RedFishingTilesFront: INCBIN "gfx/red_fishing_tile_front.2bpp"
RedFishingTilesBack:  INCBIN "gfx/red_fishing_tile_back.2bpp"
RedFishingTilesSide:  INCBIN "gfx/red_fishing_tile_side.2bpp"
RedFishingRodTiles:   INCBIN "gfx/red_fishingrod_tiles.2bpp"

INCLUDE "data/animations.asm"

INCLUDE "engine/evolution.asm"

INCLUDE "engine/overworld/elevator.asm"

INCLUDE "engine/items/tm_prices.asm"
