# Pokemon Gen 1 Battle Simulator

A web-based Pokemon battle simulator that recreates the Gen 1 (Red/Blue) battle mechanics using data extracted from the Pokemon Red disassembly.

## Features

- **Team Builder**: Create and save custom Pokemon teams
  - Browse all 151 Gen 1 Pokemon
  - Search functionality to find Pokemon quickly
  - Save multiple teams to local storage
  - View Pokemon stats and types

- **Battle System**: Engage in Gen 1-style battles
  - Fight against AI opponents with saved teams
  - Battle against randomly generated teams
  - Authentic Gen 1 battle mechanics including:
    - Type effectiveness
    - Critical hits
    - STAB (Same Type Attack Bonus)
    - Physical/Special move split based on type
    - Damage calculation formulas from Gen 1

- **Battle Features**:
  - Real-time HP tracking
  - Battle log showing all actions
  - Switch Pokemon during battle
  - Multiple moves per Pokemon
  - Win/loss conditions

## How to Use

### Running the Application

1. Open `index.html` in a modern web browser
2. The app will automatically load all Pokemon data

### Building a Team

1. Click on the "Team Builder" tab
2. Search for Pokemon using the search bar
3. Click on Pokemon cards to add them to your current team (max 6)
4. Enter a team name in the input field
5. Click "Save Team" to save your team

### Starting a Battle

1. Click on the "Battle" tab
2. Select one of your saved teams from the dropdown
3. Choose an opponent:
   - **Battle AI**: Fight against an AI-controlled team
   - **Random Team Battle**: Fight against a randomly generated team
4. Use the "Fight" button to select moves
5. Use the "Switch" button to change Pokemon
6. Watch the battle log to see what's happening

### During Battle

- **HP Bars**: Show current health (Green = healthy, Yellow = low, Red = critical)
- **Battle Log**: Shows all actions, damage, and effects
- **Move Selection**: Choose from 4 moves with type, power, and accuracy displayed
- **Switch Pokemon**: Change to a different team member

## Technical Details

### Data Extraction

The `extract_data.py` script extracts Pokemon data from the disassembly:
- Pokemon base stats (HP, Attack, Defense, Speed, Special)
- Pokemon types
- Move data (power, type, accuracy, PP)
- Type effectiveness matchups

### Battle Engine

The battle engine implements Gen 1 mechanics:
- Stat calculation at level 50
- Damage formula: `((2 * Level / 5 + 2) * Power * (Attack / Defense)) / 50 + 2`
- Type effectiveness multipliers (0x, 0.5x, 1x, 2x, 4x)
- Critical hit chance (6.25%)
- Random damage variance (85-100%)

### File Structure

```
battle-simulator/
├── index.html              # Main HTML file
├── css/
│   └── style.css          # Styling
├── src/
│   ├── app.js             # Main application logic
│   ├── data-loader.js     # Data loading and management
│   ├── battle-engine.js   # Battle mechanics
│   ├── battle-ui.js       # Battle interface
│   └── team-builder.js    # Team building interface
├── data/
│   ├── pokemon.json       # Pokemon data
│   ├── moves.json         # Move data
│   └── types.json         # Type effectiveness
└── README.md

```

## Browser Compatibility

- Chrome/Edge 90+
- Firefox 88+
- Safari 14+

Requires JavaScript enabled and localStorage for team saving.

## Known Limitations

- No status effects (paralysis, burn, sleep, etc.) implemented yet
- No stat modifications (buffs/debuffs)
- Simplified AI (random move selection)
- No animations or sprites
- Move effects are simplified

## Future Enhancements

- Status effects and conditions
- Stat modifications
- Better AI with type advantage logic
- Pokemon sprites
- Battle animations
- More complex move effects
- Import/export teams
- Battle history

## Credits

Data extracted from the [Pokemon Red disassembly project](https://github.com/pret/pokered)
