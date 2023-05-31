Kanto Expansion Pak
===================
This is a ROM Hack of Pokémon Red and Blue, aiming to expand the Kanto region with new Kanto-related Pokemon, more interesting locations, and QoL changes. It is a port of my [Pokemon Showdown Mod](https://github.com/PlagueVonKarma?tab=repositories), in a sense.

If playing on an emulator, BGB is strongly recommended for its accuracy and features. VBA's inaccuracies can cause unintended glitches. This hack is fully playable on official hardware as well.

New Pokemon:
====
The Kanto Expansion Pak's ethos is to add every "Kanto-related" Pokemon to RBY without fundamentally changing the grander metagame. What's defined as "Kanto-related" is a Pokemon that evolves from an existing Kanto Pokemon, made an appearance in a Kanto-based game (LGPE), is a regional variant, or was a Kanto-related Pokemon cut during the development of an official game.

With this criteria, we get:
- The 34 known beta Pokemon that were cut from RBY; eg. Gorochu, Deer
- Evolutions or pre-evolutions of a Kanto Pokemon found in a future generation eg. Kleavor, Glaceon, Annihilape
- Evolutions of Kanto Pokemon found in the SpaceWorld '97 demo; eg. Madaamu, Purakkusu
- All fully-evolved regional variants of Kanto Pokemon; eg. Hisuian Arcanine, Galarian Slowbro, Paldean Tauros, Alolan Muk
- Meltan and Melmetal from LGPE.
- Paradox Pokemon from SV; Scream Tail and Sandy Shocks.

Johto baby Pokemon and regional pre-evolutions were omitted due to RBY using an 8-bit register. This hack as-is just barely manages to fit everything. A refactor to a 16-bit register is possible and has been done before, but only on a really old pokered version that would require a ton of its own refactoring to be modernised. It's just not feasible at this current time.

Mega Evolutions and Gigantamax forms are not in the game mainly by choice. There are no held items and there isn't a special button or anything, so it felt kind of weird to add, would deviate significantly from the RBY experience, and requires a pretty big overhaul to the battle system. It's definitely possible, just not for me.

New Types:
====
To accomodate the new Pokemon, the Dark, Steel, and Fairy types are added. They are effectively "tacked on", with no vanilla Pokemon or moves being changed, which is a big part of what this hack wants. 

Dark and Steel use their SpaceWorld '97 type matchups because these revisions were produced prior to the national tournament that year, and thus before Game Freak made appropriate balancing changes. Thus, what you get here are types that are very different, but maintain the core RBY experience. Fairy lacks a confirmed older revision, so it remains the same as XY's, which has not yet changed, and if it does, this hack will not change with it. Closer to RBY is what we want!

Changes at a glance:
- Dark and Steel use their type effectiveness from the SW97 demo, aiming to be closer to RBY experience.
- Bite is still Normal-type.
- The Clefairy, Mime Jr, and Jigglypuff lines are not Steel or Fairy-type, respectively.
	- This (and Bite) was done to ensure the original Kanto Pokemon were unaltered in any way.
	- While Magnemite, Magnetite, and Magneton are pure Electric, Magnezone is part-Steel.
	- Scream Tail remains Fairy/Psychic.
- Fire remains neutral against Ice.
- Bug and Poison remain super effective against each other.
- Psychic remains immune to Ghost.

Type Matchups for Steel and Dark for reference:
- Steel...
	- Attacks are Super Effective vs: Rock, Fairy
	- Attacks are Not Very Effective vs: Water, Electric
	- Attacks do no Damage vs: Steel
	- Pokemon are weak to: Water, Electric
	- Pokemon resist: Poison, Rock, Fighting, Fairy
	- Pokemon are Immune To: Steel
- Dark...
	- Attacks are Super Effective vs: Ghost, Psychic, Dark
	- Attacks are Not Very Effective vs: Normal, Fairy 
	- Pokemon are Weak to: Normal, Dark, Fairy 
	- Pokemon resist: Ghost, Psychic

Naturally, these types get appropriate moves. They are currently distributed to exclusively new Pokemon, with the vanilla bunch untouched. The only moves imported have effects that are exactly replicable in RBY's code for consistency reasons.
- Steel: Bullet Punch, Iron Defense, Iron Head, Magnet Bomb, Metal Sound, Mirror Shot, Smart Strike
- Dark: Brutal Swing, Fake Tears, False Surrender, Feint Attack, Kowtow Cleave, Nasty Plot, Night Slash
- Fairy: Charm, Dazzling Gleam, Disarming Voice, Draining Kiss, Fairy Wind, Play Rough, Sweet Kiss

New Items:
====
There are some new items here, with the aim of accomodating new Pokemon, adding features, and acting as methods of getting to new locations. 
- To accomodate Meltan, the Mystery Box from Pokemon GO is featured. When used, wild encounters are replaced with Meltan until one leaves the location.
	- Melmetal is obtained by using a Candy Jar on Meltan, which is obtained as a special reward later!
- The Ice, Poison and Heart Stones have been added, the latter two being from the SpaceWorld '97 demo.
	- Additional evolution items include the Protector, Black Augurite, Up-Grade, Dubious Disc, and the Metal Coat.
- The Bottle Cap has been added alongside a Hyper Training feature, acting as effectively a Gold Bottle Cap.
- The Old Sea Map has been added, giving access to Faraway Island and Mew.
- The Citrine Pass has been added, allowing access to a new post-game area based on the unused "C" map.
- The Wing Fossil is a new item that allows Aerodactyl to be revived, as the Old Amber is instead used for Decilla.

New Areas
====
- Celadon University is just north of Celadon.
	- This is a reference to a Magikarp event from July 1998, and includes the lore from it and other areas of Pokemon's early worldbuilding.
	- There are features new infinitely re-battleable trainers for grinding money.
	- There's a Move Deleter and Move Relearner, allowing for HM deletion and getting back lost moves.
- Citrine City is a new island city that can be accessed in the postgame.
	- There's a house with a Move Tutor that can teach Tradeback moves without the need for GSC's Time Capsule!
	- It features a Team Rocket house where they will sell you TMs and Evolution Items, as well as provide a Hyper Training feature to get Max DVs!
	- The Battle Tent from the TwitchPlaysPokemon Anniversary hack makes a return, featuring new trainers and KEP Pokemon!
	- Garnet Cavern, located in Citrine City, houses several strong trainers and Pokémon. It seems a little familiar...
	- Brunswick Trail, south of Citrine City, is a route that leads to Celeste Hill.
	- Celeste Hill activates an event where the Galarian Legendary Birds can be fought. Moltres will challenge you right there, while the other two flee to the previously mentioned locations.
- Underwater Tunnel connects Route 25 and Route 10, making Rock Tunnel skippable later.
- Cinnabar Volcano is a new area that houses Moltres, allowing it to be obtained before Victory Road.
- Faraway Island from Pokemon Emerald has been added, where you can find Mew. It also has its own wild encounters, as well as an improved translation on its sign, enhancing its appearance from its source material.
- Mt. Moon Crater is a new area based on Area Zero in Pokemon Scarlet and Violet, accessible in the post-game. Here, you can encounter Scream Tail and Sandy Shocks via random encounter, just like the original!
- Bill's Garden is accessible in the post-game with access to all "one-time deals", just like in the mythos!
- Silph Co. holds a special challenge for Pokemon League Champions...

Improved Areas
====
- Some barriers to travel across the region have been removed (for example, Pewter City can be left without defeating Brock) allowing for more open world gameplay. Not all, though! 
	- To encourage this, Gym Leaders now have level scaling, giving more consistent challenge across the game. 
- Giovanni now uses his unused theme song from Yellow, and has his LGPE monologue in the Rocket Hideout.
- Jessie and James have been backported from Yellow, appearing in Mt. Moon, Rocket Hideout, Pokemon Tower, and Silph Co. Additionally, they have a post-game fight.
- Rock Tunnel has a more workable map, now being easier to go through and having new areas to explore. Includes a way to get renewable fossils, items, and other interesting bits and pieces. Overall, it makes Flash much more rewarding to bring, showing you where the items and content are instead of being an inconvenience. 
- Diglett's Cave has a more detailed map with Onix, Wiglett, and Wugtrio also appearing! It also has its beta music!
- Route 25 has been given a facelift, adding Bill's Lighthouse in place of the Sea Cottage.
- Cinnabar Island is a lot bigger, with the volcano being added to it. The mansion seems different too...
	- Cinnabar Lab's Trade Room now features the Trader, who will evolve trade-evolving Pokemon for you!
- Pokemon Tower was shortened, being less intensive and adding room for more maps.
- Silph Co's pathing was completely overhauled to make navigating it less tedious.
- Viridian Gym now has a minor new area once you make Giovanni leave.
- Various Move Tutors from FireRed and LeafGreen have been distributed around the region, instead giving their respective TMs.
- The S.S. Anne now returns after getting the Marsh Badge and features trades for Galarian forms & Evolutions, as well as Paldean Tauros.
- After entering the Hall of Fame, try visiting Route 1!

QoL Enhancements
====
- A girl option is now available, featuring the sprite from Pokemon Anniversary Red, which is based on Green's manga appearance.
	- To accomodate this, Celadon Gym's trainers use their more neutral text from Crystal.
- All 151 original Pokemon, plus an additional 100, can be obtained without the use of trading or glitches, including Mew!
- New Pokedex entries for most Pokemon are available, sourced from the original 1996 Pokedex book by Creatures Inc., restoring a ton of old Kanto lore. Thanks to [Dr. Lava and Nob Ogasawara](http://lavacutcontent.com/1996-creatures-pokedex-translation-1/) for their incredible work translating and writing about it!
- Pikachu and Eevee are now starters, featuring fully functional Rival lineups. If you pick Pikachu, he picks Eevee, and if you pick Eevee, he picks Pikachu!
- Item Descriptions are available!
- Press A beside surfable water, strength boulders, or cut trees to use the HMs without needing to go into the Party menu.
- Running Shoes activate by holding B. Also works with the bike and Surf.
- Fast text has no frame delay between text scrolling, doubling the scroll speed. It's also been made the default option, so you don't need to go into the Options menu for it.
- The Old and Good Rods have been removed, and the Super Rod, now called the Fishing Rod, is obtained in Pewter City. All fishing encounter tables have been altered to roughly match the levels of the surrounding routes. 
- Traded Pokemon ("Outsiders") can now be nicknamed at the Name Rater's House.
- HP bar has been doubled in speed, having a 1 frame delay per pixel rather than 2.
- The blinking animation when hit by moves like Tackle now repeats 4 instead of 6 times, speeding up battles by a bit while not sacrificing impact.
- The Rock in the Safari Zone now only raises the flee chance by 1.5x, rather than 2x, opening up new strategies.
- PP symbol is displayed in the battle menu. PP displayed before, it just looks nicer now. Done by changing a straggler Japanese character.
- Lorelei, Bruno, and Agatha now play the Gym Leader Battle theme.
- Trainer DVs are perfect-15s.
- The protagonist is referred to in a gender neutral manner.
- PC added to Celadon Hotel where the invisible event usually is. Why not?
- Artificial Save Delay has been removed.
- Ultra Balls now have a Ball Modifier of 4, instead of 8. This makes them better for general-purpose than Great Balls. Safari Balls have the same effect by proxy. 
- Yellow learnset changes are imported; eg. Flash Venonat, with tweaks made to ensure nothing is lost from RB either.
- Event moves can now be taught via TM/HM;
	- TM16 (Pay Day) can be taught to Fearow and Rapidash ('98 Shogakukan)
	- TM23 (Dragon Rage) can be taught to Magikarp (July '98 Shogakukan)
	- HM02 (Fly) can be taught to the Pikachu line (Corocoro)
	- HM03 (Surf) can be taught to the Pikachu line (Stadium / Corocoro)
	- Psyduck learns Amnesia at Lv15 (Stadium)
- The Game Corner in general is massively buffed and much faster, making everything far more worth going for;
	- 3x Cherry now gives 50 coins (used to be 8)
	- 3x Arbok/Koffing/Meowth now gives 100 coins (used to be 15)
	- 3x BAR now gives 400 coins (used to be 100)
	- 3x 7s now gives 900 coins (used to be 300)
- Game Corner prizes have been altered;
	- Blue's superior prices are used, so Porygon only costs 6500 coins.
	- New prizes include: Cubone, Blastyke, and Cactus.
	- The Moon Stone is available over TM23 (Dragon Rage). Dragon Rage is still available in Celadon University!
- Bag capacity increased from 20 to 30 items.
- Spinner tiles move faster.
- Fight Debug now allows moves other than Pound.

Bug Fixes
====
Many non-multiplayer, non-battle related bugs have been fixed. Battle-related bugs have been preserved for the sake of the RBY battle experience. Bugs that are fixed are ones that objectively hurt the gameplay experience, so glitches like the Mew Glitch, which arguably add to the gameplay, are preserved. Much of the fixes made here can be attributed to [the tutorials](https://github.com/pret/pokered/wiki/Bugs-and-Glitches) made by the good people at pret.
- Fixed various translation errors (eg. Route 14 Birdkeeper's "birds of prey" line, Koji and Atsuko in Fuschia.)
- Blaine is no longer addicted to Super Potions.
- CoolTrainerF no longer switches a lot.
- Transformed Pokemon aren't presumed to be Dittos! Mew and Animon function correctly with this at play.
- Status curing items don't remove modifiers anymore.
- Learning new moves plays the sound in the correct bank.
- Falling through a hole on a bike now properly resets the music, as you fall off a bike when going down.
- Using an Escape Rope no longer shows weird characters on DMG and spins correctly on DMG.
- The Item Finder will correctly find items at X/Y 0.0
- Glitch Pokémon will no longer corrupt the Hall of Fame.
- Strength smoke puffs now show properly.
- Game Corner has a ton of fixes;
	- The slots no longer load too many tiles
	- The lucky machine stops when it should if there's a 7
	- The 40-coin hidden item is fixed, and there can always be a lucky machine.
	- and a few other objective fixes.
- 2 invisible stars that show on the title screen are cut off; also, the "presents" logo from RG is re-used!
- The healing machine animates correctly! 
- Using Minimize or Substitute, looking at the Pokedex, and then battling won't cause sprite corruption.
- OAM Updates can no longer be interrupted by V-Blank, avoiding some sprite corruption.
- Trainer Card transition no longer shows weird garbage on DMGs; this was due to not having enough time to load properly.
- Battle victory music plays at the right time; there were some situations where it would happen when you lost.
- Music in Oak's Lab is delayed a frame so it always plays with the correct channels; V-Blank could otherwise interrupt it.
- The hidden item sfx no longer gets cut off sometimes
- The audio engine no longer borrows from the high bytes of the wrong frequency.
- Oak no longer has his line overwrite itself when giving Poke Balls.
- Player correctly faces the Route 8 guard when stopped.
- Weird behaviour when going to 11F in Silph Co. and forcing a player to leave despite not moving is fixed.
- Fixed weirdness in Pokemon Tower where saving Mr. Fuji won't immediately let you leave. Also fixed coord termination on 2F which could cause some terribleness.
and more!
- Trainer Name Pointers are removed, as the localised games don't need to use the file at all.
- Dakutens are removed, as the Japanese accents aren't used in English releases.
- Blank Leader Name code is removed; before, this would only be for the PNGs.
- Some grammar tweaks have been made (eg. If a move is disabled, it now has an upper-case D instead of a lower-case one.)

Known Bugs
====
- Only portions of spinner tiles animate.
- Occasionally, menu text sets itself to scroll.
- The lone Rocket in Viridian Gym's basement needs to be directly spoken to to be battled.
- Pokedex is very laggy during a playthrough, and seen/owned are being weird (possibly due to a change made when adding extra starters..?)
- Dome and Wing Fossils in Rock Tunnel B1F don't show properly.
- The Tradeback Tutor doesn't work properly with Rhydon for reasons likely related to its index number of 1.
- The Vermilion Passes are very unstable (Faraway warps are weird unless you battle, Citrine outright crashes).
- The Brunswick Trail Bird event is unfinished, Zapdos causes it to crash.

Evolution Methods for new Pokemon
====
Due to the odd way some new Pokemon evolve, methods are listed here. 
- Beta Pokemon are included with their original methods. 
- Some Pokemon will have methods from the Spaceworld '97 demo to be closer to, or functional in the context of, RBY. Sometimes the newer version is available (eg. Metal Coat evolutions) for the sake of familiarity.
- To accomodate new additions and ensure everything makes sense, some Pokemon have also had their methods changed. These situations are usually very extreme.

Changed Methods:
- Shellder -> Cloyster | Use Ice Stone (Accomodating Taaban)
- Gloom -> Vileplume | Use Poison Stone (Accomodating Bellossom)
- Nidorino -> Nidoking | L36 (Prototype method, accomodating Nidoreign)
- Nidorina -> Nidoqueen | L36 (Prototype method, accomodating Nidoreign)

New Pokemon:
- Rhydon -> Rhyperior | Use Protector 
- Lickitung -> Lickilicky | L32
- Scyther -> Scizor | L41 OR use Metal Coat
- Scyther -> Kleavor | Use Black Augurite
- Pinsir -> Purakkusu | L42 OR use Metal Coat
- Tangela -> Tangrowth | L44
- Onix -> Steelix | L38 OR use Metal Coat
- Slowpoke -> Slowking | Use Heart Stone 
- Chansey -> Blissey | L45
- Magmar -> Magmortar | Use Fire Stone
- Electabuzz -> Electivire | Use Thunder Stone
- Magneton -> Magnezone | Use Thunder Stone
- Poliwhirl -> Politoed | Use Heart Stone
- Ditto -> Animon | Use Metal Coat
- Seadra -> Kingdra | Trade
- Primeape -> Annihilape | Trade
- Golbat -> Crobat | L44
- Marowak -> Guardia | Use Heart Stone
- Porygon -> Porygon2 | Use Up-Grade
- Porygon2 -> Porygon-Z | Use Dubious Disc
- Gloom -> Bellossom | Use Leaf Stone
- Weepinbell -> Tsubomitto | Use Poison Stone
- Shellder -> Taaban | Use Water Stone

Kanto Beta Pokemon:
- Blottle -> Pendraken | L30
- Bittybat -> Zubat | L15
- Cheep -> Jabetta | L30
- Mikon -> Vulpix | L15
- Raichu -> Gorochu | Trade
- Ribbito -> Croakozuna | L30
- Skimper -> Bawligua | L30
- Bawligua -> Cryithan | L50
- Konya -> Meowth | L14
- Decilla -> Gyaoon | L40
- Magnemite -> Magnetite | L20
- Magnetite -> Magneton | L30
- Gyopin -> Goldeen | L16
- Kotora -> Gaotora | L16
- Gaotora -> Gorotora | L36
- Puchikoon -> Ponyta | L20
- Blastyke -> Blastoise | L36
- Wartortle -> Totartle | L36, replaces Blastoise
- Kokana -> Kasanagi | L7
- Kasanagi -> Carapthor | L10
- Psyduck -> Weirduck | L22, Golduck level remains the same for Weirduck.
- Nidorino OR Nidorina -> Nidoreign | Moon Stone

Eeveelutions:
- Espeon | Heart Stone
- Umbreon | Poison Stone
- Leafeon | Leaf Stone
- Glaceon | Ice Stone
- Sylveon | Moon Stone

The Evolution Stone Glitch is being made a feature by moving the Pokemon's constants appropriately. It happens by defeating a Pokemon using a certain Pokemon, while levelling up the respective Pokemon that wants to evolve. Thus, by using a stone, you now have a way to save on them, making all evolutions replicable as long as the Pokemon is kept in possession. We're making each Pokemon that applies to this glitch thematically appropriate.

The following will apply:
- Clefable for Moon Stone
- Electivire for Thunder Stone
- Magmortar for Fire Stone
- Poliwrath for Water Stone
- Politoed for Heart Stone
- Victreebel for Leaf Stone
- Tsubomitto for Poison Stone
- Cloyster for Ice Stone
- Melmetal for Candy Jar
- Kleavor for Black Augurite
- Porygon2 for Up-Grade
- Porygon-Z for Dubious Disc
- Rhyperior for Protector
- Steelix for Metal Coat

Accessing Regional variants
====
Adding regional variants was difficult; we hit the exact Pokemon cap by cutting their pre-evolutions. However, we managed to implement them quite nicely!

Much like in Let's Go Pikachu and Let's Go Eevee, traders are available who will trade you a regional variant in exchange for a Kantonian one. This goes as follows:
- Viridian City: Raticate
- Pewter City: Golem
- Cerulean City: Ninetales
- Vermillion City: Persian
- Lavender Town: Dugtrio
- Celadon City: Sandslash
- Saffron City: Raichu
- Fuchsia City: Marowak
- Cinnabar Island: Muk
- Indigo Plateau: Exeggutor

Version exclusivity was factored in, instead moving Raticate and Golem to the cities without a trader, which were strangely appropriate thematically.

Galarian and Paldean formes are accessed on the S.S. Anne, which now returns after receiving the Marsh Badge. Hisuian formes are found in the wild in Bill's Garden, which is accessible in the post-game. The idea is a prototype version of his Time Capsule yanks them in or something.

Given many of these evolve via stones, we've given them their pre-evolution's learnsets to ensure they remain functional. Should the current situation change, the trades will be changed to the pre-evolutions and their learnsets shifted appropriately.

Credits
====
* Plague von Karma - Creator of the Showdown Mod, Developer, Maps, and occasional spriter (assisting with Tsubomitto, Carapthor)
* Martha's Against Humanity - Developer, Pokémon implementation, tweaks of Albatross's sprites, a few maps (Citrine City, Cinnabar Volcano)
* Ema Skye - Developer, Maps, Showdown Mod assistance
* pret et al - Pokémon Red and Blue Disassembly Project, many tutorials helped us!
* ausma - Showdown Mod assistance
* Paulluxx - Showdown Mod assistance
* DuoM2 - Showdown Mod assistance 
* Albatross - Many of the new sprites used in the hack (A significant number of post-Gen 1 evolutions, all regional variants, Meltan and Carapthor lines, etc.)
* Frrf - Assisting with the development of the Pikachu / Eevee Mode, debugging
* dannye33 - Assisting with crysaudio implementation
* erosunica - Assistance with developing Celadon University & Citrine City, plus sources for various subjects.
* Chatot4444 - Assisting with gym scaling code
* Enigami - Reworking the Battle Tent's RestoreTeam code to make it work properly
* ZumiIsawhat? - Restorations of beta OST
* FrenchOrange - Reconstructions of various overworld beta sprites.
* Helix Chamber, RacieBeep, loumilouminosus, Orchid, GBCRetro, & catstorm26 - Prototype Pokémon sprites
* Vortiene - Reused a bit of code from their pureRGB hack. Assisted in bug fixes.
* Pigu-A, RevoSucks, walle303 - Contributors to Pokemon Anniversary Red, which we used as reference points for the Girl sprites and the Battle Tent.
* jojobear13 & Mateo - Move deleter & move relearner functionality from Shin Pokered, followed [this guide](https://github.com/jojobear13/shinpokered/blob/master/how%20to%20guides/how%20to%20add%20the%20move%20relearner%26deleter.txt). Tweaks were made to make it compatible with the pokered version we worked off of.
* Rangi - Reused a bit of code from their Red* / Blue* hack to make HMs usable in the overworld!
* wrulfy - Technical advice
* 大吟醸 (Daiginjo) - Assistance in translating the Tamamushi University Student Book, allowing for an accurate adaptation of the location.

Original README.md proceeding;
# Pokémon Red and Blue [![Build Status][ci-badge]][ci]

This is a disassembly of Pokémon Red and Blue.

It builds the following ROMs:

- Pokemon Red (UE) [S][!].gb `sha1: ea9bcae617fdf159b045185467ae58b2e4a48b9a`
- Pokemon Blue (UE) [S][!].gb `sha1: d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
- BLUEMONS.GB (debug build) `sha1: 5b1456177671b79b263c614ea0e7cc9ac542e9c4`
- dmgapae0.e69.patch `sha1: 0fb5f743696adfe1dbb2e062111f08f9bc5a293a`
- dmgapee0.e68.patch `sha1: ed4be94dc29c64271942c87f2157bca9ca1019c7`

To set up the repository, see [**INSTALL.md**](INSTALL.md).


## See also

- [**Wiki**][wiki] (includes [tutorials][tutorials])
- [**Symbols**][symbols]
- **Discord:** [pret][discord]
- **IRC:** [libera#pret][irc]

Other disassembly projects:

- [**Pokémon Yellow**][pokeyellow]
- [**Pokémon Gold/Silver**][pokegold]
- [**Pokémon Crystal**][pokecrystal]
- [**Pokémon Pinball**][pokepinball]
- [**Pokémon TCG**][poketcg]
- [**Pokémon Ruby**][pokeruby]
- [**Pokémon FireRed**][pokefirered]
- [**Pokémon Emerald**][pokeemerald]

[pokeyellow]: https://github.com/pret/pokeyellow
[pokegold]: https://github.com/pret/pokegold
[pokecrystal]: https://github.com/pret/pokecrystal
[pokepinball]: https://github.com/pret/pokepinball
[poketcg]: https://github.com/pret/poketcg
[pokeruby]: https://github.com/pret/pokeruby
[pokefirered]: https://github.com/pret/pokefirered
[pokeemerald]: https://github.com/pret/pokeemerald
[wiki]: https://github.com/pret/pokered/wiki
[tutorials]: https://github.com/pret/pokered/wiki/Tutorials
[symbols]: https://github.com/pret/pokered/tree/symbols
[discord]: https://discord.gg/d5dubZ3
[irc]: https://web.libera.chat/?#pret
[ci]: https://github.com/pret/pokered/actions
[ci-badge]: https://github.com/pret/pokered/actions/workflows/main.yml/badge.svg
