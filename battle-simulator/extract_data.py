#!/usr/bin/env python3
"""
Extract Pokemon Red battle data from the disassembly
"""

import re
import json
import os

# Mapping from internal indices to Pokedex numbers
POKEMON_INDEX_TO_DEX = {
    0x01: 112, 0x02: 115, 0x03: 32, 0x04: 35, 0x05: 21, 0x06: 100, 0x07: 34,
    0x08: 80, 0x09: 2, 0x0A: 103, 0x0B: 108, 0x0C: 102, 0x0D: 88, 0x0E: 94,
    0x0F: 29, 0x10: 31, 0x11: 104, 0x12: 111, 0x13: 131, 0x14: 59, 0x15: 151,
    0x16: 130, 0x17: 90, 0x18: 72, 0x19: 92, 0x1A: 123, 0x1B: 120, 0x1C: 9,
    0x1D: 127, 0x1E: 114, 0x21: 58, 0x22: 95, 0x23: 22, 0x24: 16, 0x25: 79,
    0x26: 64, 0x27: 75, 0x28: 113, 0x29: 67, 0x2A: 122, 0x2B: 106, 0x2C: 107,
    0x2D: 24, 0x2E: 47, 0x2F: 54, 0x30: 96, 0x31: 76, 0x33: 126, 0x35: 125,
    0x36: 82, 0x37: 109, 0x39: 56, 0x3A: 86, 0x3B: 50, 0x3C: 128, 0x40: 83,
    0x41: 48, 0x42: 149, 0x46: 84, 0x47: 60, 0x48: 124, 0x49: 146, 0x4A: 144,
    0x4B: 145, 0x4C: 132, 0x4D: 52, 0x4E: 98, 0x52: 37, 0x53: 38, 0x54: 25,
    0x55: 26, 0x58: 147, 0x59: 148, 0x5A: 140, 0x5B: 141, 0x5C: 116, 0x5D: 117,
    0x60: 27, 0x61: 28, 0x62: 138, 0x63: 139, 0x64: 39, 0x65: 40, 0x66: 133,
    0x67: 136, 0x68: 135, 0x69: 134, 0x6A: 66, 0x6B: 41, 0x6C: 23, 0x6D: 46,
    0x6E: 61, 0x6F: 62, 0x70: 13, 0x71: 14, 0x72: 15, 0x74: 85, 0x75: 57,
    0x76: 51, 0x77: 49, 0x78: 87, 0x7B: 10, 0x7C: 11, 0x7D: 12, 0x7E: 68,
    0x80: 55, 0x81: 97, 0x82: 42, 0x83: 150, 0x84: 143, 0x85: 129, 0x88: 89,
    0x8A: 99, 0x8B: 91, 0x8D: 101, 0x8E: 36, 0x8F: 110, 0x90: 53, 0x91: 105,
    0x93: 93, 0x94: 63, 0x95: 65, 0x96: 17, 0x97: 18, 0x98: 121, 0x99: 1,
    0x9A: 3, 0x9B: 73, 0x9D: 118, 0x9E: 119, 0xA3: 77, 0xA4: 78, 0xA5: 19,
    0xA6: 20, 0xA7: 33, 0xA8: 30, 0xA9: 74, 0xAA: 137, 0xAB: 142, 0xAD: 81,
    0xB0: 4, 0xB1: 7, 0xB2: 5, 0xB3: 8, 0xB4: 6, 0xB9: 43, 0xBA: 44,
    0xBB: 45, 0xBC: 69, 0xBD: 70, 0xBE: 71
}

TYPE_MAP = {
    'NORMAL': 'Normal', 'FIGHTING': 'Fighting', 'FLYING': 'Flying',
    'POISON': 'Poison', 'GROUND': 'Ground', 'ROCK': 'Rock', 'BUG': 'Bug',
    'GHOST': 'Ghost', 'FIRE': 'Fire', 'WATER': 'Water', 'GRASS': 'Grass',
    'ELECTRIC': 'Electric', 'PSYCHIC_TYPE': 'Psychic', 'ICE': 'Ice',
    'DRAGON': 'Dragon', 'BIRD': 'Flying'
}

def extract_pokemon_names():
    """Extract Pokemon names from names.asm"""
    names = []
    with open('data/pokemon/names.asm', 'r') as f:
        for line in f:
            match = re.search(r'dname\s+"([^"]+)"', line)
            if match:
                names.append(match.group(1))
    return names

def extract_pokemon_stats():
    """Extract Pokemon base stats from individual files"""
    pokemon_data = {}
    base_stats_dir = 'data/pokemon/base_stats'

    # Get all Pokemon names from names.asm (in index order)
    pokemon_names = extract_pokemon_names()

    for idx, name in enumerate(pokemon_names, start=1):
        # Map internal index to Pokedex number
        dex_num = POKEMON_INDEX_TO_DEX.get(idx)
        if not dex_num:
            continue

        # Convert name to filename
        filename = name.lower().replace('♂', 'm').replace('♀', 'f').replace("'", '')
        if filename == 'mr.mime':
            filename = 'mrmime'
        elif filename == "farfetch'd":
            filename = 'farfetchd'

        filepath = os.path.join(base_stats_dir, f'{filename}.asm')

        if not os.path.exists(filepath):
            continue

        with open(filepath, 'r') as f:
            content = f.read()

            # Extract stats
            stats_match = re.search(r'db\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+)', content)
            if not stats_match:
                continue

            hp, atk, defense, speed, special = map(int, stats_match.groups())

            # Extract types
            type_match = re.search(r'db\s+(\w+),\s+(\w+)\s+;\s*type', content)
            if not type_match:
                continue

            type1_raw, type2_raw = type_match.groups()
            type1 = TYPE_MAP.get(type1_raw, type1_raw.capitalize())
            type2 = TYPE_MAP.get(type2_raw, type2_raw.capitalize())

            types = [type1]
            if type1 != type2:
                types.append(type2)

            # Extract starting moves
            moves_match = re.search(r'db\s+([\w,\s]+);\s*level 1 learnset', content)
            starting_moves = []
            if moves_match:
                move_list = moves_match.group(1).split(',')
                for move in move_list:
                    move = move.strip()
                    if move and move != 'NO_MOVE':
                        starting_moves.append(move.replace('_', ' ').title())

            pokemon_data[dex_num] = {
                'id': dex_num,
                'name': name,
                'types': types,
                'stats': {
                    'hp': hp,
                    'attack': atk,
                    'defense': defense,
                    'speed': speed,
                    'special': special
                },
                'startingMoves': starting_moves[:4]  # Limit to 4 moves
            }

    return pokemon_data

def extract_moves():
    """Extract move data from moves.asm"""
    moves = {}

    with open('data/moves/moves.asm', 'r') as f:
        content = f.read()

        # Find all move definitions
        move_pattern = r'move\s+(\w+),\s+(\w+),\s+(\d+),\s+(\w+),\s+(\d+),\s+(\d+)'

        for match in re.finditer(move_pattern, content):
            move_name, effect, power, type_raw, accuracy, pp = match.groups()

            move_display_name = move_name.replace('_', ' ').title()
            type_name = TYPE_MAP.get(type_raw, type_raw.capitalize())

            moves[move_name] = {
                'name': move_display_name,
                'type': type_name,
                'power': int(power),
                'accuracy': int(accuracy),
                'pp': int(pp),
                'effect': effect
            }

    return moves

def extract_type_effectiveness():
    """Extract type effectiveness chart from type_matchups.asm"""
    effectiveness = []

    with open('data/types/type_matchups.asm', 'r') as f:
        for line in f:
            match = re.search(r'db\s+(\w+),\s+(\w+),\s+(\w+)', line)
            if match:
                attacker, defender, multiplier = match.groups()

                if attacker == '-1':  # End marker
                    break

                attacker_type = TYPE_MAP.get(attacker, attacker.capitalize())
                defender_type = TYPE_MAP.get(defender, defender.capitalize())

                mult_value = 1.0
                if multiplier == 'SUPER_EFFECTIVE':
                    mult_value = 2.0
                elif multiplier == 'NOT_VERY_EFFECTIVE':
                    mult_value = 0.5
                elif multiplier == 'NO_EFFECT':
                    mult_value = 0.0

                effectiveness.append({
                    'attacker': attacker_type,
                    'defender': defender_type,
                    'multiplier': mult_value
                })

    return effectiveness

def main():
    print("Extracting Pokemon data...")
    pokemon_data = extract_pokemon_stats()
    print(f"Extracted {len(pokemon_data)} Pokemon")

    print("Extracting move data...")
    moves_data = extract_moves()
    print(f"Extracted {len(moves_data)} moves")

    print("Extracting type effectiveness...")
    type_effectiveness = extract_type_effectiveness()
    print(f"Extracted {len(type_effectiveness)} type matchups")

    # Save to JSON files
    os.makedirs('battle-simulator/data', exist_ok=True)

    with open('battle-simulator/data/pokemon.json', 'w') as f:
        json.dump(list(pokemon_data.values()), f, indent=2)

    with open('battle-simulator/data/moves.json', 'w') as f:
        json.dump(moves_data, f, indent=2)

    with open('battle-simulator/data/types.json', 'w') as f:
        json.dump(type_effectiveness, f, indent=2)

    print("\nData extraction complete!")
    print("Files saved to battle-simulator/data/")

if __name__ == '__main__':
    main()
