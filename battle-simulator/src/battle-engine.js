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
        // Use selected moves if available (from team builder)
        if (pokemon.selectedMoves && pokemon.selectedMoves.length > 0) {
            return pokemon.selectedMoves.slice(0, 4);
        }

        // Otherwise use starting moves
        const moves = [...pokemon.startingMoves];

        // If fewer than 4 moves, add from learnable moves
        if (pokemon.learnableMoves && moves.length < 4) {
            const availableMoves = pokemon.learnableMoves.filter(m => !moves.includes(m) && dataLoader.getMove(m)?.power > 0);
            while (moves.length < 4 && availableMoves.length > 0) {
                const randomIndex = Math.floor(Math.random() * availableMoves.length);
                moves.push(availableMoves.splice(randomIndex, 1)[0]);
            }
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

        this.turn++;

        const playerMove = this.playerActive.moves[moveIndex];

        // AI chooses a move
        const opponentMoveIndex = Math.floor(Math.random() * this.opponentActive.moves.length);
        const opponentMove = this.opponentActive.moves[opponentMoveIndex];

        // Determine turn order based on speed (with random tiebreaker)
        const playerSpeed = this.playerActive.speed;
        const opponentSpeed = this.opponentActive.speed;

        let firstAttacker, firstMove, secondAttacker, secondMove;

        if (playerSpeed > opponentSpeed) {
            firstAttacker = this.playerActive;
            firstMove = playerMove;
            secondAttacker = this.opponentActive;
            secondMove = opponentMove;
        } else if (opponentSpeed > playerSpeed) {
            firstAttacker = this.opponentActive;
            firstMove = opponentMove;
            secondAttacker = this.playerActive;
            secondMove = playerMove;
        } else {
            // Speed tie - 50/50 chance
            if (Math.random() < 0.5) {
                firstAttacker = this.playerActive;
                firstMove = playerMove;
                secondAttacker = this.opponentActive;
                secondMove = opponentMove;
            } else {
                firstAttacker = this.opponentActive;
                firstMove = opponentMove;
                secondAttacker = this.playerActive;
                secondMove = playerMove;
            }
        }

        // First attacker goes
        const firstTarget = firstAttacker === this.playerActive ? this.opponentActive : this.playerActive;
        this.executeMove(firstAttacker, firstTarget, firstMove);

        // Check if first attack ended the battle
        if (firstTarget.isFainted()) {
            this.log(`${firstTarget.name} fainted!`);
            const faintSide = firstTarget === this.playerActive ? 'player' : 'opponent';
            return this.handleFaint(faintSide);
        }

        // Second attacker goes (if battle still ongoing)
        if (!this.battleEnded) {
            const secondTarget = secondAttacker === this.playerActive ? this.opponentActive : this.playerActive;
            setTimeout(() => {
                this.executeMove(secondAttacker, secondTarget, secondMove);

                // Check if second attack ended the battle
                if (secondTarget.isFainted()) {
                    this.log(`${secondTarget.name} fainted!`);
                    const faintSide = secondTarget === this.playerActive ? 'player' : 'opponent';
                    this.handleFaint(faintSide);
                }
            }, 1000);
        }

        return { turnComplete: true };
    }

    opponentAttack() {
        // This method is no longer used as attacks happen together in playerAttack
        // Keeping it for compatibility
        return null;
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
