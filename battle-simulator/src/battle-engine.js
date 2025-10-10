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

        // Check if move hits (accuracy check) - but SWIFT never misses
        if (moveData.effect !== 'SWIFT_EFFECT') {
            const hitRoll = Math.random() * 100;
            if (hitRoll > moveData.accuracy) {
                this.log(`${attacker.name}'s attack missed!`);
                return { success: false, miss: true };
            }
        }

        // Apply move effects
        return this.applyMoveEffect(attacker, defender, moveData);
    }

    applyMoveEffect(attacker, defender, move) {
        const effect = move.effect;

        // Handle damage-dealing moves first
        if (move.power > 0) {
            const result = this.applyDamage(attacker, defender, move);

            // Apply additional effect after damage
            if (result.success && !defender.isFainted()) {
                this.applySecondaryEffect(attacker, defender, move);
            }

            return result;
        }

        // Handle status moves
        switch (effect) {
            case 'ATTACK_UP1_EFFECT':
            case 'ATTACK_UP2_EFFECT':
                return this.modifyStat(attacker, 'attack', effect.includes('UP2') ? 2 : 1, true);

            case 'DEFENSE_UP1_EFFECT':
            case 'DEFENSE_UP2_EFFECT':
                return this.modifyStat(attacker, 'defense', effect.includes('UP2') ? 2 : 1, true);

            case 'SPEED_UP1_EFFECT':
            case 'SPEED_UP2_EFFECT':
                return this.modifyStat(attacker, 'speed', effect.includes('UP2') ? 2 : 1, true);

            case 'SPECIAL_UP1_EFFECT':
            case 'SPECIAL_UP2_EFFECT':
                return this.modifyStat(attacker, 'special', effect.includes('UP2') ? 2 : 1, true);

            case 'ATTACK_DOWN1_EFFECT':
            case 'ATTACK_DOWN2_EFFECT':
                return this.modifyStat(defender, 'attack', effect.includes('DOWN2') ? -2 : -1, false);

            case 'DEFENSE_DOWN1_EFFECT':
            case 'DEFENSE_DOWN2_EFFECT':
                return this.modifyStat(defender, 'defense', effect.includes('DOWN2') ? -2 : -1, false);

            case 'SPEED_DOWN1_EFFECT':
            case 'SPEED_DOWN2_EFFECT':
                return this.modifyStat(defender, 'speed', effect.includes('DOWN2') ? -2 : -1, false);

            case 'SPECIAL_DOWN1_EFFECT':
            case 'SPECIAL_DOWN2_EFFECT':
                return this.modifyStat(defender, 'special', effect.includes('DOWN2') ? -2 : -1, false);

            case 'SLEEP_EFFECT':
                defender.status = 'asleep';
                this.log(`${defender.name} fell asleep!`);
                return { success: true };

            case 'POISON_EFFECT':
                defender.status = 'poisoned';
                this.log(`${defender.name} was poisoned!`);
                return { success: true };

            case 'PARALYZE_EFFECT':
                defender.status = 'paralyzed';
                this.log(`${defender.name} was paralyzed!`);
                return { success: true };

            case 'CONFUSION_EFFECT':
                defender.volatile.confused = true;
                this.log(`${defender.name} became confused!`);
                return { success: true };

            case 'HEAL_EFFECT':
                const healAmount = Math.floor(attacker.maxHP / 2);
                attacker.heal(healAmount);
                this.log(`${attacker.name} recovered HP!`);
                return { success: true };

            default:
                return { success: true };
        }
    }

    applyDamage(attacker, defender, move) {
        let totalDamage = 0;

        // Multi-hit moves
        let hits = 1;
        if (move.effect === 'TWO_TO_FIVE_ATTACKS_EFFECT') {
            // 2-5 hits
            const rand = Math.random();
            if (rand < 0.375) hits = 2;
            else if (rand < 0.750) hits = 3;
            else if (rand < 0.875) hits = 4;
            else hits = 5;
        } else if (move.effect === 'ATTACK_TWICE_EFFECT') {
            hits = 2;
        } else if (move.effect === 'TWINEEDLE_EFFECT') {
            hits = 2;
        }

        for (let i = 0; i < hits; i++) {
            let damage = 0;

            // Special damage calculations for specific effects
            if (move.effect === 'SPECIAL_DAMAGE_EFFECT') {
                // Moves like Seismic Toss, Dragon Rage
                if (move.name.includes('Seismic Toss') || move.name.includes('Night Shade')) {
                    damage = attacker.level;
                } else if (move.name.includes('Dragon Rage')) {
                    damage = 40;
                } else if (move.name.includes('Sonic Boom')) {
                    damage = 20;
                } else {
                    damage = attacker.level;
                }
            } else if (move.effect === 'SUPER_FANG_EFFECT') {
                damage = Math.floor(defender.currentHP / 2);
            } else if (move.effect === 'OHKO_EFFECT') {
                // One-hit KO moves
                if (attacker.level >= defender.level) {
                    damage = defender.currentHP;
                    this.log(`It's a one-hit KO!`);
                } else {
                    this.log(`But it failed!`);
                    return { success: false };
                }
            } else {
                // Normal damage calculation
                damage = this.calculateDamage(attacker, defender, move);
            }

            defender.takeDamage(damage);
            totalDamage += damage;

            // Break if defender fainted
            if (defender.isFainted()) break;
        }

        // Log hit count for multi-hit moves
        if (hits > 1) {
            this.log(`Hit ${hits} time(s)!`);
        }

        // Type effectiveness message
        const effectiveness = dataLoader.getTypeEffectiveness(move.type, defender.types);
        if (effectiveness > 1) {
            this.log(`It's super effective!`);
        } else if (effectiveness < 1 && effectiveness > 0) {
            this.log(`It's not very effective...`);
        } else if (effectiveness === 0) {
            this.log(`It doesn't affect ${defender.name}...`);
        }

        // Recoil damage
        if (move.effect === 'RECOIL_EFFECT') {
            const recoil = Math.floor(totalDamage / 4);
            attacker.takeDamage(recoil);
            this.log(`${attacker.name} took recoil damage!`);
        } else if (move.effect === 'EXPLODE_EFFECT') {
            attacker.currentHP = 0;
            this.log(`${attacker.name} fainted from the explosion!`);
        } else if (move.effect === 'JUMP_KICK_EFFECT') {
            if (totalDamage === 0) {
                const crashDamage = Math.floor(attacker.maxHP / 8);
                attacker.takeDamage(crashDamage);
                this.log(`${attacker.name} kept going and crashed!`);
            }
        }

        // Drain HP
        if (move.effect === 'DRAIN_HP_EFFECT' || move.effect === 'DREAM_EATER_EFFECT') {
            const drain = Math.floor(totalDamage / 2);
            attacker.heal(drain);
            this.log(`${attacker.name} drained HP!`);
        }

        // Twineedle poison effect
        if (move.effect === 'TWINEEDLE_EFFECT' && !defender.isFainted()) {
            if (Math.random() < 0.2) {
                defender.status = 'poisoned';
                this.log(`${defender.name} was poisoned!`);
            }
        }

        return { success: true, damage: totalDamage, effectiveness: effectiveness };
    }

    applySecondaryEffect(attacker, defender, move) {
        const effect = move.effect;
        const chance = 0.3; // 30% for side effects (10% for some)

        // Side effects (have a chance to occur)
        if (effect.includes('SIDE_EFFECT')) {
            if (Math.random() > chance) return;

            if (effect.includes('BURN')) {
                defender.status = 'burned';
                this.log(`${defender.name} was burned!`);
            } else if (effect.includes('FREEZE')) {
                defender.status = 'frozen';
                this.log(`${defender.name} was frozen solid!`);
            } else if (effect.includes('PARALYZE')) {
                defender.status = 'paralyzed';
                this.log(`${defender.name} was paralyzed!`);
            } else if (effect.includes('POISON')) {
                defender.status = 'poisoned';
                this.log(`${defender.name} was poisoned!`);
            } else if (effect.includes('FLINCH')) {
                defender.volatile.flinch = true;
            } else if (effect.includes('CONFUSION')) {
                defender.volatile.confused = true;
                this.log(`${defender.name} became confused!`);
            } else if (effect.includes('ATTACK_DOWN')) {
                this.modifyStat(defender, 'attack', -1, false);
            } else if (effect.includes('DEFENSE_DOWN')) {
                this.modifyStat(defender, 'defense', -1, false);
            } else if (effect.includes('SPEED_DOWN')) {
                this.modifyStat(defender, 'speed', -1, false);
            } else if (effect.includes('SPECIAL_DOWN')) {
                this.modifyStat(defender, 'special', -1, false);
            }
        }
    }

    modifyStat(pokemon, stat, stages, isIncrease) {
        const statName = stat.charAt(0).toUpperCase() + stat.slice(1);

        if (!pokemon.statStages) {
            pokemon.statStages = { attack: 0, defense: 0, speed: 0, special: 0 };
        }

        const oldStage = pokemon.statStages[stat] || 0;
        const newStage = Math.max(-6, Math.min(6, oldStage + stages));
        pokemon.statStages[stat] = newStage;

        // Apply the stat modifier to the actual stat
        const multiplier = newStage >= 0
            ? (2 + newStage) / 2
            : 2 / (2 - newStage);

        const baseStat = pokemon.species.stats[stat];
        const calculatedStat = pokemon.calculateStat(baseStat, pokemon.level, false);
        pokemon[stat] = Math.floor(calculatedStat * multiplier);

        if (stages > 0) {
            this.log(`${pokemon.name}'s ${statName} rose!`);
        } else {
            this.log(`${pokemon.name}'s ${statName} fell!`);
        }

        return { success: true };
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
