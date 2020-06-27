INCLUDE "constants.asm"


SECTION "Maps 1", ROMX

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


SECTION "Maps 2", ROMX

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


SECTION "Maps 3", ROMX

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


SECTION "Maps 4", ROMX

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


SECTION "Maps 5", ROMX

INCLUDE "data/mapHeaders/LavenderTown.asm"
INCLUDE "data/mapObjects/LavenderTown.asm"
LavenderTown_Blocks: INCBIN "maps/LavenderTown.blk"

ViridianPokecenter_Blocks: INCBIN "maps/ViridianPokecenter.blk"

SafariZoneCenterRestHouse_Blocks:
SafariZoneWestRestHouse_Blocks:
SafariZoneEastRestHouse_Blocks:
SafariZoneNorthRestHouse_Blocks: INCBIN "maps/SafariZoneCenterRestHouse.blk"

INCLUDE "scripts/LavenderTown.asm"


SECTION "Maps 6", ROMX

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


SECTION "Maps 7", ROMX

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


SECTION "Maps 8", ROMX

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


SECTION "Maps 9", ROMX

INCLUDE "data/mapHeaders/TradeCenter.asm"
INCLUDE "scripts/TradeCenter.asm"
INCLUDE "data/mapObjects/TradeCenter.asm"
TradeCenter_Blocks: INCBIN "maps/TradeCenter.blk"

INCLUDE "data/mapHeaders/Colosseum.asm"
INCLUDE "scripts/Colosseum.asm"
INCLUDE "data/mapObjects/Colosseum.asm"
Colosseum_Blocks: INCBIN "maps/Colosseum.blk"


SECTION "Maps 10", ROMX

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


SECTION "Maps 11", ROMX

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


SECTION "Maps 12", ROMX

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


SECTION "Maps 13", ROMX

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


SECTION "Maps 14", ROMX

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


SECTION "Maps 15", ROMX

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


SECTION "Maps 16", ROMX

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


SECTION "Maps 17", ROMX

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


SECTION "Maps 18", ROMX

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


SECTION "Maps 19", ROMX

CopycatsHouse1F_Blocks: INCBIN "maps/CopycatsHouse1F.blk"

CinnabarMart_Blocks:
PewterMart_Blocks: INCBIN "maps/PewterMart.blk"

FuchsiaBillsGrandpasHouse_Blocks: INCBIN "maps/FuchsiaBillsGrandpasHouse.blk"

CinnabarPokecenter_Blocks:
FuchsiaPokecenter_Blocks: INCBIN "maps/FuchsiaPokecenter.blk"

CeruleanBadgeHouse_Blocks: INCBIN "maps/CeruleanBadgeHouse.blk"


SECTION "Maps 20", ROMX

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


SECTION "Maps 21", ROMX

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
