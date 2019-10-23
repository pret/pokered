# Pokémon Red and Blue Esperanto translation

This is an Esperanto translation of Pokémon Red and Blue,
based on [this dissasembly](https://github.com/pret/pokered).

<!-- TODO: updata this when more stable
It builds the following roms:

* Pokemon Red (UE) [S][!].gb  `md5: 3d45c1ee9abd5738df46d2bdda8b57dc`
* Pokemon Blue (UE) [S][!].gb `md5: 50927e843568814f7ed45ec4f944bd8b`

-->
To set up the repository, see [**INSTALL.md**](INSTALL.md).

# translation information

## character set

The bitmap graphics are generated from [gfs/fonts.png](gfx/fonts.png).

Each character is 8x8 pixels and normally includes whitespace to the right and
bottom.

[This site](https://bulbapedia.bulbagarden.net/wiki/Character_encoding_in_Generation_I)
describes the conversion from bytes to characters. esperanto characters are
currently stored in 0xC0-0xDF.

Strings are written useing the
[X-system](https://en.wikipedia.org/wiki/Esperanto_orthography#X-system).
This is achieved by mapping sequences of characters in [charmap.asm](charmap.asm).
