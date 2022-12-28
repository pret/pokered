SECTION "Maps 1", ROMX

INCLUDE "data/maps/headers/CeladonCity.asm"
INCLUDE "data/maps/objects/CeladonCity.asm"
CeladonCity_Blocks: INCBIN "maps/CeladonCity.blk"

INCLUDE "data/maps/headers/PalletTown.asm"
INCLUDE "data/maps/objects/PalletTown.asm"
PalletTown_Blocks: INCBIN "maps/PalletTown.blk"

INCLUDE "data/maps/headers/ViridianCity.asm"
INCLUDE "data/maps/objects/ViridianCity.asm"
ViridianCity_Blocks: INCBIN "maps/ViridianCity.blk"

INCLUDE "data/maps/headers/PewterCity.asm"
	ds 1
INCLUDE "data/maps/objects/PewterCity.asm"
PewterCity_Blocks: INCBIN "maps/PewterCity.blk"

INCLUDE "data/maps/headers/CeruleanCity.asm"
INCLUDE "data/maps/objects/CeruleanCity.asm"
CeruleanCity_Blocks: INCBIN "maps/CeruleanCity.blk"

INCLUDE "data/maps/headers/VermilionCity.asm"
INCLUDE "data/maps/objects/VermilionCity.asm"
VermilionCity_Blocks: INCBIN "maps/VermilionCity.blk"

INCLUDE "data/maps/headers/FuchsiaCity.asm"
INCLUDE "data/maps/objects/FuchsiaCity.asm"
FuchsiaCity_Blocks: INCBIN "maps/FuchsiaCity.blk"


SECTION "Maps 2", ROMX

INCLUDE "scripts/PalletTown.asm"
INCLUDE "scripts/ViridianCity.asm"
INCLUDE "scripts/PewterCity.asm"
INCLUDE "scripts/CeruleanCity.asm"
INCLUDE "scripts/VermilionCity.asm"
INCLUDE "scripts/CeladonCity.asm"
INCLUDE "scripts/FuchsiaCity.asm"

INCLUDE "data/maps/headers/BluesHouse.asm"
INCLUDE "scripts/BluesHouse.asm"
INCLUDE "data/maps/objects/BluesHouse.asm"
BluesHouse_Blocks: INCBIN "maps/BluesHouse.blk"

INCLUDE "data/maps/headers/VermilionTradeHouse.asm"
INCLUDE "scripts/VermilionTradeHouse.asm"
INCLUDE "data/maps/objects/VermilionTradeHouse.asm"
VermilionTradeHouse_Blocks: INCBIN "maps/VermilionTradeHouse.blk"

INCLUDE "data/maps/headers/IndigoPlateauLobby.asm"
INCLUDE "scripts/IndigoPlateauLobby.asm"
INCLUDE "data/maps/objects/IndigoPlateauLobby.asm"
IndigoPlateauLobby_Blocks: INCBIN "maps/IndigoPlateauLobby.blk"

INCLUDE "data/maps/headers/SilphCo4F.asm"
INCLUDE "scripts/SilphCo4F.asm"
INCLUDE "data/maps/objects/SilphCo4F.asm"
SilphCo4F_Blocks: INCBIN "maps/SilphCo4F.blk"

INCLUDE "data/maps/headers/SilphCo5F.asm"
INCLUDE "scripts/SilphCo5F.asm"
INCLUDE "data/maps/objects/SilphCo5F.asm"
SilphCo5F_Blocks: INCBIN "maps/SilphCo5F.blk"

INCLUDE "data/maps/headers/SilphCo6F.asm"
INCLUDE "scripts/SilphCo6F.asm"
INCLUDE "data/maps/objects/SilphCo6F.asm"
SilphCo6F_Blocks: INCBIN "maps/SilphCo6F.blk"


SECTION "Maps 3", ROMX

INCLUDE "data/maps/headers/CinnabarIsland.asm"
INCLUDE "data/maps/objects/CinnabarIsland.asm"
CinnabarIsland_Blocks: INCBIN "maps/CinnabarIsland.blk"

INCLUDE "data/maps/headers/Route1.asm"
INCLUDE "data/maps/objects/Route1.asm"
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

INCLUDE "data/maps/headers/OaksLab.asm"
INCLUDE "scripts/OaksLab.asm"
INCLUDE "data/maps/objects/OaksLab.asm"

INCLUDE "data/maps/headers/ViridianMart.asm"
INCLUDE "scripts/ViridianMart.asm"
INCLUDE "data/maps/objects/ViridianMart.asm"
ViridianMart_Blocks: INCBIN "maps/ViridianMart.blk"

INCLUDE "data/maps/headers/ViridianSchoolHouse.asm"
INCLUDE "scripts/ViridianSchoolHouse.asm"
INCLUDE "data/maps/objects/ViridianSchoolHouse.asm"

INCLUDE "data/maps/headers/ViridianNicknameHouse.asm"
	ds 1
INCLUDE "scripts/ViridianNicknameHouse.asm"
INCLUDE "data/maps/objects/ViridianNicknameHouse.asm"

INCLUDE "data/maps/headers/PewterNidoranHouse.asm"
INCLUDE "scripts/PewterNidoranHouse.asm"
INCLUDE "data/maps/objects/PewterNidoranHouse.asm"

INCLUDE "data/maps/headers/PewterSpeechHouse.asm"
INCLUDE "scripts/PewterSpeechHouse.asm"
INCLUDE "data/maps/objects/PewterSpeechHouse.asm"

INCLUDE "data/maps/headers/CeruleanTrashedHouse.asm"
INCLUDE "scripts/CeruleanTrashedHouse.asm"
INCLUDE "data/maps/objects/CeruleanTrashedHouse.asm"

INCLUDE "data/maps/headers/CeruleanTradeHouse.asm"
INCLUDE "scripts/CeruleanTradeHouse.asm"
INCLUDE "data/maps/objects/CeruleanTradeHouse.asm"

INCLUDE "data/maps/headers/BikeShop.asm"
INCLUDE "scripts/BikeShop.asm"
INCLUDE "data/maps/objects/BikeShop.asm"
BikeShop_Blocks: INCBIN "maps/BikeShop.blk"

INCLUDE "data/maps/headers/MrFujisHouse.asm"
INCLUDE "scripts/MrFujisHouse.asm"
INCLUDE "data/maps/objects/MrFujisHouse.asm"

INCLUDE "data/maps/headers/LavenderCuboneHouse.asm"
INCLUDE "scripts/LavenderCuboneHouse.asm"
INCLUDE "data/maps/objects/LavenderCuboneHouse.asm"

INCLUDE "data/maps/headers/NameRatersHouse.asm"
INCLUDE "scripts/NameRatersHouse.asm"
INCLUDE "data/maps/objects/NameRatersHouse.asm"

INCLUDE "data/maps/headers/VermilionPidgeyHouse.asm"
INCLUDE "scripts/VermilionPidgeyHouse.asm"
INCLUDE "data/maps/objects/VermilionPidgeyHouse.asm"

INCLUDE "data/maps/headers/VermilionDock.asm"
INCLUDE "scripts/VermilionDock.asm"
INCLUDE "data/maps/objects/VermilionDock.asm"
VermilionDock_Blocks: INCBIN "maps/VermilionDock.blk"

INCLUDE "data/maps/headers/CeladonMansionRoofHouse.asm"
INCLUDE "scripts/CeladonMansionRoofHouse.asm"
INCLUDE "data/maps/objects/CeladonMansionRoofHouse.asm"

INCLUDE "data/maps/headers/FuchsiaMart.asm"
INCLUDE "scripts/FuchsiaMart.asm"
INCLUDE "data/maps/objects/FuchsiaMart.asm"
FuchsiaMart_Blocks: INCBIN "maps/FuchsiaMart.blk"

INCLUDE "data/maps/headers/SaffronPidgeyHouse.asm"
INCLUDE "scripts/SaffronPidgeyHouse.asm"
INCLUDE "data/maps/objects/SaffronPidgeyHouse.asm"

INCLUDE "data/maps/headers/MrPsychicsHouse.asm"
INCLUDE "scripts/MrPsychicsHouse.asm"
INCLUDE "data/maps/objects/MrPsychicsHouse.asm"

INCLUDE "data/maps/headers/DiglettsCaveRoute2.asm"
INCLUDE "scripts/DiglettsCaveRoute2.asm"
INCLUDE "data/maps/objects/DiglettsCaveRoute2.asm"

INCLUDE "data/maps/headers/Route2TradeHouse.asm"
INCLUDE "scripts/Route2TradeHouse.asm"
INCLUDE "data/maps/objects/Route2TradeHouse.asm"

INCLUDE "data/maps/headers/Route5Gate.asm"
INCLUDE "scripts/Route5Gate.asm"
INCLUDE "data/maps/objects/Route5Gate.asm"
Route5Gate_Blocks: INCBIN "maps/Route5Gate.blk"

INCLUDE "data/maps/headers/Route6Gate.asm"
INCLUDE "scripts/Route6Gate.asm"
INCLUDE "data/maps/objects/Route6Gate.asm"
Route6Gate_Blocks: INCBIN "maps/Route6Gate.blk"

INCLUDE "data/maps/headers/Route7Gate.asm"
INCLUDE "scripts/Route7Gate.asm"
INCLUDE "data/maps/objects/Route7Gate.asm"
Route7Gate_Blocks: INCBIN "maps/Route7Gate.blk"

INCLUDE "data/maps/headers/Route8Gate.asm"
INCLUDE "scripts/Route8Gate.asm"
INCLUDE "data/maps/objects/Route8Gate.asm"
Route8Gate_Blocks: INCBIN "maps/Route8Gate.blk"

INCLUDE "data/maps/headers/UndergroundPathRoute8.asm"
INCLUDE "scripts/UndergroundPathRoute8.asm"
INCLUDE "data/maps/objects/UndergroundPathRoute8.asm"

INCLUDE "data/maps/headers/PowerPlant.asm"
INCLUDE "scripts/PowerPlant.asm"
INCLUDE "data/maps/objects/PowerPlant.asm"
PowerPlant_Blocks: INCBIN "maps/PowerPlant.blk"

INCLUDE "data/maps/headers/DiglettsCaveRoute11.asm"
INCLUDE "scripts/DiglettsCaveRoute11.asm"
INCLUDE "data/maps/objects/DiglettsCaveRoute11.asm"

INCLUDE "data/maps/headers/Route16FlyHouse.asm"
INCLUDE "scripts/Route16FlyHouse.asm"
INCLUDE "data/maps/objects/Route16FlyHouse.asm"

INCLUDE "data/maps/headers/Route22Gate.asm"
INCLUDE "scripts/Route22Gate.asm"
INCLUDE "data/maps/objects/Route22Gate.asm"
Route22Gate_Blocks: INCBIN "maps/Route22Gate.blk"

INCLUDE "data/maps/headers/BillsHouse.asm"
INCLUDE "scripts/BillsHouse.asm"
INCLUDE "data/maps/objects/BillsHouse.asm"
BillsHouse_Blocks: INCBIN "maps/BillsHouse.blk"


SECTION "Maps 5", ROMX

INCLUDE "data/maps/headers/LavenderTown.asm"
INCLUDE "data/maps/objects/LavenderTown.asm"
LavenderTown_Blocks: INCBIN "maps/LavenderTown.blk"

ViridianPokecenter_Blocks: INCBIN "maps/ViridianPokecenter.blk"

SafariZoneCenterRestHouse_Blocks:
SafariZoneWestRestHouse_Blocks:
SafariZoneEastRestHouse_Blocks:
SafariZoneNorthRestHouse_Blocks: INCBIN "maps/SafariZoneCenterRestHouse.blk"

INCLUDE "scripts/LavenderTown.asm"


SECTION "Maps 6", ROMX

INCLUDE "data/maps/headers/ViridianPokecenter.asm"
INCLUDE "scripts/ViridianPokecenter.asm"
INCLUDE "data/maps/objects/ViridianPokecenter.asm"

INCLUDE "data/maps/headers/PokemonMansion1F.asm"
INCLUDE "scripts/PokemonMansion1F.asm"
INCLUDE "data/maps/objects/PokemonMansion1F.asm"
PokemonMansion1F_Blocks: INCBIN "maps/PokemonMansion1F.blk"

INCLUDE "data/maps/headers/RockTunnel1F.asm"
INCLUDE "scripts/RockTunnel1F.asm"
INCLUDE "data/maps/objects/RockTunnel1F.asm"
RockTunnel1F_Blocks: INCBIN "maps/RockTunnel1F.blk"

INCLUDE "data/maps/headers/SeafoamIslands1F.asm"
INCLUDE "scripts/SeafoamIslands1F.asm"
INCLUDE "data/maps/objects/SeafoamIslands1F.asm"
SeafoamIslands1F_Blocks: INCBIN "maps/SeafoamIslands1F.blk"

INCLUDE "data/maps/headers/SSAnne3F.asm"
INCLUDE "scripts/SSAnne3F.asm"
INCLUDE "data/maps/objects/SSAnne3F.asm"
SSAnne3F_Blocks: INCBIN "maps/SSAnne3F.blk"

INCLUDE "data/maps/headers/VictoryRoad3F.asm"
INCLUDE "scripts/VictoryRoad3F.asm"
INCLUDE "data/maps/objects/VictoryRoad3F.asm"
VictoryRoad3F_Blocks: INCBIN "maps/VictoryRoad3F.blk"

INCLUDE "data/maps/headers/RocketHideoutB1F.asm"
INCLUDE "scripts/RocketHideoutB1F.asm"
INCLUDE "data/maps/objects/RocketHideoutB1F.asm"
RocketHideoutB1F_Blocks: INCBIN "maps/RocketHideoutB1F.blk"

INCLUDE "data/maps/headers/RocketHideoutB2F.asm"
INCLUDE "scripts/RocketHideoutB2F.asm"
INCLUDE "data/maps/objects/RocketHideoutB2F.asm"
RocketHideoutB2F_Blocks: INCBIN "maps/RocketHideoutB2F.blk"

INCLUDE "data/maps/headers/RocketHideoutB3F.asm"
INCLUDE "scripts/RocketHideoutB3F.asm"
INCLUDE "data/maps/objects/RocketHideoutB3F.asm"
RocketHideoutB3F_Blocks: INCBIN "maps/RocketHideoutB3F.blk"

INCLUDE "data/maps/headers/RocketHideoutB4F.asm"
INCLUDE "scripts/RocketHideoutB4F.asm"
INCLUDE "data/maps/objects/RocketHideoutB4F.asm"
RocketHideoutB4F_Blocks: INCBIN "maps/RocketHideoutB4F.blk"

INCLUDE "data/maps/headers/RocketHideoutElevator.asm"
INCLUDE "scripts/RocketHideoutElevator.asm"
INCLUDE "data/maps/objects/RocketHideoutElevator.asm"
RocketHideoutElevator_Blocks: INCBIN "maps/RocketHideoutElevator.blk"

INCLUDE "data/maps/headers/SilphCoElevator.asm"
INCLUDE "scripts/SilphCoElevator.asm"
INCLUDE "data/maps/objects/SilphCoElevator.asm"
SilphCoElevator_Blocks: INCBIN "maps/SilphCoElevator.blk"

INCLUDE "data/maps/headers/SafariZoneEast.asm"
INCLUDE "scripts/SafariZoneEast.asm"
INCLUDE "data/maps/objects/SafariZoneEast.asm"
SafariZoneEast_Blocks: INCBIN "maps/SafariZoneEast.blk"

INCLUDE "data/maps/headers/SafariZoneNorth.asm"
INCLUDE "scripts/SafariZoneNorth.asm"
INCLUDE "data/maps/objects/SafariZoneNorth.asm"
SafariZoneNorth_Blocks: INCBIN "maps/SafariZoneNorth.blk"

INCLUDE "data/maps/headers/SafariZoneCenter.asm"
INCLUDE "scripts/SafariZoneCenter.asm"
INCLUDE "data/maps/objects/SafariZoneCenter.asm"
SafariZoneCenter_Blocks: INCBIN "maps/SafariZoneCenter.blk"

INCLUDE "data/maps/headers/SafariZoneCenterRestHouse.asm"
INCLUDE "scripts/SafariZoneCenterRestHouse.asm"
INCLUDE "data/maps/objects/SafariZoneCenterRestHouse.asm"

INCLUDE "data/maps/headers/SafariZoneWestRestHouse.asm"
INCLUDE "scripts/SafariZoneWestRestHouse.asm"
INCLUDE "data/maps/objects/SafariZoneWestRestHouse.asm"

INCLUDE "data/maps/headers/SafariZoneEastRestHouse.asm"
INCLUDE "scripts/SafariZoneEastRestHouse.asm"
INCLUDE "data/maps/objects/SafariZoneEastRestHouse.asm"

INCLUDE "data/maps/headers/SafariZoneNorthRestHouse.asm"
INCLUDE "scripts/SafariZoneNorthRestHouse.asm"
INCLUDE "data/maps/objects/SafariZoneNorthRestHouse.asm"

INCLUDE "data/maps/headers/CeruleanCave2F.asm"
INCLUDE "scripts/CeruleanCave2F.asm"
INCLUDE "data/maps/objects/CeruleanCave2F.asm"
CeruleanCave2F_Blocks: INCBIN "maps/CeruleanCave2F.blk"

INCLUDE "data/maps/headers/CeruleanCaveB1F.asm"
INCLUDE "scripts/CeruleanCaveB1F.asm"
INCLUDE "data/maps/objects/CeruleanCaveB1F.asm"
CeruleanCaveB1F_Blocks: INCBIN "maps/CeruleanCaveB1F.blk"

INCLUDE "data/maps/headers/RockTunnelB1F.asm"
INCLUDE "scripts/RockTunnelB1F.asm"
INCLUDE "data/maps/objects/RockTunnelB1F.asm"
RockTunnelB1F_Blocks: INCBIN "maps/RockTunnelB1F.blk"

INCLUDE "data/maps/headers/SeafoamIslandsB1F.asm"
INCLUDE "scripts/SeafoamIslandsB1F.asm"
INCLUDE "data/maps/objects/SeafoamIslandsB1F.asm"
SeafoamIslandsB1F_Blocks: INCBIN "maps/SeafoamIslandsB1F.blk"

INCLUDE "data/maps/headers/SeafoamIslandsB2F.asm"
INCLUDE "scripts/SeafoamIslandsB2F.asm"
INCLUDE "data/maps/objects/SeafoamIslandsB2F.asm"
SeafoamIslandsB2F_Blocks: INCBIN "maps/SeafoamIslandsB2F.blk"

INCLUDE "data/maps/headers/SeafoamIslandsB3F.asm"
INCLUDE "scripts/SeafoamIslandsB3F.asm"
INCLUDE "data/maps/objects/SeafoamIslandsB3F.asm"
SeafoamIslandsB3F_Blocks: INCBIN "maps/SeafoamIslandsB3F.blk"

INCLUDE "data/maps/headers/SeafoamIslandsB4F.asm"
INCLUDE "scripts/SeafoamIslandsB4F.asm"
INCLUDE "data/maps/objects/SeafoamIslandsB4F.asm"
SeafoamIslandsB4F_Blocks: INCBIN "maps/SeafoamIslandsB4F.blk"


SECTION "Maps 7", ROMX

INCLUDE "data/maps/headers/Route7.asm"
INCLUDE "data/maps/objects/Route7.asm"
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

INCLUDE "data/maps/headers/RedsHouse1F.asm"
INCLUDE "scripts/RedsHouse1F.asm"
INCLUDE "data/maps/objects/RedsHouse1F.asm"
RedsHouse1F_Blocks: INCBIN "maps/RedsHouse1F.blk"

INCLUDE "data/maps/headers/CeladonMart3F.asm"
INCLUDE "scripts/CeladonMart3F.asm"
INCLUDE "data/maps/objects/CeladonMart3F.asm"
CeladonMart3F_Blocks: INCBIN "maps/CeladonMart3F.blk"

INCLUDE "data/maps/headers/CeladonMart4F.asm"
INCLUDE "scripts/CeladonMart4F.asm"
INCLUDE "data/maps/objects/CeladonMart4F.asm"
CeladonMart4F_Blocks: INCBIN "maps/CeladonMart4F.blk"

INCLUDE "data/maps/headers/CeladonMartRoof.asm"
INCLUDE "scripts/CeladonMartRoof.asm"
INCLUDE "data/maps/objects/CeladonMartRoof.asm"
CeladonMartRoof_Blocks: INCBIN "maps/CeladonMartRoof.blk"

INCLUDE "data/maps/headers/CeladonMartElevator.asm"
INCLUDE "scripts/CeladonMartElevator.asm"
INCLUDE "data/maps/objects/CeladonMartElevator.asm"
CeladonMartElevator_Blocks: INCBIN "maps/CeladonMartElevator.blk"

INCLUDE "data/maps/headers/CeladonMansion1F.asm"
INCLUDE "scripts/CeladonMansion1F.asm"
INCLUDE "data/maps/objects/CeladonMansion1F.asm"
CeladonMansion1F_Blocks: INCBIN "maps/CeladonMansion1F.blk"

INCLUDE "data/maps/headers/CeladonMansion2F.asm"
INCLUDE "scripts/CeladonMansion2F.asm"
INCLUDE "data/maps/objects/CeladonMansion2F.asm"
CeladonMansion2F_Blocks: INCBIN "maps/CeladonMansion2F.blk"

INCLUDE "data/maps/headers/CeladonMansion3F.asm"
INCLUDE "scripts/CeladonMansion3F.asm"
INCLUDE "data/maps/objects/CeladonMansion3F.asm"
CeladonMansion3F_Blocks: INCBIN "maps/CeladonMansion3F.blk"

INCLUDE "data/maps/headers/CeladonMansionRoof.asm"
INCLUDE "scripts/CeladonMansionRoof.asm"
INCLUDE "data/maps/objects/CeladonMansionRoof.asm"
CeladonMansionRoof_Blocks: INCBIN "maps/CeladonMansionRoof.blk"

INCLUDE "data/maps/headers/CeladonPokecenter.asm"
INCLUDE "scripts/CeladonPokecenter.asm"
INCLUDE "data/maps/objects/CeladonPokecenter.asm"

INCLUDE "data/maps/headers/CeladonGym.asm"
INCLUDE "scripts/CeladonGym.asm"
INCLUDE "data/maps/objects/CeladonGym.asm"
CeladonGym_Blocks: INCBIN "maps/CeladonGym.blk"

INCLUDE "data/maps/headers/GameCorner.asm"
INCLUDE "scripts/GameCorner.asm"
INCLUDE "data/maps/objects/GameCorner.asm"
GameCorner_Blocks: INCBIN "maps/GameCorner.blk"

INCLUDE "data/maps/headers/CeladonMart5F.asm"
INCLUDE "scripts/CeladonMart5F.asm"
INCLUDE "data/maps/objects/CeladonMart5F.asm"
CeladonMart5F_Blocks: INCBIN "maps/CeladonMart5F.blk"

INCLUDE "data/maps/headers/GameCornerPrizeRoom.asm"
INCLUDE "scripts/GameCornerPrizeRoom.asm"
INCLUDE "data/maps/objects/GameCornerPrizeRoom.asm"
GameCornerPrizeRoom_Blocks: INCBIN "maps/GameCornerPrizeRoom.blk"

INCLUDE "data/maps/headers/CeladonDiner.asm"
INCLUDE "scripts/CeladonDiner.asm"
INCLUDE "data/maps/objects/CeladonDiner.asm"
CeladonDiner_Blocks: INCBIN "maps/CeladonDiner.blk"

INCLUDE "data/maps/headers/CeladonChiefHouse.asm"
INCLUDE "scripts/CeladonChiefHouse.asm"
INCLUDE "data/maps/objects/CeladonChiefHouse.asm"
CeladonChiefHouse_Blocks: INCBIN "maps/CeladonChiefHouse.blk"

INCLUDE "data/maps/headers/CeladonHotel.asm"
INCLUDE "scripts/CeladonHotel.asm"
INCLUDE "data/maps/objects/CeladonHotel.asm"
CeladonHotel_Blocks: INCBIN "maps/CeladonHotel.blk"

INCLUDE "data/maps/headers/MtMoonPokecenter.asm"
INCLUDE "scripts/MtMoonPokecenter.asm"
INCLUDE "data/maps/objects/MtMoonPokecenter.asm"

INCLUDE "data/maps/headers/RockTunnelPokecenter.asm"
INCLUDE "scripts/RockTunnelPokecenter.asm"
INCLUDE "data/maps/objects/RockTunnelPokecenter.asm"

INCLUDE "data/maps/headers/Route11Gate1F.asm"
INCLUDE "scripts/Route11Gate1F.asm"
INCLUDE "data/maps/objects/Route11Gate1F.asm"

INCLUDE "data/maps/headers/Route11Gate2F.asm"
INCLUDE "scripts/Route11Gate2F.asm"
INCLUDE "data/maps/objects/Route11Gate2F.asm"

INCLUDE "data/maps/headers/Route12Gate1F.asm"
INCLUDE "scripts/Route12Gate1F.asm"
INCLUDE "data/maps/objects/Route12Gate1F.asm"
Route12Gate1F_Blocks: INCBIN "maps/Route12Gate1F.blk"

INCLUDE "data/maps/headers/Route12Gate2F.asm"
INCLUDE "scripts/Route12Gate2F.asm"
INCLUDE "data/maps/objects/Route12Gate2F.asm"

INCLUDE "data/maps/headers/Route15Gate1F.asm"
INCLUDE "scripts/Route15Gate1F.asm"
INCLUDE "data/maps/objects/Route15Gate1F.asm"

INCLUDE "data/maps/headers/Route15Gate2F.asm"
INCLUDE "scripts/Route15Gate2F.asm"
INCLUDE "data/maps/objects/Route15Gate2F.asm"

INCLUDE "data/maps/headers/Route16Gate1F.asm"
INCLUDE "scripts/Route16Gate1F.asm"
INCLUDE "data/maps/objects/Route16Gate1F.asm"
Route16Gate1F_Blocks: INCBIN "maps/Route16Gate1F.blk"

INCLUDE "data/maps/headers/Route16Gate2F.asm"
INCLUDE "scripts/Route16Gate2F.asm"
INCLUDE "data/maps/objects/Route16Gate2F.asm"

INCLUDE "data/maps/headers/Route18Gate1F.asm"
INCLUDE "scripts/Route18Gate1F.asm"
INCLUDE "data/maps/objects/Route18Gate1F.asm"

INCLUDE "data/maps/headers/Route18Gate2F.asm"
INCLUDE "scripts/Route18Gate2F.asm"
INCLUDE "data/maps/objects/Route18Gate2F.asm"

INCLUDE "data/maps/headers/MtMoon1F.asm"
INCLUDE "scripts/MtMoon1F.asm"
INCLUDE "data/maps/objects/MtMoon1F.asm"
MtMoon1F_Blocks: INCBIN "maps/MtMoon1F.blk"

INCLUDE "data/maps/headers/MtMoonB2F.asm"
INCLUDE "scripts/MtMoonB2F.asm"
INCLUDE "data/maps/objects/MtMoonB2F.asm"
MtMoonB2F_Blocks: INCBIN "maps/MtMoonB2F.blk"

INCLUDE "data/maps/headers/SafariZoneWest.asm"
INCLUDE "scripts/SafariZoneWest.asm"
INCLUDE "data/maps/objects/SafariZoneWest.asm"
SafariZoneWest_Blocks: INCBIN "maps/SafariZoneWest.blk"

INCLUDE "data/maps/headers/SafariZoneSecretHouse.asm"
INCLUDE "scripts/SafariZoneSecretHouse.asm"
INCLUDE "data/maps/objects/SafariZoneSecretHouse.asm"
SafariZoneSecretHouse_Blocks: INCBIN "maps/SafariZoneSecretHouse.blk"


SECTION "Maps 9", ROMX

INCLUDE "data/maps/headers/TradeCenter.asm"
INCLUDE "scripts/TradeCenter.asm"
INCLUDE "data/maps/objects/TradeCenter.asm"
TradeCenter_Blocks: INCBIN "maps/TradeCenter.blk"

INCLUDE "data/maps/headers/Colosseum.asm"
INCLUDE "scripts/Colosseum.asm"
INCLUDE "data/maps/objects/Colosseum.asm"
Colosseum_Blocks: INCBIN "maps/Colosseum.blk"


SECTION "Maps 10", ROMX

INCLUDE "data/maps/headers/Route22.asm"
INCLUDE "data/maps/objects/Route22.asm"
Route22_Blocks: INCBIN "maps/Route22.blk"

INCLUDE "data/maps/headers/Route20.asm"
INCLUDE "data/maps/objects/Route20.asm"
Route20_Blocks: INCBIN "maps/Route20.blk"

INCLUDE "data/maps/headers/Route23.asm"
INCLUDE "data/maps/objects/Route23.asm"
Route23_Blocks: INCBIN "maps/Route23.blk"

INCLUDE "data/maps/headers/Route24.asm"
INCLUDE "data/maps/objects/Route24.asm"
Route24_Blocks: INCBIN "maps/Route24.blk"

INCLUDE "data/maps/headers/Route25.asm"
INCLUDE "data/maps/objects/Route25.asm"
Route25_Blocks: INCBIN "maps/Route25.blk"

INCLUDE "data/maps/headers/IndigoPlateau.asm"
INCLUDE "scripts/IndigoPlateau.asm"
INCLUDE "data/maps/objects/IndigoPlateau.asm"
IndigoPlateau_Blocks: INCBIN "maps/IndigoPlateau.blk"

INCLUDE "data/maps/headers/SaffronCity.asm"
INCLUDE "data/maps/objects/SaffronCity.asm"
SaffronCity_Blocks: INCBIN "maps/SaffronCity.blk"
INCLUDE "scripts/SaffronCity.asm"

INCLUDE "scripts/Route20.asm"
INCLUDE "scripts/Route22.asm"
INCLUDE "scripts/Route23.asm"
INCLUDE "scripts/Route24.asm"
INCLUDE "scripts/Route25.asm"

INCLUDE "data/maps/headers/VictoryRoad2F.asm"
INCLUDE "scripts/VictoryRoad2F.asm"
INCLUDE "data/maps/objects/VictoryRoad2F.asm"
VictoryRoad2F_Blocks: INCBIN "maps/VictoryRoad2F.blk"

INCLUDE "data/maps/headers/MtMoonB1F.asm"
INCLUDE "scripts/MtMoonB1F.asm"
INCLUDE "data/maps/objects/MtMoonB1F.asm"
MtMoonB1F_Blocks: INCBIN "maps/MtMoonB1F.blk"

INCLUDE "data/maps/headers/SilphCo7F.asm"
INCLUDE "scripts/SilphCo7F.asm"
INCLUDE "data/maps/objects/SilphCo7F.asm"
SilphCo7F_Blocks: INCBIN "maps/SilphCo7F.blk"

INCLUDE "data/maps/headers/PokemonMansion2F.asm"
INCLUDE "scripts/PokemonMansion2F.asm"
INCLUDE "data/maps/objects/PokemonMansion2F.asm"
PokemonMansion2F_Blocks: INCBIN "maps/PokemonMansion2F.blk"

INCLUDE "data/maps/headers/PokemonMansion3F.asm"
INCLUDE "scripts/PokemonMansion3F.asm"
INCLUDE "data/maps/objects/PokemonMansion3F.asm"
PokemonMansion3F_Blocks: INCBIN "maps/PokemonMansion3F.blk"

INCLUDE "data/maps/headers/PokemonMansionB1F.asm"
INCLUDE "scripts/PokemonMansionB1F.asm"
INCLUDE "data/maps/objects/PokemonMansionB1F.asm"
PokemonMansionB1F_Blocks: INCBIN "maps/PokemonMansionB1F.blk"


SECTION "Maps 11", ROMX

INCLUDE "data/maps/headers/Route2.asm"
INCLUDE "data/maps/objects/Route2.asm"
Route2_Blocks: INCBIN "maps/Route2.blk"

INCLUDE "data/maps/headers/Route3.asm"
INCLUDE "data/maps/objects/Route3.asm"
Route3_Blocks: INCBIN "maps/Route3.blk"

INCLUDE "data/maps/headers/Route4.asm"
INCLUDE "data/maps/objects/Route4.asm"
Route4_Blocks: INCBIN "maps/Route4.blk"

INCLUDE "data/maps/headers/Route5.asm"
INCLUDE "data/maps/objects/Route5.asm"
Route5_Blocks: INCBIN "maps/Route5.blk"

INCLUDE "data/maps/headers/Route9.asm"
INCLUDE "data/maps/objects/Route9.asm"
Route9_Blocks: INCBIN "maps/Route9.blk"

INCLUDE "data/maps/headers/Route13.asm"
INCLUDE "data/maps/objects/Route13.asm"
Route13_Blocks: INCBIN "maps/Route13.blk"

INCLUDE "data/maps/headers/Route14.asm"
INCLUDE "data/maps/objects/Route14.asm"
Route14_Blocks: INCBIN "maps/Route14.blk"

INCLUDE "data/maps/headers/Route17.asm"
INCLUDE "data/maps/objects/Route17.asm"
Route17_Blocks: INCBIN "maps/Route17.blk"

INCLUDE "data/maps/headers/Route19.asm"
INCLUDE "data/maps/objects/Route19.asm"
Route19_Blocks: INCBIN "maps/Route19.blk"

INCLUDE "data/maps/headers/Route21.asm"
INCLUDE "data/maps/objects/Route21.asm"
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

INCLUDE "data/maps/headers/VermilionOldRodHouse.asm"
INCLUDE "scripts/VermilionOldRodHouse.asm"
INCLUDE "data/maps/objects/VermilionOldRodHouse.asm"

INCLUDE "data/maps/headers/CeladonMart2F.asm"
INCLUDE "scripts/CeladonMart2F.asm"
INCLUDE "data/maps/objects/CeladonMart2F.asm"
CeladonMart2F_Blocks: INCBIN "maps/CeladonMart2F.blk"

INCLUDE "data/maps/headers/FuchsiaGoodRodHouse.asm"
INCLUDE "scripts/FuchsiaGoodRodHouse.asm"
INCLUDE "data/maps/objects/FuchsiaGoodRodHouse.asm"

INCLUDE "data/maps/headers/Daycare.asm"
INCLUDE "scripts/Daycare.asm"
INCLUDE "data/maps/objects/Daycare.asm"

INCLUDE "data/maps/headers/Route12SuperRodHouse.asm"
INCLUDE "scripts/Route12SuperRodHouse.asm"
INCLUDE "data/maps/objects/Route12SuperRodHouse.asm"

INCLUDE "data/maps/headers/SilphCo8F.asm"
INCLUDE "scripts/SilphCo8F.asm"
INCLUDE "data/maps/objects/SilphCo8F.asm"
SilphCo8F_Blocks: INCBIN "maps/SilphCo8F.blk"


SECTION "Maps 13", ROMX

INCLUDE "data/maps/headers/Route6.asm"
INCLUDE "data/maps/objects/Route6.asm"
Route6_Blocks: INCBIN "maps/Route6.blk"

INCLUDE "data/maps/headers/Route8.asm"
INCLUDE "data/maps/objects/Route8.asm"
Route8_Blocks: INCBIN "maps/Route8.blk"

INCLUDE "data/maps/headers/Route10.asm"
INCLUDE "data/maps/objects/Route10.asm"
Route10_Blocks: INCBIN "maps/Route10.blk"

INCLUDE "data/maps/headers/Route11.asm"
INCLUDE "data/maps/objects/Route11.asm"
Route11_Blocks: INCBIN "maps/Route11.blk"

INCLUDE "data/maps/headers/Route12.asm"
INCLUDE "data/maps/objects/Route12.asm"
Route12_Blocks: INCBIN "maps/Route12.blk"

INCLUDE "data/maps/headers/Route15.asm"
INCLUDE "data/maps/objects/Route15.asm"
Route15_Blocks: INCBIN "maps/Route15.blk"

INCLUDE "data/maps/headers/Route16.asm"
INCLUDE "data/maps/objects/Route16.asm"
Route16_Blocks: INCBIN "maps/Route16.blk"

INCLUDE "data/maps/headers/Route18.asm"
INCLUDE "data/maps/objects/Route18.asm"
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

INCLUDE "data/maps/headers/PokemonFanClub.asm"
INCLUDE "scripts/PokemonFanClub.asm"
INCLUDE "data/maps/objects/PokemonFanClub.asm"
PokemonFanClub_Blocks: INCBIN "maps/PokemonFanClub.blk"

INCLUDE "data/maps/headers/SilphCo2F.asm"
INCLUDE "scripts/SilphCo2F.asm"
INCLUDE "data/maps/objects/SilphCo2F.asm"
SilphCo2F_Blocks: INCBIN "maps/SilphCo2F.blk"

INCLUDE "data/maps/headers/SilphCo3F.asm"
INCLUDE "scripts/SilphCo3F.asm"
INCLUDE "data/maps/objects/SilphCo3F.asm"
SilphCo3F_Blocks: INCBIN "maps/SilphCo3F.blk"

INCLUDE "data/maps/headers/SilphCo10F.asm"
INCLUDE "scripts/SilphCo10F.asm"
INCLUDE "data/maps/objects/SilphCo10F.asm"
SilphCo10F_Blocks: INCBIN "maps/SilphCo10F.blk"

INCLUDE "data/maps/headers/LancesRoom.asm"
INCLUDE "scripts/LancesRoom.asm"
INCLUDE "data/maps/objects/LancesRoom.asm"
LancesRoom_Blocks: INCBIN "maps/LancesRoom.blk"

INCLUDE "data/maps/headers/HallOfFame.asm"
INCLUDE "scripts/HallOfFame.asm"
INCLUDE "data/maps/objects/HallOfFame.asm"
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

INCLUDE "data/maps/headers/RedsHouse2F.asm"
INCLUDE "scripts/RedsHouse2F.asm"
INCLUDE "data/maps/objects/RedsHouse2F.asm"


SECTION "Maps 16", ROMX

INCLUDE "data/maps/headers/Museum1F.asm"
INCLUDE "scripts/Museum1F.asm"
INCLUDE "data/maps/objects/Museum1F.asm"

INCLUDE "data/maps/headers/Museum2F.asm"
INCLUDE "scripts/Museum2F.asm"
INCLUDE "data/maps/objects/Museum2F.asm"

INCLUDE "data/maps/headers/PewterGym.asm"
INCLUDE "scripts/PewterGym.asm"
INCLUDE "data/maps/objects/PewterGym.asm"
PewterGym_Blocks: INCBIN "maps/PewterGym.blk"

INCLUDE "data/maps/headers/PewterPokecenter.asm"
INCLUDE "scripts/PewterPokecenter.asm"
INCLUDE "data/maps/objects/PewterPokecenter.asm"

INCLUDE "data/maps/headers/CeruleanPokecenter.asm"
INCLUDE "scripts/CeruleanPokecenter.asm"
INCLUDE "data/maps/objects/CeruleanPokecenter.asm"
CeruleanPokecenter_Blocks: INCBIN "maps/CeruleanPokecenter.blk"

INCLUDE "data/maps/headers/CeruleanGym.asm"
INCLUDE "scripts/CeruleanGym.asm"
INCLUDE "data/maps/objects/CeruleanGym.asm"
CeruleanGym_Blocks: INCBIN "maps/CeruleanGym.blk"

INCLUDE "data/maps/headers/CeruleanMart.asm"
INCLUDE "scripts/CeruleanMart.asm"
INCLUDE "data/maps/objects/CeruleanMart.asm"

INCLUDE "data/maps/headers/LavenderPokecenter.asm"
INCLUDE "scripts/LavenderPokecenter.asm"
INCLUDE "data/maps/objects/LavenderPokecenter.asm"

INCLUDE "data/maps/headers/LavenderMart.asm"
INCLUDE "scripts/LavenderMart.asm"
INCLUDE "data/maps/objects/LavenderMart.asm"

INCLUDE "data/maps/headers/VermilionPokecenter.asm"
INCLUDE "scripts/VermilionPokecenter.asm"
INCLUDE "data/maps/objects/VermilionPokecenter.asm"

INCLUDE "data/maps/headers/VermilionMart.asm"
INCLUDE "scripts/VermilionMart.asm"
INCLUDE "data/maps/objects/VermilionMart.asm"

INCLUDE "data/maps/headers/VermilionGym.asm"
INCLUDE "scripts/VermilionGym.asm"
INCLUDE "data/maps/objects/VermilionGym.asm"
VermilionGym_Blocks: INCBIN "maps/VermilionGym.blk"

INCLUDE "data/maps/headers/CopycatsHouse2F.asm"
INCLUDE "scripts/CopycatsHouse2F.asm"
INCLUDE "data/maps/objects/CopycatsHouse2F.asm"

INCLUDE "data/maps/headers/FightingDojo.asm"
INCLUDE "scripts/FightingDojo.asm"
INCLUDE "data/maps/objects/FightingDojo.asm"
FightingDojo_Blocks: INCBIN "maps/FightingDojo.blk"

INCLUDE "data/maps/headers/SaffronGym.asm"
INCLUDE "scripts/SaffronGym.asm"
INCLUDE "data/maps/objects/SaffronGym.asm"
SaffronGym_Blocks: INCBIN "maps/SaffronGym.blk"

INCLUDE "data/maps/headers/SaffronMart.asm"
INCLUDE "scripts/SaffronMart.asm"
INCLUDE "data/maps/objects/SaffronMart.asm"

INCLUDE "data/maps/headers/SilphCo1F.asm"
INCLUDE "scripts/SilphCo1F.asm"
INCLUDE "data/maps/objects/SilphCo1F.asm"
SilphCo1F_Blocks: INCBIN "maps/SilphCo1F.blk"

INCLUDE "data/maps/headers/SaffronPokecenter.asm"
INCLUDE "scripts/SaffronPokecenter.asm"
INCLUDE "data/maps/objects/SaffronPokecenter.asm"

INCLUDE "data/maps/headers/ViridianForestNorthGate.asm"
INCLUDE "scripts/ViridianForestNorthGate.asm"
INCLUDE "data/maps/objects/ViridianForestNorthGate.asm"

INCLUDE "data/maps/headers/Route2Gate.asm"
INCLUDE "scripts/Route2Gate.asm"
INCLUDE "data/maps/objects/Route2Gate.asm"

INCLUDE "data/maps/headers/ViridianForestSouthGate.asm"
INCLUDE "scripts/ViridianForestSouthGate.asm"
INCLUDE "data/maps/objects/ViridianForestSouthGate.asm"

INCLUDE "data/maps/headers/UndergroundPathRoute5.asm"
INCLUDE "scripts/UndergroundPathRoute5.asm"
INCLUDE "data/maps/objects/UndergroundPathRoute5.asm"

INCLUDE "data/maps/headers/UndergroundPathRoute6.asm"
INCLUDE "scripts/UndergroundPathRoute6.asm"
INCLUDE "data/maps/objects/UndergroundPathRoute6.asm"

INCLUDE "data/maps/headers/UndergroundPathRoute7.asm"
INCLUDE "scripts/UndergroundPathRoute7.asm"
INCLUDE "data/maps/objects/UndergroundPathRoute7.asm"

INCLUDE "data/maps/headers/UndergroundPathRoute7Copy.asm"
INCLUDE "scripts/UndergroundPathRoute7Copy.asm"
INCLUDE "data/maps/objects/UndergroundPathRoute7Copy.asm"

INCLUDE "data/maps/headers/SilphCo9F.asm"
INCLUDE "scripts/SilphCo9F.asm"
INCLUDE "data/maps/objects/SilphCo9F.asm"
SilphCo9F_Blocks: INCBIN "maps/SilphCo9F.blk"

INCLUDE "data/maps/headers/VictoryRoad1F.asm"
INCLUDE "scripts/VictoryRoad1F.asm"
INCLUDE "data/maps/objects/VictoryRoad1F.asm"
VictoryRoad1F_Blocks: INCBIN "maps/VictoryRoad1F.blk"


SECTION "Maps 17", ROMX

ViridianForest_Blocks: INCBIN "maps/ViridianForest.blk"
UndergroundPathNorthSouth_Blocks: INCBIN "maps/UndergroundPathNorthSouth.blk"
UndergroundPathWestEast_Blocks: INCBIN "maps/UndergroundPathWestEast.blk"

	INCBIN "maps/UnusedDiglettsCaveCopy.blk"

SSAnneB1FRooms_Blocks:
SSAnne2FRooms_Blocks: INCBIN "maps/SSAnne2FRooms.blk"

INCLUDE "data/maps/headers/PokemonTower1F.asm"
INCLUDE "scripts/PokemonTower1F.asm"
INCLUDE "data/maps/objects/PokemonTower1F.asm"
PokemonTower1F_Blocks: INCBIN "maps/PokemonTower1F.blk"

INCLUDE "data/maps/headers/PokemonTower2F.asm"
INCLUDE "scripts/PokemonTower2F.asm"
INCLUDE "data/maps/objects/PokemonTower2F.asm"
PokemonTower2F_Blocks: INCBIN "maps/PokemonTower2F.blk"

INCLUDE "data/maps/headers/PokemonTower3F.asm"
INCLUDE "scripts/PokemonTower3F.asm"
INCLUDE "data/maps/objects/PokemonTower3F.asm"
PokemonTower3F_Blocks: INCBIN "maps/PokemonTower3F.blk"

INCLUDE "data/maps/headers/PokemonTower4F.asm"
INCLUDE "scripts/PokemonTower4F.asm"
INCLUDE "data/maps/objects/PokemonTower4F.asm"
PokemonTower4F_Blocks: INCBIN "maps/PokemonTower4F.blk"

INCLUDE "data/maps/headers/PokemonTower5F.asm"
INCLUDE "scripts/PokemonTower5F.asm"
INCLUDE "data/maps/objects/PokemonTower5F.asm"
PokemonTower5F_Blocks: INCBIN "maps/PokemonTower5F.blk"

INCLUDE "data/maps/headers/PokemonTower6F.asm"
INCLUDE "scripts/PokemonTower6F.asm"
INCLUDE "data/maps/objects/PokemonTower6F.asm"
PokemonTower6F_Blocks: INCBIN "maps/PokemonTower6F.blk"

	INCBIN "maps/UnusedEmptyMap.blk"

INCLUDE "data/maps/headers/PokemonTower7F.asm"
INCLUDE "scripts/PokemonTower7F.asm"
INCLUDE "data/maps/objects/PokemonTower7F.asm"
PokemonTower7F_Blocks: INCBIN "maps/PokemonTower7F.blk"

INCLUDE "data/maps/headers/CeladonMart1F.asm"
INCLUDE "scripts/CeladonMart1F.asm"
INCLUDE "data/maps/objects/CeladonMart1F.asm"
CeladonMart1F_Blocks: INCBIN "maps/CeladonMart1F.blk"


SECTION "Maps 18", ROMX

INCLUDE "data/maps/headers/ViridianForest.asm"
INCLUDE "scripts/ViridianForest.asm"
INCLUDE "data/maps/objects/ViridianForest.asm"

INCLUDE "data/maps/headers/SSAnne1F.asm"
INCLUDE "scripts/SSAnne1F.asm"
INCLUDE "data/maps/objects/SSAnne1F.asm"
SSAnne1F_Blocks: INCBIN "maps/SSAnne1F.blk"

INCLUDE "data/maps/headers/SSAnne2F.asm"
INCLUDE "scripts/SSAnne2F.asm"
INCLUDE "data/maps/objects/SSAnne2F.asm"
SSAnne2F_Blocks: INCBIN "maps/SSAnne2F.blk"

INCLUDE "data/maps/headers/SSAnneB1F.asm"
INCLUDE "scripts/SSAnneB1F.asm"
INCLUDE "data/maps/objects/SSAnneB1F.asm"
SSAnneB1F_Blocks: INCBIN "maps/SSAnneB1F.blk"

INCLUDE "data/maps/headers/SSAnneBow.asm"
INCLUDE "scripts/SSAnneBow.asm"
INCLUDE "data/maps/objects/SSAnneBow.asm"
SSAnneBow_Blocks: INCBIN "maps/SSAnneBow.blk"

INCLUDE "data/maps/headers/SSAnneKitchen.asm"
INCLUDE "scripts/SSAnneKitchen.asm"
INCLUDE "data/maps/objects/SSAnneKitchen.asm"
SSAnneKitchen_Blocks: INCBIN "maps/SSAnneKitchen.blk"

INCLUDE "data/maps/headers/SSAnneCaptainsRoom.asm"
INCLUDE "scripts/SSAnneCaptainsRoom.asm"
INCLUDE "data/maps/objects/SSAnneCaptainsRoom.asm"
SSAnneCaptainsRoom_Blocks: INCBIN "maps/SSAnneCaptainsRoom.blk"

INCLUDE "data/maps/headers/SSAnne1FRooms.asm"
INCLUDE "scripts/SSAnne1FRooms.asm"
INCLUDE "data/maps/objects/SSAnne1FRooms.asm"
SSAnne1FRooms_Blocks: INCBIN "maps/SSAnne1FRooms.blk"

INCLUDE "data/maps/headers/SSAnne2FRooms.asm"
INCLUDE "scripts/SSAnne2FRooms.asm"
INCLUDE "data/maps/objects/SSAnne2FRooms.asm"

INCLUDE "data/maps/headers/SSAnneB1FRooms.asm"
INCLUDE "scripts/SSAnneB1FRooms.asm"
INCLUDE "data/maps/objects/SSAnneB1FRooms.asm"

INCLUDE "data/maps/headers/UndergroundPathNorthSouth.asm"
INCLUDE "scripts/UndergroundPathNorthSouth.asm"
INCLUDE "data/maps/objects/UndergroundPathNorthSouth.asm"

INCLUDE "data/maps/headers/UndergroundPathWestEast.asm"
INCLUDE "scripts/UndergroundPathWestEast.asm"
INCLUDE "data/maps/objects/UndergroundPathWestEast.asm"

INCLUDE "data/maps/headers/DiglettsCave.asm"
INCLUDE "scripts/DiglettsCave.asm"
INCLUDE "data/maps/objects/DiglettsCave.asm"
DiglettsCave_Blocks: INCBIN "maps/DiglettsCave.blk"

INCLUDE "data/maps/headers/SilphCo11F.asm"
INCLUDE "scripts/SilphCo11F.asm"
INCLUDE "data/maps/objects/SilphCo11F.asm"
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

INCLUDE "data/maps/headers/ViridianGym.asm"
INCLUDE "scripts/ViridianGym.asm"
INCLUDE "data/maps/objects/ViridianGym.asm"
ViridianGym_Blocks: INCBIN "maps/ViridianGym.blk"

INCLUDE "data/maps/headers/PewterMart.asm"
INCLUDE "scripts/PewterMart.asm"
INCLUDE "data/maps/objects/PewterMart.asm"

INCLUDE "data/maps/headers/CeruleanCave1F.asm"
INCLUDE "scripts/CeruleanCave1F.asm"
INCLUDE "data/maps/objects/CeruleanCave1F.asm"
CeruleanCave1F_Blocks: INCBIN "maps/CeruleanCave1F.blk"

INCLUDE "data/maps/headers/CeruleanBadgeHouse.asm"
INCLUDE "scripts/CeruleanBadgeHouse.asm"
INCLUDE "data/maps/objects/CeruleanBadgeHouse.asm"


SECTION "Maps 21", ROMX

INCLUDE "data/maps/headers/FuchsiaBillsGrandpasHouse.asm"
INCLUDE "scripts/FuchsiaBillsGrandpasHouse.asm"
INCLUDE "data/maps/objects/FuchsiaBillsGrandpasHouse.asm"

INCLUDE "data/maps/headers/FuchsiaPokecenter.asm"
INCLUDE "scripts/FuchsiaPokecenter.asm"
INCLUDE "data/maps/objects/FuchsiaPokecenter.asm"

INCLUDE "data/maps/headers/WardensHouse.asm"
INCLUDE "scripts/WardensHouse.asm"
INCLUDE "data/maps/objects/WardensHouse.asm"
WardensHouse_Blocks: INCBIN "maps/WardensHouse.blk"

INCLUDE "data/maps/headers/SafariZoneGate.asm"
INCLUDE "scripts/SafariZoneGate.asm"
INCLUDE "data/maps/objects/SafariZoneGate.asm"
SafariZoneGate_Blocks: INCBIN "maps/SafariZoneGate.blk"

INCLUDE "data/maps/headers/FuchsiaGym.asm"
INCLUDE "scripts/FuchsiaGym.asm"
INCLUDE "data/maps/objects/FuchsiaGym.asm"
FuchsiaGym_Blocks: INCBIN "maps/FuchsiaGym.blk"

INCLUDE "data/maps/headers/FuchsiaMeetingRoom.asm"
INCLUDE "scripts/FuchsiaMeetingRoom.asm"
INCLUDE "data/maps/objects/FuchsiaMeetingRoom.asm"
FuchsiaMeetingRoom_Blocks: INCBIN "maps/FuchsiaMeetingRoom.blk"

INCLUDE "data/maps/headers/CinnabarGym.asm"
INCLUDE "scripts/CinnabarGym.asm"
INCLUDE "data/maps/objects/CinnabarGym.asm"
CinnabarGym_Blocks: INCBIN "maps/CinnabarGym.blk"

INCLUDE "data/maps/headers/CinnabarLab.asm"
INCLUDE "scripts/CinnabarLab.asm"
INCLUDE "data/maps/objects/CinnabarLab.asm"
CinnabarLab_Blocks: INCBIN "maps/CinnabarLab.blk"

INCLUDE "data/maps/headers/CinnabarLabTradeRoom.asm"
INCLUDE "scripts/CinnabarLabTradeRoom.asm"
INCLUDE "data/maps/objects/CinnabarLabTradeRoom.asm"
CinnabarLabTradeRoom_Blocks: INCBIN "maps/CinnabarLabTradeRoom.blk"

INCLUDE "data/maps/headers/CinnabarLabMetronomeRoom.asm"
INCLUDE "scripts/CinnabarLabMetronomeRoom.asm"
INCLUDE "data/maps/objects/CinnabarLabMetronomeRoom.asm"
CinnabarLabMetronomeRoom_Blocks: INCBIN "maps/CinnabarLabMetronomeRoom.blk"

INCLUDE "data/maps/headers/CinnabarLabFossilRoom.asm"
INCLUDE "scripts/CinnabarLabFossilRoom.asm"
INCLUDE "data/maps/objects/CinnabarLabFossilRoom.asm"
CinnabarLabFossilRoom_Blocks: INCBIN "maps/CinnabarLabFossilRoom.blk"

INCLUDE "data/maps/headers/CinnabarPokecenter.asm"
INCLUDE "scripts/CinnabarPokecenter.asm"
INCLUDE "data/maps/objects/CinnabarPokecenter.asm"

INCLUDE "data/maps/headers/CinnabarMart.asm"
INCLUDE "scripts/CinnabarMart.asm"
INCLUDE "data/maps/objects/CinnabarMart.asm"

INCLUDE "data/maps/headers/CopycatsHouse1F.asm"
INCLUDE "scripts/CopycatsHouse1F.asm"
INCLUDE "data/maps/objects/CopycatsHouse1F.asm"

INCLUDE "data/maps/headers/ChampionsRoom.asm"
INCLUDE "scripts/ChampionsRoom.asm"
INCLUDE "data/maps/objects/ChampionsRoom.asm"
ChampionsRoom_Blocks: INCBIN "maps/ChampionsRoom.blk"

INCLUDE "data/maps/headers/LoreleisRoom.asm"
INCLUDE "scripts/LoreleisRoom.asm"
INCLUDE "data/maps/objects/LoreleisRoom.asm"
LoreleisRoom_Blocks: INCBIN "maps/LoreleisRoom.blk"

INCLUDE "data/maps/headers/BrunosRoom.asm"
INCLUDE "scripts/BrunosRoom.asm"
INCLUDE "data/maps/objects/BrunosRoom.asm"
BrunosRoom_Blocks: INCBIN "maps/BrunosRoom.blk"

INCLUDE "data/maps/headers/AgathasRoom.asm"
INCLUDE "scripts/AgathasRoom.asm"
INCLUDE "data/maps/objects/AgathasRoom.asm"
AgathasRoom_Blocks: INCBIN "maps/AgathasRoom.blk"
