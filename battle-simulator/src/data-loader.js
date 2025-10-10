// Data Loader - Manages loading and accessing Pokemon data

class DataLoader {
    constructor() {
        this.pokemon = [];
        this.moves = {};
        this.typeEffectiveness = [];
        this.loaded = false;
    }

    async loadAll() {
        try {
            const [pokemonData, movesData, typesData] = await Promise.all([
                fetch('data/pokemon.json').then(r => r.json()),
                fetch('data/moves.json').then(r => r.json()),
                fetch('data/types.json').then(r => r.json())
            ]);

            this.pokemon = pokemonData;
            this.moves = movesData;
            this.typeEffectiveness = typesData;
            this.loaded = true;

            console.log(`Loaded ${this.pokemon.length} Pokemon, ${Object.keys(this.moves).length} moves`);
            return true;
        } catch (error) {
            console.error('Failed to load data:', error);
            return false;
        }
    }

    getPokemon(id) {
        return this.pokemon.find(p => p.id === id);
    }

    getPokemonByName(name) {
        return this.pokemon.find(p => p.name.toLowerCase() === name.toLowerCase());
    }

    getAllPokemon() {
        return this.pokemon;
    }

    getMove(moveName) {
        // Convert display name back to key format
        const moveKey = moveName.toUpperCase().replace(/ /g, '_');
        return this.moves[moveKey];
    }

    getTypeEffectiveness(attackType, defenseTypes) {
        let multiplier = 1.0;

        defenseTypes.forEach(defenseType => {
            const matchup = this.typeEffectiveness.find(
                te => te.attacker === attackType && te.defender === defenseType
            );

            if (matchup) {
                multiplier *= matchup.multiplier;
            }
        });

        return multiplier;
    }

    getRandomPokemon() {
        return this.pokemon[Math.floor(Math.random() * this.pokemon.length)];
    }

    getRandomMove() {
        const moveKeys = Object.keys(this.moves);
        const randomKey = moveKeys[Math.floor(Math.random() * moveKeys.length)];
        return this.moves[randomKey];
    }
}

// Global data loader instance
const dataLoader = new DataLoader();
