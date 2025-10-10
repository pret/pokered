# Pokémon Red/Blue Codebase Structure

This is a **disassembly/decompilation of Pokémon Red and Blue** for the Game Boy. It's a complete reverse engineering project that reconstructs the original game's assembly code.

## Project Overview

This codebase can build multiple ROMs from assembly source:
- Pokémon Red (UE)
- Pokémon Blue (UE)
- BLUEMONS.GB (debug build)
- Virtual Console patches

## Core Structure

### Top-Level Assembly Files

- **main.asm** - Main ROM bank definitions, includes all game modules organized by ROM bank sections
- **home.asm** - Home bank (bank 0) code that's always accessible
- **audio.asm** - Sound and music system
- **maps.asm** - Map data and definitions
- **text.asm** - All in-game text strings
- **ram.asm** - RAM/memory layout definitions

### Key Directories

#### `/engine` - Core game logic
- `battle/` - Battle system (moves, effects, AI, animations)
- `overworld/` - Overworld movement, sprites, collision, NPCs
- `menus/` - UI systems (Pokédex, PC, party menu, start menu)
- `pokemon/` - Pokémon data management (stats, evolution, experience)
- `items/` - Item functionality and effects
- `events/` - Special events (trades, pokécenter, shops, hidden objects)
- `gfx/` - Graphics rendering routines
- `movie/` - Cutscenes (intro, title, credits, evolution)

#### `/data` - Static game data
- `pokemon/` - Base stats, names, cries, evolution data
- `moves/` - Move data and animations
- `maps/` - Map headers, connections, songs
- `items/` - Item prices and names
- `types/` - Type effectiveness charts

#### `/constants` - Assembly constants/definitions for all game systems

#### `/maps` - Individual map scripts and data (225+ files for each location)

#### `/scripts` - Map event scripts for NPCs, items, trainers

#### `/text` - Text content organized by context/location

#### `/gfx` - Graphics assets (sprites, tilesets, pics) in PNG format

#### `/audio` - Music and sound effect data

#### `/home` - Core routines in the home bank (always accessible)

#### `/macros` - Assembly macro definitions

#### `/tools` - Build tools for compression, graphics conversion, etc.

## Build System

Uses **RGBDS** (Rednex Game Boy Development System) with:
- `rgbasm` - Assembler
- `rgblink` - Linker
- `rgbfix` - ROM header fixer
- `rgbgfx` - Graphics converter

The Makefile defines different build flags for Red/Blue versions and debug builds using preprocessor defines like `_RED`, `_BLUE`, `_DEBUG`.

## Development Notes

This is a well-organized reverse engineering project that recreates the exact original ROMs from human-readable assembly source code. The code is organized into logical ROM banks, with the main.asm file acting as the central orchestrator that includes all modules in their proper memory locations.
