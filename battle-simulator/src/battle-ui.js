// Battle UI - Manages battle interface and interactions

class BattleUI {
    constructor() {
        this.battleActive = false;
        this.awaitingPlayerAction = false;
    }

    startBattle(playerTeam, opponentTeam) {
        // Hide battle setup, show battle screen
        document.getElementById('battleSetup').style.display = 'none';
        document.getElementById('battleScreen').style.display = 'block';

        // Start the battle
        const state = battleEngine.startBattle(playerTeam, opponentTeam);

        this.battleActive = true;
        this.updateBattleDisplay();
        this.renderBattleLog();
        this.showMainMenu();
    }

    endBattle() {
        if (confirm('Are you sure you want to end this battle?')) {
            this.battleActive = false;
            document.getElementById('battleSetup').style.display = 'block';
            document.getElementById('battleScreen').style.display = 'none';
            this.clearBattleLog();
        }
    }

    updateBattleDisplay() {
        const state = battleEngine.getState();

        // Update player Pokemon
        this.updatePokemonDisplay('player', state.player);

        // Update opponent Pokemon
        this.updatePokemonDisplay('opponent', state.opponent);
    }

    updatePokemonDisplay(side, pokemon) {
        const nameEl = document.getElementById(`${side}Name`);
        const hpEl = document.getElementById(`${side}HP`);
        const hpTextEl = document.getElementById(`${side}HPText`);
        const levelEl = document.getElementById(`${side}Level`);

        nameEl.textContent = pokemon.name;
        levelEl.textContent = `Lv. ${pokemon.level}`;

        const hpPercent = pokemon.getHPPercentage();
        hpEl.style.width = `${hpPercent}%`;

        // Update HP bar color
        hpEl.classList.remove('low', 'critical');
        if (hpPercent <= 20) {
            hpEl.classList.add('critical');
        } else if (hpPercent <= 50) {
            hpEl.classList.add('low');
        }

        hpTextEl.textContent = `HP: ${pokemon.currentHP}/${pokemon.maxHP}`;
    }

    showMainMenu() {
        document.getElementById('mainMenu').style.display = 'grid';
        document.getElementById('moveMenu').style.display = 'none';
        document.getElementById('switchMenu').style.display = 'none';
    }

    showMoveMenu() {
        const state = battleEngine.getState();
        const moves = state.player.moves;

        const movesListEl = document.getElementById('movesList');
        movesListEl.innerHTML = '';

        moves.forEach((moveName, index) => {
            const moveData = dataLoader.getMove(moveName);
            if (!moveData) return;

            const moveBtn = document.createElement('button');
            moveBtn.className = 'menu-btn move-btn';
            moveBtn.innerHTML = `
                <span class="move-name">${moveName}</span>
                <span class="move-info">
                    <span class="type-badge ${moveData.type}">${moveData.type}</span>
                    PWR: ${moveData.power} ACC: ${moveData.accuracy}
                </span>
            `;

            moveBtn.addEventListener('click', () => {
                this.executePlayerMove(index);
            });

            movesListEl.appendChild(moveBtn);
        });

        document.getElementById('mainMenu').style.display = 'none';
        document.getElementById('moveMenu').style.display = 'block';
    }

    showSwitchMenu() {
        const state = battleEngine.getState();
        const team = state.playerTeam;

        const switchListEl = document.getElementById('teamSwitchList');
        switchListEl.innerHTML = '';

        team.forEach((pokemon, index) => {
            const switchOption = document.createElement('div');
            switchOption.className = 'switch-option';

            if (pokemon.isFainted()) {
                switchOption.classList.add('fainted');
            }

            if (pokemon === state.player) {
                switchOption.style.opacity = '0.5';
                switchOption.style.cursor = 'not-allowed';
            }

            switchOption.innerHTML = `
                <div class="switch-pokemon-name">${pokemon.name}</div>
                <div class="switch-pokemon-hp">HP: ${pokemon.currentHP}/${pokemon.maxHP}</div>
            `;

            if (!pokemon.isFainted() && pokemon !== state.player) {
                switchOption.addEventListener('click', () => {
                    this.executePokemonSwitch(index);
                });
            }

            switchListEl.appendChild(switchOption);
        });

        document.getElementById('mainMenu').style.display = 'none';
        document.getElementById('switchMenu').style.display = 'block';
    }

    executePlayerMove(moveIndex) {
        this.showMainMenu();

        const result = battleEngine.playerAttack(moveIndex);

        // Update display after a short delay
        setTimeout(() => {
            this.updateBattleDisplay();
            this.renderBattleLog();

            // Check if battle ended
            if (battleEngine.battleEnded) {
                this.handleBattleEnd();
            }
        }, 500);
    }

    executePokemonSwitch(teamIndex) {
        this.showMainMenu();

        const result = battleEngine.switchPokemon(teamIndex);

        if (!result.success) {
            alert(result.message);
            return;
        }

        setTimeout(() => {
            this.updateBattleDisplay();
            this.renderBattleLog();
        }, 500);
    }

    renderBattleLog() {
        const battleLogEl = document.getElementById('battleLog');
        const logs = battleEngine.battleLog;

        // Only show last 10 messages
        const recentLogs = logs.slice(-10);

        battleLogEl.innerHTML = recentLogs.map(log => {
            let logClass = 'log-entry';

            if (log.message.includes('fainted') || log.message.includes('Critical')) {
                logClass += ' damage';
            } else if (log.message.includes('healed')) {
                logClass += ' heal';
            } else if (log.message.includes('effective')) {
                logClass += ' status';
            }

            const turnLabel = log.turn > 0 ? `<span class="turn-label">Turn ${log.turn}</span> ` : '';
            return `<div class="${logClass}">${turnLabel}${log.message}</div>`;
        }).join('');

        // Scroll to bottom
        battleLogEl.scrollTop = battleLogEl.scrollHeight;
    }

    clearBattleLog() {
        document.getElementById('battleLog').innerHTML = '';
    }

    handleBattleEnd() {
        const state = battleEngine.getState();
        const winner = state.battleLog[state.battleLog.length - 1].message.includes('won') ? 'player' : 'opponent';

        setTimeout(() => {
            if (winner === 'player') {
                alert('Congratulations! You won the battle!');
            } else {
                alert('You lost the battle. Better luck next time!');
            }

            this.endBattle();
        }, 2000);
    }

    generateRandomTeam() {
        const team = [];
        const allPokemon = dataLoader.getAllPokemon();

        // Select 6 random unique Pokemon
        while (team.length < 6) {
            const randomPokemon = allPokemon[Math.floor(Math.random() * allPokemon.length)];
            if (!team.find(p => p.id === randomPokemon.id)) {
                team.push(randomPokemon);
            }
        }

        return team;
    }

    generateAITeam() {
        // Generate a balanced AI team
        // For now, just use random team
        return this.generateRandomTeam();
    }

    init() {
        // Set up main menu buttons
        document.querySelector('.fight-btn').addEventListener('click', () => {
            this.showMoveMenu();
        });

        document.getElementById('switchBtn').addEventListener('click', () => {
            this.showSwitchMenu();
        });

        // Back buttons
        document.querySelectorAll('.back-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                this.showMainMenu();
            });
        });

        // Battle setup buttons
        document.getElementById('battleAIBtn').addEventListener('click', () => {
            const teamId = document.getElementById('playerTeamSelect').value;

            if (!teamId) {
                alert('Please select a team first!');
                return;
            }

            const playerTeam = teamBuilder.getTeamById(teamId);
            if (!playerTeam || playerTeam.length === 0) {
                alert('Invalid team selected!');
                return;
            }

            const opponentTeam = this.generateAITeam();
            this.startBattle(playerTeam, opponentTeam);
        });

        document.getElementById('battleRandomBtn').addEventListener('click', () => {
            const teamId = document.getElementById('playerTeamSelect').value;

            if (!teamId) {
                alert('Please select a team first!');
                return;
            }

            const playerTeam = teamBuilder.getTeamById(teamId);
            if (!playerTeam || playerTeam.length === 0) {
                alert('Invalid team selected!');
                return;
            }

            const opponentTeam = this.generateRandomTeam();
            this.startBattle(playerTeam, opponentTeam);
        });

        document.getElementById('endBattleBtn').addEventListener('click', () => {
            this.endBattle();
        });
    }
}

// Global battle UI instance
const battleUI = new BattleUI();
