# Full Features / Bugfixes List

The only version differences between PureRed / PureBlue / PureGreen are visual. Play whatever color you like the most.

## New Options in the Options Menu
Many options have been added to the game's options menu. To be clear, there are **4 pages of options** now. **Use the Next button on the options page** to cycle through the pages when in-game.

You can press SELECT to get an explanation of the current option in any option menu.

The first page contains the original game's options. Text speed has an "Instant" option now, and the "Slow" option is now the original game's "Medium". The game defaults to "Fast" speed. Other than that, the way Battle Style and Battle Animations options work haven't changed.

![Options First Page](/screenshots/options_page_1.png?raw=true) 

The second page contains new big features related to general gameplay. 

![Options Second Page](/screenshots/options_page_2.png?raw=true)
  - The first option, `COLORS` will cycle between color palette options of the game. These only apply if you're playing on a system that supports color, like GBC, GBA, Super Gameboy, etc. Important to note: On Super Gameboy after changing this setting you will need to save and restart the game to apply the change. On GBC and GBA it's instant.
    - `OG`: Default color setting. The game will use whatever colors it originally would have had on the system you're playing on. In the case of GBC or GBA, this is a hardcoded limited dual-color palette. On SGB, this is the default SGB color palettes.
    
    ![Blue Title GBC Default](/screenshots/blue_title_default_gbc_color.png?raw=true) ![Red Title GBC Default](/screenshots/red_title_default_gbc_color.png?raw=true) ![Green Title GBC Default](/screenshots/green_title_default_gbc_color.png?raw=true)
    - `SGB1`: Force SGB color palettes. This is no different than the "OG" setting if playing on SGB. On GBC or GBA, this changes the game to use the same color palettes as on SGB, and enables full color mode. Attack animations will have color in this mode when on GBC or GBA, along with some other color enhancements.
  
    ![Blue Title SGB](/screenshots/blue_title_sgb_colors_on_gbc.png?raw=true) ![Red Title SGB](/screenshots/red_title_sgb_colors_on_gbc.png?raw=true) ![Green Title SGB](/screenshots/green_title_sgb_colors_on_gbc.png?raw=true)
    
    ![Attack Color Fire Blast SGB](/screenshots/attack_color_fire_blast.png?raw=true) ![Attack Color Ice Beam SGB](/screenshots/attack_color_ice_beam.png?raw=true) ![Attack Color Solar Beam SGB](/screenshots/attack_color_solarbeam.png?raw=true) ![Attack Color Surf SGB](/screenshots/attack_color_surf.png?raw=true)
    - `SGB2`: Force alternate SGB color palettes. Access this option by pressing A on SGB1 in this options menu. This is the same as SGB1 with a couple minor differences in colors based on japanese pokemon green. A more greenish white color for all the palettes. Other minor color differences include: Pallet Town is purplish instead of light green. Pewter City, Lavender Town, Celadon City, Saffron City, and Indigo Plateau have slightly different main colors in comparison to SGB1. Other than these slight color differences it is the same as SGB1 in features. 

    ![Blue Title SGB2](/screenshots/blue_title_sgb2_colors_on_gbc.png?raw=true) ![Red Title SGB2](/screenshots/red_title_sgb2_colors_on_gbc.png?raw=true) ![Green Title SGB2](/screenshots/green_title_sgb2_colors_on_gbc.png?raw=true)

    Pictured Below: Left = SGB1, Right = SGB2

    ![sgb1 sgb2 comparison 1](/screenshots/sgb1_sgb2_comparison_pallet.png?raw=true) ![sgb1 sgb2 comparison 2](/screenshots/sgb1_sgb2_comparison_pewter.png?raw=true) ![sgb1 sgb2 comparison 3](/screenshots/sgb1_sgb2_comparison_lavender.png?raw=true) ![sgb1 sgb2 comparison 4](/screenshots/sgb1_sgb2_comparison_saffron.png?raw=true)  ![sgb1 sgb2 comparison 5](/screenshots/sgb1_sgb2_comparison_indigo.png?raw=true)
    - `Y1 or Y2`: Force GBC color palettes. On Super Gameboy, it'll now have Pokemon Yellow's GBC more intense color palettes. Same with GBC and GBA. On GBC and GBA, enables full color mode. Attack animations will have color in this mode when on GBC or GBA, along with some other color enhancements. Y1 are the original palettes for pokemon yellow. Y2 are the same colors as Y1 with reduced intensity, to look like you are playing on an original GBC's screen when you are emulating the game.
    
    ![Blue Title GBC](/screenshots/blue_title_gbc_colors_on_gbc.png?raw=true) ![Red Title GBC](/screenshots/red_title_gbc_colors_on_gbc.png?raw=true) ![Green Title GBC](/screenshots/green_title_gbc_colors_on_gbc.png?raw=true)

    ![Blue Title GBC2](/screenshots/blue_title_y2_colors_on_gbc.png?raw=true) ![Red Title GBC2](/screenshots/red_title_y2_colors_on_gbc.png?raw=true) ![Green Title GBC2](/screenshots/green_title_y2_colors_on_gbc.png?raw=true)
  - The second option, `ALT PKMN COLORS` will enable or disable pokemon from being able to have special color palettes (Default: OFF). When turned on, features related to alternate color pokemon are enabled. In certain regions, you will find differently colored pokemon, like blue nidorinos and purple nidorinas. Think of them as regional color variants. This is just an amusing feature to allow for additional enjoyment in finding unique pokemon by exploring different places.

![Alt Colors Off](/screenshots/alt_pokemon_colors_off.png?raw=true) ![Alt Colors On](/screenshots/alt_pokemon_colors_on.png?raw=true)
  - The third option, `MUSIC` will enable or disable new music tracks in the game. (Default: OG) Set it to OG+ to play new music tracks when they are meant to be played. At the moment it controls only one or two minor tracks, such as Giovanni's Theme. (unused music from Pokemon Yellow's code) More music will likely be added in the future.
  - The fourth option, `AUDIO PAN` will enable or disable stereo audio panning (Default: OFF). The game uses stereo audio by default, but every channel is played at equal volume throughout the right and left speaker, so it sounds like mono. With this turned on the game music sounds a bit more dynamic by panning certain channels to left or right. This was an option in Pokemon Yellow that was ported to this romhack.
  - The fifth option, `BIKE SONG` will enable or disable the music that plays while on the bicycle (Default: ON). Since the bicycle music plays 100% of the time you are using the bicycle, it gets a bit old after a while. If turned off, the only time you'll hear the music is in Cycling Road. This way you can enjoy all the music in the game, not just the bicycle song.
  - The sixth option, `GBC FADE` will enable or disable smoother fade animations on the GBC. (Default: OFF) Fade animations will be a lot smoother in framerate. Like when you enter a building or fly to another town. This feature only works on GBC.



The third page contains settings related to battles. 

![Options Third Page](/screenshots/options_page_3.png?raw=true)
-
  - The first four options, `GHST→PSY`, `ICE→FIRE`, `BUG→PSN`, `PSN→BUG` all control type matchups in the game. The option on the left for these is the original game's type matchup, and the right option is what it was changed to in Gen 2. These options allow you to fine-tune how you want type matchups to behave. The only non-original one is GHSTxPSY, which is set to make Ghost super effective against Psychic by default. In the original game Psychic was immune to Ghost, which the game even tells you isn't supposed to be the case in NPC dialogue.
  - The fifth option, `EXP BAR` enables or disables an experience bar visual in battle. (Default: OFF) This feature allows easier tracking of experience while in battle.
  
   ![Exp bar](screenshots/exp_bar.png?raw=true)
  - The sixth option, `NPC EVs` enables or disables giving opponent trainer pokemon Stat EXP based on their pokemon's level. (Default: OFF) In the original game, they receive 0 stat EXP regardless of the level of their pokemon. This means if the player has a lot of stat EXP, they will totally outclass similar-level trainer pokemon. Turning this feature on will give trainer pokemon stat EXP scaled with their level to a reasonable degree. This makes the game a bit harder but can be fun for more experienced players.
  - The seventh option `NPC PP` enables or disables tracking of PP for opponents. (Default: OFF) In the original game, opponents have infinite PP on their moves. Turning this on means they can run out of PP if they use some moves too many times. Makes the game a bit easier. But it might be good for later on in the game when recovery moves are more common.

The fourth page contains Sprite-related options. 
 
![Options Fourth Page](/screenshots/options_page_4.png?raw=true)
  - The first option, `BACK` changes the back sprites in the game. (Default: OG) There are two possible settings:
    - OG: Use the original blocky back sprites. 
    
    ![Original back sprite venusaur](/gfx/pokemon/back/venusaurb.png?raw=true) ![Original back sprite blastoise](/gfx/pokemon/back/blastoiseb.png?raw=true) ![Original back sprite charizard](/gfx/pokemon/back/charizardb.png?raw=true)
    - SW97: Use the spaceworld 1997 back sprites. (some have been touched up a bit) These are higher resolution while still matching the original game's style. Very nice!
    
    ![Spaceworld back sprite venusaur](/gfx/pokemon/back_sw/venusaurb.png?raw=true) ![Spaceworld back sprite blastoise](/gfx/pokemon/back_sw/blastoiseb.png?raw=true) ![Spaceworld back sprite charizard](/gfx/pokemon/back_sw/charizardb.png?raw=true)
  - The second option, `ICONS` changes the menu icons and overworld sprites in the game. (Default: OG) There are two possible settings:
    - OG: Use the original icons in the overworld and on the pokemon menu.
    - OG+: Use the original icons with some new ones. Some are based on beta sprites, some are completely newly designed sprites with the intention of being similar to the non-specific icon design of the original game, and ONE based on Gen 2's menu sprites (jellyfish sprite). This also will give unique sprites to Brock, Misty, Lt.Surge, Erika, Sabrina, and Blaine. They are all sprites that were designed from scratch to match the game's original trainer sprites, EXCEPT blaine's sprite, which is borrowed from Gen 2.

 ![Menu Icons 1](/gfx/icons/menusprites1.png?raw=true) ![Menu Icons 2](/gfx/icons/menusprites2.png?raw=true)
    ![Brock](/gfx/sprites/brock.png?raw=true) ![Misty](/gfx/sprites/misty.png?raw=true) ![LtSurge](/gfx/sprites/lt_surge.png?raw=true) ![Erika](/gfx/sprites/erika.png?raw=true) ![Sabrina](/gfx/sprites/sabrina.png?raw=true) ![Blaine](/gfx/sprites/blaine.png?raw=true)
  - If you press A on `EDIT` of the 3rd Option, it will open 5 new pages on another level. These 5 pages are for customizing the front sprites of the game. 

![Front Sprite Options 1](/screenshots/front_sprite_options1.png?raw=true)
![Front Sprite Options 2](/screenshots/front_sprite_options2.png?raw=true)
![Front Sprite Options 3](/screenshots/front_sprite_options3.png?raw=true)
![Front Sprite Options 4](/screenshots/front_sprite_options4.png?raw=true)
![Front Sprite Options 4](/screenshots/front_sprite_options5.png?raw=true)

  You can customize the below sprites:

![front_sprite_options](/gfx/pokemon/gallery/front_sprite_options.png?raw=true)

## Quality of Life Enhancements
- Stone evos and trade evos have full movesets
- Trade evos evolve at level 37
- The overworld runs at a smoother framerate.
- TMs are all useful attacks
- Level up movesets vastly improved for all pokemon
- Bag size increased to 30 up from 20
- PC item space increase to 60 up from 50
- You can deposit items to your PC directly from the items menu by pressing START on the item you wish to deposit. Technology is amazing! Now items can be stored wirelessly!

![Deposit Item From Start Menu](/screenshots/deposit_item_from_menu.png?raw=true)
- Open the start menu and scroll down to SAVE, then press SELECT, and you can change PC boxes whenever, wherever. Easy! You'll notice the Change Box menu has been revamped to include how many pokemon are in each box as well!

![Box change](/screenshots/change_box_from_start_menu.png?raw=true)
- When viewing Bills PC, it'll always tell you how many pokemon are in the current box
- The responsiveness of Bills PC and Player's PC was improved. It'll also kick you out of its menus less.
- The game will tell you how many slots are left in your box after catching a pokemon, and when the box is full.
- When scrolling over TMs/HMs in menus, a textbox will display the move they teach automatically! Hooray!

![TM Text](/screenshots/tm_text_box_prompt.png?raw=true)
- On any list that has scrolling (items menu, PC menus, elevator menus, etc.) you can skip to the bottom of the list from the top of the list and vice-versa by pressing LEFT on the D-PAD. Very convenient!
- You can increase/decrease item buy/sell amounts by a factor of 10 by pressing left and right in the menu when choosing the amount.
- Most menus will be better at remembering your place in the list when you do certain actions
- After fishing, the game will remember you just used a fishing rod and will save your menu position to easily re-use it.
- Itemfinder will turn you to face the direction of the item when one is nearby.
- Low health alarm plays 3 times then stops instead of ringing incessantly in battles when you're at low health.
- Save speed increased
- TELEPORT is usable inside caves and buildings
- An item that allows you to TELEPORT without the need for a pokemon with the move TELEPORT in your party is now in the game. You can obtain it within Pewter City.
- Press SELECT in the overworld to use the bicycle if it's in your bag. After seeing "You got on your bicycle" and "You got off your bicycle" text once, getting on and off will be instant.
- Run by holding the B button. Speed up the bicycle by holding the B button. Your animation speed increases to match your faster movement too.
- The Bicycle is usable inside gates
- Stop, then hold B+A at the same time. When you're holding both buttons, you can now turn around without moving in any direction. 
- Fly is usable in places where you should be able to use it but weren't able to for some reason (Viridian forest, Safari Zone, Celadon Mart roof, Celadon Mansion roof)
- The Name Rater will always be willing to rename pokemon, regardless of if you received them via trading. Is he going soft?
- When selecting where to Fly to on the map, there is no longer needless forced delay between each selection.
- The game now always reports the correct "Super Effective!" "Not Very Effective" etc. message when battling. No more tricks!
- HMs are deletable. Deleting them in the wrong place shouldn't get you softlocked ever, code was introduced to avoid this.
- When teaching a move via TM, there is less text to mash through.
- When a pokemon tries to learn a new move, you can permanently skip the "X already has 4 moves, forget one to learn a new one?" question by selecting "HIDE" instead of "YES" or "NO".
- When teaching a pokemon a move and selecting a move to forget, you must press START to select the move to forget instead of A. Now you won't accidentally select the wrong one disastrously!
- When releasing a pokemon, you must press START to confirm releasing it. Helps avoid accidentally releasing pokemon.
- Spin tiles in rocket hideout and viridian gym move you much faster
- "Use another repel" menu implemented.
- New info in the pokedex: The pokedex displays the typing of pokemon you have seen, and typing/base stats of pokemon you have caught

![Pokedex Base Stats](/screenshots/pokedex_base_stats_typing.png?raw=true)
- You can press SELECT to view back sprites of pokemon you have caught in the pokedex when viewing their pokedex data.
- When doing the Cinnabar Gym quiz, it won't keep explaining the quiz every time you start it up.
- Coin Case doesn't take up space in your bag. Go to the game corner if you need to check how many coins you have.
- Secret Key, Card Key, and Lift Key are consumed when you no-longer need them. Less item clutter.
- The SS Anne Captain will make sure you don't need the SS Ticket anymore to get into the SS Anne area after you help him.
- After saving Mr.Fuji, A Channeler on the 2nd floor of pokemon tower wants to borrow your SILPH SCOPE. They'll give it back when you ask. You can store it there so you don't need to take up space in your bag or PC.
- Town Map does not take up space in your bag. To check it, go to your pokedex and press SELECT. (You still must obtain it in Pallet Town to use this feature.)
- Fishing animation is a bit shorter in general
- Fishing has a straight 75% rate of landing a pokemon
- You can buy drinks in bulk from Celadon Diner after giving a drink to one of the Saffron guards.
- 500 coins can be bought for 8000 pokedollars repeatedly at the game corner.
- Slot machines won't cheat you out of lining up symbols based on RNG anymore.
- Slot machine payout amounts increased.
- Slot machine payout speed increased.
- After using Surf, it will be remembered until the next map load. You can just walk onto water and start surfing without doing anything or even having to press A.
- Strength can be used on boulders by pressing A on them while you have a pokemon with strength in your party.
- Seafoam Islands and Victory Road will remember that you used Strength between going up and down floors so you don't have to re-enable it.
- Seafoam Islands, Cerulean Cave, and the Safari Zone will remember you used Surf between going between map areas so you don't have to repeatedly use it.
- Fuchsia City's layout has been modified very slightly to be less annoying to navigate.
- The Daycare has a PC in it.
- Route 23 has some grass just after the north exit of Victory Road to allow reaching those encounters more easily late game. The pokemon here will give full EXP unlike all other wild pokemon so it's a good place to train.
- Elevators will tell you when you select the floor you're already on.
- Some pokemon evolve at earlier levels
- Many pokemon have better base stats. You can view base stats by checking the pokedex entry after catching the pokemon. Or, see the wiki for the full data.
- Many pokemon have better learnsets than before. See the wiki for the data.
- You can use the itemfinder in the GAME CORNER to detect hidden coins now.
- A Save file updater was implemented, allowing you to transfer your save from the original game to work with PureRGB. Just open the original save file on PureRGB and the game will ask whether to update it.
- Press SELECT while on the WITHDRAW option of the PC. You can view the pokemon in the box even if your party is full by doing this.

## New Gameplay Features
- Mew is under the truck!!! Use strength on it from the right side. If the SS Anne has left, it returns after obtaining the Soul Badge.
- Missingno and the item duplication glitch are still accessible. Missingno can be caught and won't corrupt your game data in any way. It's very powerful, so be careful when trying to catch it! Missingno also randomly displays different sprites like its original "glitchy" sprite, the Ghost sprite or Fossil Kabutops/Aerodactyl each time its sprite is loaded.

 ![Missingno](/screenshots/missingno.png?raw=true)

- And entirely new pokedex mode has been added. It's called the MOVEDEX. This tracks every move you have seen the animation of in battle, and will list all their information and data in detail for you to see. Try to complete your MOVEDEX! The movedex is unlocked in a new basement classroom of the schoolhouse in Viridian City. You can switch the sorting mode of the movedex from ID to alphabetical with SELECT while viewing the movedex.

![movedex](/screenshots/movedex.png?raw=true) ![movedex thunderbolt](/screenshots/movedex_thunderbolt.png?raw=true) ![movedex flamethrower](/screenshots/movedex_flamethrower.png?raw=true) ![movedex surf](/screenshots/movedex_surf.png?raw=true) ![movedex eq](/screenshots/movedex_earthquake.png?raw=true)
 
- Ghost Marowak can be caught, and if you have Alt Pkmn Palettes turned on, it has a special ghostly coloration. It wants revenge on Team Rocket! Mr Fuji will react differently to being saved if you caught it.

- The Safari Zone now has 3 different "Modes" of Safari Game. They are:
  - `CLASSIC`: the original game's "Safari Game".  Use bait and rocks instead of your well-trained pokemon to try to catch wild pokemon with Safari Balls. The only change to this mode is that you have 700 steps instead of 500.
  - `FREE ROAM`: Bring your pokemon into the Safari Zone and catch and battle pokemon like you would normally. Also, no limit on steps! On top of that, now there are trainers ready to battle all over the Safari Zone? This is great! The trainers will reset when you re-enter, allowing you to repeatedly battle them.
  - `RANGER HUNT`: now we're talking. Find the 5 rangers and defeat them before you run out of steps! You get a special prize if you do! Bring in your pokemon just like FREE ROAM mode, but you only have 700 steps to find and beat all 5 rangers! All the trainers from Free Roam mode are present too. This is the ultimate Safari Zone challenge! The reward is a new type of Poke Ball, the HYPER BALL, which never fails to catch pokemon if they are <1/3 health. Even legendary pokemon! This challenge can be repeated.
  
   ![Safari Zone Modes](/screenshots/safari_zone_modes.png?raw=true) ![Safari Zone Trainers](/screenshots/safari_zone_ranger_hunt.png?raw=true) 

- New Items:
  - `POCKET ABRA`: It's an Abra that fits in your bag. A pocket pokemon! Isn't that redundant?...It allows you to teleport whenever you want, even in buildings or caves, back to the last pokemon center. Keep it on hand at all times for maximum convenience. You can nickname it even!
  - `BOOSTER CHIP`: Replaces `EXP.ALL` - Oak's aide on Route 15 will give you this if you catch at least 80 pokemon. When you install it to your pokeball belt, all your pokemon will gain boosted EXP as if they were traded pokemon! Great for training up pokemon when you're trying to catch them all.
  - `APEX CHIP`: The Gym Guide's creation! It maximizes DVs (also known as IVs) when installed. The Gym Guide will give you 2 of them after you beat each gym leader. Inside a pokemon's pokeball, this chip will simulate their natural habitat, helping them be happy and achieve their maximum potential! It'll indicate if DVs are maxed out on the status screen too.
  - `HYPER BALL`: As discussed above, a new type of Poke Ball that never fails to catch pokemon if they're below 1/3 health. For many non-legendary pokemon, it will never fail even at full health! You might want to save these for legendaries because they're a bit hard to come by.
 
- An entirely new area was added in Indigo Plateau. After becoming champ you can talk to the woman in the top left of the indigo plateau lobby to enter the Champ Arena. In the Champ Arena you can battle all the gym leaders and elite four in rematches. Also some fun animations and sequences while doing it. Opponents in the Champ Arena have perfect IVs...so make sure to use APEX CHIPs on all your team! They also have custom movesets for all their pokemon, and the highest level of AI, so be ready. You can choose from many different audio tracks to play while battling all these opponents. Initially you face the opponents in a set order. After defeating all of them you can choose who you battle. They will be even stronger the second time you fight them!

   ![Champ Arena](/screenshots/champ_arena.png?raw=true)

- The "TM Pirate" is a kid who appears in most PokeMarts who will sell you TMs! It's just a fun way of adding more purchasable TMs to the game.

- A new area based on pre-release "Moltres dungeon" data was added to the game on the sea route between Pallet Town and Cinnabar Island. Cinnabar Volcano! You can catch Moltres earlier in the game here. You can also turn this area off entirely if you don't want it by going to Your PC and turning it off in the WORLD OPTIONS menu. Explore a new volcano area with lots of new visuals. You can upgrade your MAGMAR here with the power of the volcano!

![volcano](/screenshots/volcano.png?raw=true) ![world options](/screenshots/world_options.png?raw=true)

- The Power Plant has been enhanced visually with a beta tileset from Spaceworld 1997. Now it also has a bit more of a puzzle. You must press a bunch of buttons to unlock electrical gates, which allow you to reach the end of the area. It also has a roof area, and a secret area where your MAGNETON can be powered up!

![power plant](/screenshots/power_plant.png?raw=true) ![power plant2](/screenshots/power_plant2.png?raw=true)

- The urban legend - Bills Garden - was added into the game! It only is accessible once you become champ. You'll find some amusing stuff there. Visit it a couple of times! What you find might change! If you have alt palettes turned on in the options...is that a blue pikachu??

![bills garden](/screenshots/bills_garden.png?raw=true)

- The Mt Moon fossil Super Nerd will offer to take your fossil to Cinnabar Lab right away! You have to meet up with him at his house in SAFFRON CITY to get your fossil pokemon if you give it to him. Then you can give him OLD AMBER too. This allows you to receive fossil pokemon early.

![Super Nerd House in Saffron](/screenshots/super_nerd_in_saffron_city.png?raw=true)
- You can obtain the fossil that you didn't choose in Mt.Moon hidden inside Seafoam Islands.

- Erik and Sara are characters in the original game who were looking for each other in Fuchsia City. Help them find each other to find out all about them, and visit their house on the sea route south of Fuchsia (Route 19) after! Upgrade your DRAGONAIR by following their scuba diving adventure. This house on route 19 was based on beta content showing a house on an island on route 21.

![erik and sara](/screenshots/erik_and_sara.png?raw=true)

- In Celadon City there is an NPC in the Hotel who will give you LAPRAS early after clearing Rocket Hideout. It's the same guy who gives you it in Silph Co on a business trip. He ends up stuck in Silph Co later on as expected! If you don't get LAPRAS early you can still get it the original way.

- In Fuchsia City there is an NPC who will permanently remove CUT trees for a fee. Remove all the trees in Fuchsia City, the one blocking Route 9, and more!

![Tree Deleter](/screenshots/tree_deleter.png?raw=true)
- If you have Alt Palette Pkmn option turned on, at the Cinnabar Lab there is an NPC who will allow you to swap the color palette of your pokemon for its alternate palette. You have a limited number of color change usages!

 ![Lab color changer NPC](/screenshots/color_changer_npc.png?raw=true)

- Past the first guard in indigo plateau you can find a door to a guy's house who lives on Route 23. He can change Pokemon typings back to their original ones if you want. You can choose exactly which pokemon use their new typings or original typings.

 ![Type Guys House](/screenshots/type_guys_house.png?raw=true)
 
- A new area was added in the basement of the Viridian Schoolhouse. Acts as a sort of help area in the early game, with more info about basic stuff in the game like stats, type matchups, STAB, etc. It's also where you unlock the MOVEDEX feature.

![schoolhouse basement](/screenshots/new_school_basement.png?raw=true)

- The FISHING GURU now lives in cerulean city and you can get the OLD ROD a bit earlier. Same with the GOOD ROD, which is now in the old FISHING GURU's house in vermilion city. As for the last two gurus on Route 12 and in Fuchsia city, whoever you meet first will give you a SUPER ROD. The other will be a bit distraught at the unexpected turn of events, and then give you a FISHING GUIDE. This unlocks the ability to see fishing locations for pokemon in the pokedex.

![Fishing locations good rod](/screenshots/areas_good_rod.png?raw=true) ![Fishing Locations old rod](/screenshots/areas_old_rod.png?raw=true) ![Fishing locations super rod](/screenshots/areas_super_rod.png?raw=true)

- You can phone home, professor oak, even your rival from the telephones in Celadon City's Department Store. You can choose how the conversations play out, and they even can have some subsequent small events based on what you choose when you go back to PALLET TOWN!

![phone tree 1](/screenshots/phone1.png?raw=true)
![phone tree 2](/screenshots/phone2.png?raw=true)

- After saving Mr.Fuji in the Pokemon Tower, you can get into the basement of the Tower. You'll find a Channeler clothed in black who just loves curses, hexes, and all that dark stuff. If you show them a GENGAR, they'll curse it to look like a HAUNTER again. Its stats won't be affected though. It'll still have GENGAR's stats. Such a powerful curse!

![dark channeler](/screenshots/dark_channeler.png?raw=true)

- After beating GIOVANNI in VIRIDIAN GYM, if you caught GHOST MAROWAK, you can lay it to rest in the basement of Pokemon Tower! A touching reunion with CUBONE and some spooky pokemon spirits to fight on the way.

![ghost marowak area](/screenshots/ghost_marowak_area.png?raw=true)

- On Route 8 you can find a new small cave housing a prospector digging for diamonds. If you help him, he will enhance your ONIX to be stronger. Its base stats will be boosted and it will take less damage from WATER, ICE, and GRASS type moves.

![diamond mine](/screenshots/diamond_mine.png?raw=true)

- After helping the prospector, you can find him at his house in Celadon. If you talk to him there after obtaining HM02, he will teach you how to use DIG to go between towns similar to the way you do with FLY. (Unlike FLY, DIG cannot be used while surfing, or on a dock above water.)

![prospectors house](/screenshots/prospector's_house.png?raw=true) 

- A secret area in Saffron City can be found near SILPH CO. This is where TEAM ROCKET snuck into the city undetected! So that's how they got there...in this area you can upgrade your WEEZING!

![saffron abandoned building](/screenshots/saffron_abandoned_building.png?raw=true)

- The MOVE MYSTIC in Saffron City can tell you all about new SIGNATURE MOVES that some pokemon have. They get bonus power or accuracy on specific moves.

![move mystic](/screenshots/move_mystic.png?raw=true)

- You can now eat food on the SS Anne to heal your pokemon while on it.

- A secret stairway opens up in a building somewhere after you become champ. The last in-game trade and some interesting stuff to see is in there. 

- The above secret area will help you access an even more top secret area. This area involves MEWTWO. You may want to bring MEWTWO with you. Maybe even MEW too! What you may find will be interesting.

- A couple of items or TRAINER TIPS signs have been added to otherwise empty places in the overworld.
- A couple of new hidden items were added to various areas in the game.
- Multiple items can be picked up at once (example: you found 5 potions)

- Donate some money to the rock tunnel pokemon center to hear the secret of the pokemon centers: holding B before talking to the nurse will give you very express service!
- Someone will sell every single TM after becoming champ.

- Rare candies can be purchased after becoming champ, but you must do a bit of sleuthing to find out how.
- The two extra viridian forest trainers from Yellow were added in to make it a bit less empty

## Restored Cut Content

- If you turn on OG+ Music mode, the cut content Giovanni theme will play when you encounter Giovanni
- There is unused text in the game for when you lose to your rival - these were re-implemented and now work as expected!
- There was an unused trainer class for Prof Oak. It's been added back into the game. Find him in Cerulean Cave after beating the Elite Four. He can be battled repeatedly. Just leave the area and come back.
- Some trainer classes based on Beta or unused sprites were reintroduced to the game: `ROOKIE`, `RANGER`, `FIREFIGHTER`, `COOL KID`, `SOLDIER`, `CHIEF`. You'll find them in previously empty places or routes!

![Rookie](/gfx/unused_prototype_sprites/rookie.png?raw=true) ![Ranger](/gfx/unused_prototype_sprites/ranger.png?raw=true) ![Firefighter](/gfx/unused_prototype_sprites/firefighter.png?raw=true) ![Cool Kid](/gfx/unused_prototype_sprites/cool_kid.png?raw=true) ![Soldier](/gfx/unused_prototype_sprites/soldier.png?raw=true) ![Chief](/gfx/unused_prototype_sprites/chief.png?raw=true)

- There were unused icy-looking tiles in the Cave tileset that were meant to be used in seafoam island. Now they are used there!
![seafoam cut tiles](/screenshots/seafoam_islands_cut_content_tiles.png?raw=true)
- Some unused trainers from existing classes were added into the game in various originally empty places
- The new tileset in the POWER PLANT is based on cut content from Spaceworld 97.
- Erik and Sara's house on route 19 was inspired by a house showing on earlier builds of the game on route 21.
- Cinnabar Volcano as an area was inspired by an unused map called MOLTRES in earlier builds of the game.
- You can enable and disable a cut content "Rainbow Palette" for Celadon City by talking to the "Celadon City - City of Rainbow Dreams" sign.

## Visual changes
- Burn status has a burn animation instead of reusing the poison animation.
- Pokeballs have varying animations slightly based on the type you use. Master Ball is especially cool!
- If playing on GBC/GBA and have selected `SGB1`, `SGB2` or `GBC` in the options menu for the `COLORS` option, move animations will have fitting colors (ember is red, surf is blue, etc.).
- If playing on GBC/GBA and have selected `SGB1`, `SGB2` or `GBC` in the options menu for the `COLORS` option, each type of pokeball will have a different coloration.

![Pokeball Color](/screenshots/great_ball_color.png?raw=true)
- Many move animations were enhanced.
- FLY's overworld animation has a higher framerate and looks a lot smoother.
- A new animation was added for when you use DIG in the overworld.
- The game supports smoother fading when doing fade animations if you turn on GBC FADE in the options. This option only works on GBC.
- Using SGB1 colors, pewter's palette is slightly greyer than the original game.
- Using any of SGB1, SGB2, or GBC colors, seafoam island is bluish purple instead of the same color as every other cave in the game.
- Using any of SGB1, SGB2, or GBC colors, the Power Plant is a pale color instead of the same green + blue color as every grass route in the game.
- Using SGB1 or SGB2 colors, lorelei's room is a similar color to seafoam islands (it was the same color as Pallet Town previously).
- Using GBC color mode, the "Grey pokemon" palette was made less brown.
- Spaceworld backsprites were tweaked to improve them a bit
- A couple of front sprites were tweaked very slightly to improve their appearance
- Some pokemon had their default color palette adjusted (example: Voltorb and Electrode are red instead of the original yellow. Don't ask me why they were yellow in the first place)
- You can see "the side of the building" visually from Celadon Department Store roof and Celadon Mansion roof.
- Elevators will shake for longer or shorter depending on how far away the floor you selected was.
- A little animation plays when you push a boulder onto a switch in Victory Road.
- A little animation plays when you use FLASH to light up Rock Tunnel.
- The power plant uses a new tileset based on a beta tileset from Spaceworld 97 that was intended for the power plant.
- When you engage static pokemon (Articuno/Moltres/Zapdos/Mewtwo/Snorlax) a special animation will play for each before battle starts.
- If you turn on OG+ Icons mode, in diglett's cave you will see DIGLETTs popping up and down visually and hiding from you.
- If you're playing on SGB or GBC, talking to the "Saffron City - City of Rainbow Dreams" sign will switch between a special Rainbow palette (unused code from the original game) and the original palette.
- Using a poke doll in battle will have a little animation now.
- In seafoam islands, you can see the water currents moving visually.

![Seafoam Currents](/screenshots/seafoam_currents.png?raw=true)


## Bugfixes
- High Jump Kick / Jump Kick crash damage on missing does more damage instead of 1 damage always now. (1/4 the damage of what it would have done to the opponent)
- Focus Energy actually works as intended now (multiplies critical hit rate by 4 instead of dividing it by 4)
- Badge boosts aren't repeatedly applied to every stat when you use or are afflicted by a stat modifier move.
- Speed decrease / Attack decrease caused by paralysis and burn statuses aren't repeatedly applied on being hit by or using a stat modifier move.
- After healing Paralysis/Burn with an item, speed or attack stats will be correctly reset to their original values
- Nidorino's cry plays correctly in Oak's introduction instead of nidorina's
- Healing moves like Recover won't fail incorrectly when restoring exactly 255 HP.
- The evolution stone item bypass glitch was removed - you must use evolution stones to evolve stone evolution pokemon.
- Skipping a level due to gaining a lot of experience won't skip the move you could have learned on the skipped level anymore
- Learning moves after evolution works correctly now.
- Eevee will always learn a type-specific move on evolution regardless of the level it is evolved at
- Cap light screen / reflect stat boosts to 999 to prevent overflows
- LT Surge says the Thunderbadge boosts speed, but in the code it actually boosted defence. Now it boosts speed as text indicated.
- Koga says the Soulbadge boosts defense, but in the code it actually boosted speed. Now it boosts defense as the text indicated.
- When learning a new move in battle, the "Poof!" sound effect didn't work correctly and would play a random sound instead. Now it works.
- While transformed into another pokemon via TRANSFORM, you cannot swap your move positions anymore - allowing this caused glitches that end with the game crashing
- NPCs won't rarely disobey their facing behavioural assignments (facing forward, left, etc.)
- Double Edge animation appearance when opponent uses it fixed
- Blacking out in the Safari Zone won't glitch the game out
- Trying to switch to the current pokemon or a fainted one won't trigger a small visual glitch
- A small collision detection bug in cerulean cave was fixed
- Lagginess caused by tile block replacements when loading a map was reduced greatly
- Sound effects during text will play properly now when you have instant text setting turned on
- You won't occasionally see a tile block being replaced visually on loading a map anymore
- Using substitute with exactly the right health to use substitute won't cause your pokemon to faint. Instead you will have 1HP left.
- The screen won't flash white for 1 frame on entering a battle or a building on original gameboy or on GBC.
- Pokeflute will correctly detect sleeping wild pokemon when used in battle.
- On original gameboy, while scrolling the trainer pics across at the start of the battle, they will be silhouettes like on SGB or GBC.
- Route 17 sign can now be read from below.
- Can't get blocked by the burglar on Pokemon Mansion 3F
- If all your pokemon are fainted except for the current one, SHIFT mode won't ask you if you want to switch pokemon before the opponent sends out their next pokemon.
- The LAPRAS npc in the fuchsia city zoo can now swim around its enclosure like it was coded to be able to.
- Trapping moves won't erroneously still do ongoing damage to pokemon who are immune. Example: Wrap on a ghost pokemon.
- In the original game if you or your opponent hurts theirself in confusion or is fully paralyzed while digging or flying, the pokemon will be stuck in an invulnerable state, making all attacks miss. This was fixed so it doesn't happen in link battles, and in normal gameplay, doesn't happen to enemy pokemon. But since it's a funny bug, it can still happen to the player - you will become invulnerable if this bug happens to you.
- In the original game, if your opponent used minimize or substitute, you opened your FIGHT menu, exited, went to PARTY, looked at a pokemon's status menu, then returned to the fight, the opponent's sprite would be all messed up. Now it's fixed and doesn't do that.
- Doing the same thing as the above on unidentified GHOSTS would reveal what pokemon they are. Now it doesn't.
- After saving in rock tunnel, going title screen -> continue screen -> title screen -> continue screen will cause the continue screen to take on darker colors. Now it stays normal colors.

## Tweaks
- Trainers in general have a bit less type-specific parties and more varied pokemon. 
- Gym leaders teams are still type specific but might have 1 or two new/different pokemon.
- Your rival uses various teams throughout the game but keeps his starter pokemon.
- 1 of each elemental stone is hidden before rock tunnel
- Potion heals 50HP
- Super Potion heals 100HP
- HMs don't prevent a pokemon from being put into the daycare
- Saffron City is after Celadon City in the "Fly order" instead of after indigo plateau for some reason
- The vermilion gym puzzle won't reset if you choose the wrong second switch. RNG time waster be gone!
- The "teleport" flag is set when you fly to a city or enter a pokemon center.
- Moved the cut tree on route 9 to the right slightly to allow tree clearing code to run instantly on transitioning to that route instead of while you are looking at the cut tree.
- Moved the ridge below the daycare down a block to prevent accidentally jumping off of it
- OLD ROD can catch goldeen as well as magikarp now
- GOOD ROD can catch a bunch of water pokemon, what you get depends on if you fish in the sea or in a pond/lake.
- SUPER ROD can catch higher level pokemon - or if you have the feature enabled, is the only way to catch specific alternate palette water pokemon in specific places! Time to hunt for a blue goldeen!
- Vitamins like HP Up are about 3 times as effective
- PP Up maxes out PP for a move in one usage
- Snorlax, Slowpoke, and Slowbro move slowly in the party menu regardless of their HP level
- Lance will now turn to face you when you are about to fight him, and you will turn to face him.
- Coastal water tiles will now load water encounters EXCEPT on route 20 to facilitate the original Missingno Encounter method.
- The "star shaped grass" tile in viridian forest and the safari zone now loads encounters correctly.
- Every badge will raise the level traded pokemon will obey you by 10 up until the marshbadge, instead of by 20 levels every 2 badges. The badge explanation text is unchanged, however. This is just for easier usage of in-game traded pokemon during a normal playthrough.
- Unused text about Porygon was added to the computer monitor on Silph Co 11F.
- New text entries were added to objects where there was previously either nothing at all or generic reused text in some cases. (Example: some trash cans in peoples house's now have unique text)
- You can use a larger variation of characters in pokemon/player nicknames.
- In the original game, if you open the OPTIONS menu in rock tunnel while it's dark, the menu will also be dark. Now it's normal colors.

## Move changes
- Disable disables the previously selected move of the opponent. If they haven't selected a move yet, it chooses a random move. It has 85% accuracy. It lasts 2-7 turns.
- Trapping moves only last 2 or 3 turns but deal a bit more damage to compensate. 2/3 chance of 2 turns, 1/3 chance of 3 turns.
- 7 moves that people almost never use were renamed and changed to have much more useful effects (mostly based on unused prototype moves):
  - CONSTRICT is now STATIC SNAG - 75 base power, electric type, 30% chance of paralysis, 100% accuracy (Inspired by the unused prototype moves `PARALYZING SCISSORS` and `ELEKITER`)
  - TAKE DOWN is now HEAT RUSH - 75 base power, fire type, 30% chance of burn, 100% accuracy (Inspired by the unused prototype move `MEGA FIRE`)
  - KINESIS is now FIREWALL - 20 base power, fire type, causes burn, 90% accuracy (Inspired by the unused prototype move `F WALL`). If used on a pokemon that is already burned, power increases to 40. If used again after that, power increases to a maximum of 80. If the user is at least level 50, the increases are instead to 80 and 140 power maximum.
  - COUNTER is now DRAIN PUNCH - 75 base power, fighting type, drains HP, 100% accuracy
  - RAZOR WIND is now ROOST - heals 1/2 max HP
  - SLAM is now FILTHY SLAM - 80 base power, poison type, no additional effect, 100% accuracy  (Inspired by the unused prototype move `GASTRO ACID`)
  - FURY SWIPES is now DUST CLAW - 40 base power, ground type, no additional effect, 100% accuracy (early-game ground type move) (Inspired by the numerous cut content physical moves)
- Some moves that were fairly useless were made less useless
  - WHIRLWIND - 110 base power, flying type, 30% chance of confusion, 85% accuracy
  - WITHDRAW - heals around 1/3 max HP and raises DEFENSE. Doesn't do anything if you have full health.
  - GROWTH - heals around 1/3 max HP and raises SPECIAL. Doesn't do anything if you have full health.
  - DEFENSE CURL - makes all SUPER EFFECTIVE moves do normal damage to the user until the user switches out
  - MEDITATE - raises all of attack, speed, and special by 1 stage
  - SUBMISSION - 60 base power, fighting type, raises attack by 1 stage, 100% accuracy
  - CUT - 70 base power, bug type, no additional effect, 100% accuracy
  - FLASH - 60 base power, electric type, priority move, 10% chance of flinching, 100% accuracy
  - CONVERSION - The user can convert between DEFENSE mode and ATTACK mode. DEFENSE mode halves all damage to the user. ATTACK mode will remove defense mode, but will use an attack that is guaranteed to be super effective against the opponent.
  - COMET PUNCH - 60 base power, fighting type, priority move, 100% accuracy
  - KARATE CHOP, MEGA PUNCH, MEGA KICK, STRENGTH, and DIZZY PUNCH are all Fighting type moves now
  - VICEGRIP - 75 base power, bug type, 30% chance of paralysis, 100% accuracy
  - WING ATTACK - 50 base power, flying type, priority move, 100% accuracy
  - BIDE - Raises attack and defense both by 1 stage
  - SELFDESTRUCT - 140 base power, fire type, deals heavy recoil, 100% accuracy. If you have less than 1/3 health left, it will be 250 power and half the opponent's defense, but also makes the user faint immediately.
  - EXPLOSION - 140 base power, rock type, deals heavy recoil, 100% accuracy. If you have less than 1/3 health left, it will be 250 power and half the opponent's defense, but also makes the user faint immediately.
  - SKULL BASH - 100 base power, rock type, if it misses it deals crash damage like jump kick/hi jump kick, 90% accuracy
  - SPIKE CANNON - 42 base power, rock type, hits 2 or 3 times (50% chance of each outcome), 100% accuracy
  - POISON GAS - 60 base power, poison type, high critical hit ratio, 10% chance of poison, 100% accuracy
  - LEECH LIFE - 70 base power, bug type, drains HP, 100% accuracy
  - ROCK SLIDE and ROCK THROW both have 100% accuracy
  - MIRROR MOVE - is a priority move and always uses the previous attack the opponent used regardless of if the pokemon that used it fainted
  - MIMIC - you can still choose the exact move to mimic, but now it will use that move the same turn you mimic it
  - BONEMERANG - 60 base power, hits twice, 95 accuracy, 30% chance of lowering opponent's speed. It also can hit FLYING-type pokemon for neutral damage unlike other GROUND-type moves.
  - SUPER FANG - now deals a set 2/3 the opponent's HP instead of 1/2. Useful for catching rare pokemon!
  - TELEPORT - actually does something in trainer battles now! The user will switch out, and heal 25% health by doing so. Still works the same as it used to when wild pokemon use it.
  - DOUBLESLAP - does double damage on sleeping pokemon! But also makes them wake up.
  - SONICBOOM - Priority move, GHOST type, 50 power. If you use it on the first turn you can attack, it will always cause the opponent to flinch.
  - ACID ARMOR - Does both LIGHT SCREEN and REFLECT in one move.
- Some pokemon get SIGNATURE MOVES! This means they do more damage or get better accuracy with specific moves. For example, if ARBOK uses ACID, its power will be 100 instead of 50. An NPC in Saffron City can tell you which pokemon get signature moves and what the bonuses are to those moves. 
- There are many more tweaks to moves. Check your MOVEDEX in game to see what a move you just saw's effects were, or see the wiki for a link to the complete move list. Be sure to try almost every move and don't write them off. Except for splash. It still does nothing as usual.

## Pokemon type changes
These changes were all made to make the pokemon more fun to use / more unique from similar pokemon / less bad.
As soon as you have your first badge (Boulderbadge) from Pewter City, there is an NPC in a house in indigo plateau route 23 past the first guard who can customize which pokemon use new types or their original types if you don't like these changes. However I would recommend keeping at least some of them turned on because they are pretty fun to use and the game and the pokemon's movesets are kind of balanced around them.
- Ninetales is Fire/Ghost
- Golduck is Water/Psychic
- Seadra is Water/Dragon
- Marowak is Ground/Ghost
- Kabuto/Kabutops are Rock/Bug
- Butterfree is Bug/Psychic
- Doduo/Dodrio are Flying/Ground
- Voltorb/Electrode are Electric/Fire
- Fearow is Flying/Fighting
- Kingler is Water/Ground
- Pinsir is Bug/Fighting
- Electabuzz is Electric/Fighting
- Mr Mime is Psychic/Ghost
- Sandshrew and Sandslash are Ground/Normal (stronger slash damage!)
- Ponyta and Rapidash are now Fire/Normal 
- Goldeen and Seaking are now Water/Normal
- Victreebel is Grass/Dragon

Additionally, GHOST type was made a "Dynamic type". What this means, is it can do Physical or Special damage depending on your base SPECIAL and base ATTACK. If base SPECIAL is higher than base ATTACK for your pokemon, GHOST type moves will be use SPECIAL for damage calculation. Otherwise, they will use ATTACK and the opponent's DEFENSE for damage calculation. This lets pokemon like Gengar be a bit more useful while also allowing physical attacker pokemon to benefit from physical damage on ghost attacks.

## Trainer AI changes
- Opponents can have tracked PP if you turn on NPC PP in the game options
- AI won't spam agility or amnesia repeatedly just because your pokemon is weak to psychic moves. The subroutine for selecting super effective moves ignores moves that do no damage now.
- Similarly, AI will avoid using OHKO moves just because they seem super effective if they would never work. But it will use them if they have a chance of working on you.
- AI using items or switching pokemon will always go at the start of the turn like it does for the player instead of when their turn starts
- Most Trainers will avoid using Dream Eater if you're not asleep
- Most Trainers will avoid using Leech Seed, Disable, Light Screen, Reflect, Focus Energy, Mist, etc effects if they already used it and it would not do anything
- Most Trainers will avoid using confusion-inflicting moves if you're already confused
- Most Trainers will avoid using healing moves like recover at full health
- Most trainers will avoid using priority moves if you're invulnerable due to FLY or DIG
- Smarter trainers will favor using priority moves if you're faster than them
- Smarter trainers will favor using draining moves like Mega Drain when they're at low health
- Smarter trainers will use MIRROR MOVE if it results in a move that is super effective
- Smarter trainers will favor 4x super effective moves even more than normal super effective moves
- Expert trainers will favor using healing moves like recover when they're at low health
- Expert trainers will heavily favor using dream eater if you're asleep
- Expert trainers will try to apply statuses if you don't have one
- Trainers that can use boosting items like X Attack will only do so if it appears safe to use it.

## Audio Changes
- The ghosts in pokemon tower now have a sound effect on encountering
- Booting up a TM or HM has a little sound effect
- Pushing a boulder down a hole in Seafoam / Victory road has a sound and feedback with it now
- When you fall down a hole in Seafoam / Victory road, there is a sound effect with it now
- Giovanni's Theme (unused music from Pokemon Yellow) was added when you encounter Giovanni. You must set MUSIC option to OG+ for it to play.
- Beta victory theme (battle victory "guide") was added when you defeat female trainers. You must set MUSIC option to OG+ for it to play.
- Beta healing theme (healing theme "pallet town") was added when you rest at your house in PALLET TOWN. You must set MUSIC option to OG+ for it to play.
- The Elite Four will all use the gym battle theme instead of the first three using the default battle music.
- A small sound effect was added when you toss an item.
- A small sound effect plays when you get on or off your bicycle, but only if you have the option BIKE SONG set to OFF.
- A small sound effect plays when you push a boulder onto a switch in Victory Road.
- A small sound effect plays when you light up Rock Tunnel with FLASH.
- A small sound effect plays when the doors behind the first 3 elite four members open upon defeating them.
- If you set MUSIC to OG+ mode, 6 pokemon (POLIWHIRL, VILEPLUME, GOLDEEN, RHYHORN, OMANYTE, DITTO) will have slightly different cries so their cries aren't exact duplicates of other pokemon.
- Music volume was decreased when you enter the pokemon nicknaming screen.
- The game's unused fanfare sound effect has been used in a couple of new events such as the VOLCANO area.

## Pokemon Green visuals
The version-specific visuals of japanese pokemon green were added into PureGreen.
- Slot machines

![Green Slots](/screenshots/green_slots.png?raw=true)
- SGB Borders

![Green SGB Border](/screenshots/green_title_sgb_border.png?raw=true)
- Title Screen

## Things that Will Remain Unchanged
- I will not make the game use Gen 2 colors/tilesets/music/sprites/etc.
- I will not implement the physical/special split. I balanced the game around there not being one.
- I will not split the SPECIAL stat into SPECIAL DEFENSE and SPECIAL ATTACK. I balanced the game around the combined special stat.
- I will not add dark, steel, or fairy type. 
- I will not mess with the type matchup chart outside of the tweakable options already provided.
- I will not make a version without the base stat changes
- I will not make a version without the move changes
- I will not make a version without learnset / TM / trainer party changes
- I will not add beta pokemon to the game (just about all of the decent beta mons for gen 1 were already repurposed as official pokemon in later games)
- I will not add "EXP.SHARE" to the game. The game is balanced around raising each pokemon you have in battle, and it's a hallmark of gen 1! It takes discipline to raise each one up rather than ignoring them! Later on in the game you have many options to raise pokemon quickly, such as duplicating rare candies with the item duplication glitch, buying rare candies in a secret area, the BOOSTER CHIP, easy repeatable training in the SAFARI ZONE, and boosted EXP wild pokemon in Route 23. So don't worry too much about it.
- I will not add a "Caught Pokemon" indicator in battle. Why? It changes the feel of the game. You don't really have to ever look at the pokedex if this feature is introduced. Also, I think it's a hallmark of gen 1 to not have this feature and to memorize which pokemon you have caught already.
- I will not add a "Move Relearner". This really changes the feel of gen 1, where you have to think carefully about deleting learnset moves. Don't worry, most great moves can be relearned via TMs anyway. The excellent moves are later in learnsets, so it's unlikely you'll miss them.
- If you want less changes but still the quality of life / bugfix stuff, I'd recommend taking a look at the romhack called shinpokered.
