// Battle Engine - Core battle mechanics for Gen 1 Pokemon

class BattlePokemon {
    constructor(pokemon, level = 50) {
        this.species = pokemon;
        this.level = level;
        this.name = pokemon.name;

        // Calculate stats at level 50 (using simplified Gen 1 formulas)
        this.maxHP = this.calculateStat(pokemon.stats.hp, level, true);
        this.currentHP = this.maxHP;
        this.attack = this.calculateStat(pokemon.stats.attack, level);
        this.defense = this.calculateStat(pokemon.stats.defense, level);
        this.speed = this.calculateStat(pokemon.stats.speed, level);
        this.special = this.calculateStat(pokemon.stats.special, level);

        this.types = pokemon.types;
        this.moves = this.assignMoves(pokemon);

        this.status = null; // paralyzed, burned, frozen, poisoned, asleep
        this.volatile = {
            confused: false,
            flinch: false,
            trapped: false
        };
    }

    calculateStat(baseStat, level, isHP = false) {
        // Simplified Gen 1 stat calculation (assuming max IVs and EVs)
        if (isHP) {
            return Math.floor(((baseStat + 50) * 2 * level) / 100) + level + 10;
        } else {
            return Math.floor(((baseStat + 50) * 2 * level) / 100) + 5;
        }
    }

    assignMoves(pokemon) {
        // Start with the Pokemon's starting moves
        const moves = [...pokemon.startingMoves];

        // If fewer than 4 moves, add random compatible moves
        const availableMoves = Object.keys(dataLoader.moves);
        while (moves.length < 4 && availableMoves.length > 0) {
            const randomMove = availableMoves[Math.floor(Math.random() * availableMoves.length)];
            const move = dataLoader.moves[randomMove];

            // Only add if not already in moveset and has power
            if (!moves.includes(move.name) && move.power > 0) {
                moves.push(move.name);
            }

            if (moves.length >= 10) break; // Safety limit
        }

        return moves.slice(0, 4);
    }

    takeDamage(damage) {
        this.currentHP = Math.max(0, this.currentHP - damage);
        return this.currentHP <= 0;
    }

    heal(amount) {
        this.currentHP = Math.min(this.maxHP, this.currentHP + amount);
    }

    isFainted() {
        return this.currentHP <= 0;
    }

    getHPPercentage() {
        return (this.currentHP / this.maxHP) * 100;
    }
}

class BattleEngine {
    constructor() {
        this.playerTeam = [];
        this.opponentTeam = [];
        this.playerActive = null;
        this.opponentActive = null;
        this.turn = 0;
        this.battleLog = [];
        this.isPlayerTurn = true;
        this.battleEnded = false;
    }

    startBattle(playerTeam, opponentTeam) {
        this.playerTeam = playerTeam.map(p => new BattlePokemon(p));
        this.opponentTeam = opponentTeam.map(p => new BattlePokemon(p));
        this.playerActive = this.playerTeam[0];
        this.opponentActive = this.opponentTeam[0];
        this.turn = 0;
        this.battleLog = [];
        this.battleEnded = false;

        this.log(`Battle started!`);
        this.log(`Go! ${this.playerActive.name}!`);
        this.log(`${this.opponentActive.name} appeared!`);

        return {
            player: this.playerActive,
            opponent: this.opponentActive
        };
    }

    log(message) {
        this.battleLog.push({
            turn: this.turn,
            message: message,
            timestamp: Date.now()
        });
    }

    playerAttack(moveIndex) {
        if (this.battleEnded) return null;

        const move = this.playerActive.moves[moveIndex];
        const result = this.executeMove(this.playerActive, this.opponentActive, move);

        // Check if opponent fainted
        if (this.opponentActive.isFainted()) {
            this.log(`${this.opponentActive.name} fainted!`);
            return this.handleFaint('opponent');
        }

        // Opponent's turn
        if (!this.battleEnded) {
            setTimeout(() => this.opponentAttack(), 1000);
        }

        return result;
    }

    opponentAttack() {
        if (this.battleEnded) return null;

        // Simple AI: choose random move
        const moveIndex = Math.floor(Math.random() * this.opponentActive.moves.length);
        const move = this.opponentActive.moves[moveIndex];
        const result = this.executeMove(this.opponentActive, this.playerActive, move);

        // Check if player fainted
        if (this.playerActive.isFainted()) {
            this.log(`${this.playerActive.name} fainted!`);
            return this.handleFaint('player');
        }

        this.turn++;
        return result;
    }

    executeMove(attacker, defender, moveName) {
        const moveData = dataLoader.getMove(moveName);

        if (!moveData) {
            this.log(`${attacker.name} tried to use an unknown move!`);
            return { success: false };
        }

        this.log(`${attacker.name} used ${moveName}!`);

        // Check if move hits (accuracy check)
        const hitRoll = Math.random() * 100;
        if (hitRoll > moveData.accuracy) {
            this.log(`${attacker.name}'s attack missed!`);
            return { success: false, miss: true };
        }

        // Calculate damage
        if (moveData.power > 0) {
            const damage = this.calculateDamage(attacker, defender, moveData);
            defender.takeDamage(damage);

            // Determine effectiveness
            const effectiveness = dataLoader.getTypeEffectiveness(
                moveData.type,
                defender.types
            );

            if (effectiveness > 1) {
                this.log(`It's super effective!`);
            } else if (effectiveness < 1 && effectiveness > 0) {
                this.log(`It's not very effective...`);
            } else if (effectiveness === 0) {
                this.log(`It doesn't affect ${defender.name}...`);
            }

            return {
                success: true,
                damage: damage,
                effectiveness: effectiveness,
                defender: defender
            };
        } else {
            // Status move or other effect
            this.log(`${moveName} has an effect!`);
            return { success: true, status: true };
        }
    }

    calculateDamage(attacker, defender, move) {
        // Gen 1 damage formula (simplified)
        const level = attacker.level;
        const power = move.power;

        // Determine if special or physical
        const isSpecial = ['Fire', 'Water', 'Grass', 'Electric', 'Psychic', 'Ice', 'Dragon'].includes(move.type);

        const attackStat = isSpecial ? attacker.special : attacker.attack;
        const defenseStat = isSpecial ? defender.special : defender.defense;

        // Critical hit (6.25% chance in Gen 1)
        const isCritical = Math.random() < 0.0625;
        const criticalMultiplier = isCritical ? 2 : 1;

        if (isCritical) {
            this.log(`Critical hit!`);
        }

        // Type effectiveness
        const effectiveness = dataLoader.getTypeEffectiveness(move.type, defender.types);

        // STAB (Same Type Attack Bonus)
        const stab = attacker.types.includes(move.type) ? 1.5 : 1;

        // Random factor (0.85 to 1.0)
        const randomFactor = 0.85 + Math.random() * 0.15;

        // Damage calculation
        const baseDamage = ((2 * level / 5 + 2) * power * (attackStat / defenseStat)) / 50 + 2;
        const finalDamage = Math.floor(baseDamage * stab * effectiveness * criticalMultiplier * randomFactor);

        return Math.max(1, finalDamage);
    }

    handleFaint(side) {
        if (side === 'opponent') {
            const nextIndex = this.opponentTeam.findIndex(p => !p.isFainted());

            if (nextIndex === -1) {
                this.log(`You won the battle!`);
                this.battleEnded = true;
                return { battleEnded: true, winner: 'player' };
            } else {
                this.opponentActive = this.opponentTeam[nextIndex];
                this.log(`${this.opponentActive.name} was sent out!`);
                return { switched: true, newPokemon: this.opponentActive };
            }
        } else {
            const nextIndex = this.playerTeam.findIndex(p => !p.isFainted());

            if (nextIndex === -1) {
                this.log(`You lost the battle!`);
                this.battleEnded = true;
                return { battleEnded: true, winner: 'opponent' };
            } else {
                // Player needs to switch
                return { needSwitch: true };
            }
        }
    }

    switchPokemon(teamIndex) {
        const pokemon = this.playerTeam[teamIndex];

        if (pokemon.isFainted()) {
            return { success: false, message: 'That Pokemon has fainted!' };
        }

        if (pokemon === this.playerActive) {
            return { success: false, message: 'That Pokemon is already in battle!' };
        }

        this.log(`${this.playerActive.name}, come back!`);
        this.playerActive = pokemon;
        this.log(`Go! ${this.playerActive.name}!`);

        // Opponent attacks after switch
        setTimeout(() => this.opponentAttack(), 1000);

        return { success: true, newPokemon: this.playerActive };
    }

    getState() {
        return {
            player: this.playerActive,
            opponent: this.opponentActive,
            playerTeam: this.playerTeam,
            opponentTeam: this.opponentTeam,
            turn: this.turn,
            battleLog: this.battleLog,
            battleEnded: this.battleEnded
        };
    }
}

// Global battle engine instance
const battleEngine = new BattleEngine();
