Kanto Expansion Pak
===================
This is a ROM Hack of Pokémon Red and Blue, aiming to expand the Kanto region with more interesting locations, evolutions added in later generations, and QoL changes.

Improved areas
====
- Rock Tunnel has a more workable map, now being easier to go through and having new areas to explore. Includes a way to get renewable fossils, items, and other interesting bits and pieces. Overall, it makes Flash much more rewarding to bring, showing you where the items and content are instead of being an inconvenience. 
- Diglett's Cave has a more detailed map. Plus, if you go back after getting Surf, you'll be able to access a neat little island. (Prototype music to be added later!)

QoL Enhancements
====
- PC added to Celadon Hotel where the invisible event usually is. Why not?
- Artificial Save Delay has been removed.
- Japanese event moves can now be taught via TM/HM;
	- TM16 (Pay Day) can be taught to Fearow and Rapidash.
	- TM23 (Dragon Rage) can be taught to Magikarp.
	- HM02 (Fly) can be taught to the Pikachu line.
	- HM03 (Surf) can be taught to the Pikachu line.
- The Game Corner in general is massively buffed, making everything far more worth going for;
	- 3x Cherry now gives 40 coins (used to be 8)
	- 3x Magikarp/Poliwag/Bird/Diglett/Rattata/Jigglypuff now gives 75 coins (used to be 15)
	- 3x BAR now gives 300 coins (used to be 100)
	- 3x 7s now gives 999 coins (used to be 300)
- Game Corner prizes have been altered;
	- Version parity is done across prizes, using Blue's superior prices.
	- New prizes across both versions include; Cubone, Blastyke, and Cactus.
	- Version exclusives are Clefairy for Red and Jigglypuff for Blue. Pinsir and Scyther remain the same.
	- The Moon Stone is available over TM23 (Dragon Rage). Dragon Rage has been moved to Celadon Mart, over Take Down, which can still be obtained in Silph Co.

Bug Fixes
====
Many non-multiplayer, non-battle related bugs have been fixed. The aforementioned have been preserved for the RBY battle experience. Bugs that are fixed are ones that objectively hurt the gameplay experience. Much of this can be attributed to [the tutorials](https://github.com/pret/pokered/wiki/Bugs-and-Glitches) made by the good people at pret.
- Blaine is no longer addicted to Super Potions.
- CoolTrainerF no longer switches a lot.
- Transformed Pokemon aren't presumed to be Dittos! (very important given Animon)
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

Credits
====
* Plague von Karma - Creator of the Showdown Mod, Developer
* Martha's Against Humanity - Developer 
* Ema Sky - Developer 
* ausma - Showdown Mod assistance
* Paulluxx - Showdown Mod assistance
* DuoM2 - Showdown Mod assistance 
* Albatross - Much of the new sprites used in the hack 
* ZumiIsawhat? - Restorations of beta OST
* Helix Chamber, RacieBeep, et al - Prototype Pokémon sprites
* pret et al - Pokémon Red and Blue Disassembly Project, many tutorials helped us!

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
[discord]: https://discord.gg/d5dubZ3
[irc]: https://web.libera.chat/?#pret
[ci]: https://github.com/pret/pokered/actions
[ci-badge]: https://github.com/pret/pokered/actions/workflows/main.yml/badge.svg
