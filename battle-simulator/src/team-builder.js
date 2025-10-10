// Team Builder - Manages team creation and storage

class TeamBuilder {
    constructor() {
        this.currentTeam = [];
        this.savedTeams = this.loadTeams();
        this.currentTeamName = '';
        this.selectedTeam = null;
    }

    loadTeams() {
        const saved = localStorage.getItem('pokemonTeams');
        return saved ? JSON.parse(saved) : [];
    }

    saveTeams() {
        localStorage.setItem('pokemonTeams', JSON.stringify(this.savedTeams));
    }

    addToCurrentTeam(pokemon) {
        if (this.currentTeam.length >= 6) {
            alert('Team is full! Maximum 6 Pokemon per team.');
            return false;
        }

        if (this.currentTeam.find(p => p.id === pokemon.id)) {
            alert('This Pokemon is already in your team!');
            return false;
        }

        this.currentTeam.push(pokemon);
        this.renderCurrentTeam();
        return true;
    }

    removeFromCurrentTeam(index) {
        this.currentTeam.splice(index, 1);
        this.renderCurrentTeam();
    }

    clearCurrentTeam() {
        if (this.currentTeam.length === 0) return;

        if (confirm('Are you sure you want to clear the current team?')) {
            this.currentTeam = [];
            this.currentTeamName = '';
            document.getElementById('teamName').value = '';
            this.renderCurrentTeam();
        }
    }

    saveCurrentTeam() {
        const teamName = document.getElementById('teamName').value.trim();

        if (!teamName) {
            alert('Please enter a team name!');
            return false;
        }

        if (this.currentTeam.length === 0) {
            alert('Cannot save an empty team!');
            return false;
        }

        const team = {
            id: Date.now(),
            name: teamName,
            pokemon: this.currentTeam.map(p => p.id),
            createdAt: new Date().toISOString()
        };

        // Check if updating existing team
        const existingIndex = this.savedTeams.findIndex(t => t.name === teamName);
        if (existingIndex !== -1) {
            if (confirm('A team with this name already exists. Overwrite it?')) {
                this.savedTeams[existingIndex] = team;
            } else {
                return false;
            }
        } else {
            this.savedTeams.push(team);
        }

        this.saveTeams();
        this.renderSavedTeams();
        alert('Team saved successfully!');
        return true;
    }

    loadTeam(teamId) {
        const team = this.savedTeams.find(t => t.id === teamId);
        if (!team) return false;

        this.currentTeam = team.pokemon.map(id => dataLoader.getPokemon(id));
        this.currentTeamName = team.name;
        document.getElementById('teamName').value = team.name;
        this.selectedTeam = team;

        this.renderCurrentTeam();
        return true;
    }

    deleteTeam(teamId) {
        if (!confirm('Are you sure you want to delete this team?')) {
            return false;
        }

        this.savedTeams = this.savedTeams.filter(t => t.id !== teamId);
        this.saveTeams();
        this.renderSavedTeams();
        return true;
    }

    renderPokemonList(searchTerm = '') {
        const pokemonList = document.getElementById('pokemonList');
        pokemonList.innerHTML = '';

        const filtered = dataLoader.getAllPokemon().filter(p =>
            p.name.toLowerCase().includes(searchTerm.toLowerCase())
        );

        filtered.forEach(pokemon => {
            const card = document.createElement('div');
            card.className = 'pokemon-card';
            card.innerHTML = `
                <div class="pokemon-card-name">${pokemon.name}</div>
                <div class="pokemon-card-types">
                    ${pokemon.types.map(type =>
                        `<span class="type-badge ${type}">${type}</span>`
                    ).join('')}
                </div>
                <div class="pokemon-card-stats">
                    HP: ${pokemon.stats.hp} | ATK: ${pokemon.stats.attack} | DEF: ${pokemon.stats.defense}
                </div>
            `;

            card.addEventListener('click', () => {
                this.addToCurrentTeam(pokemon);
            });

            pokemonList.appendChild(card);
        });
    }

    renderCurrentTeam() {
        const currentTeamDiv = document.getElementById('currentTeam');
        currentTeamDiv.innerHTML = '';

        if (this.currentTeam.length === 0) {
            currentTeamDiv.innerHTML = '<p style="text-align: center; color: #999; padding: 2rem;">No Pokemon in team. Click on Pokemon to add them.</p>';
            return;
        }

        this.currentTeam.forEach((pokemon, index) => {
            const slot = document.createElement('div');
            slot.className = 'team-slot';
            slot.innerHTML = `
                <span class="team-slot-pokemon">
                    ${index + 1}. ${pokemon.name}
                    ${pokemon.types.map(type =>
                        `<span class="type-badge ${type}" style="margin-left: 0.5rem;">${type}</span>`
                    ).join('')}
                </span>
                <button class="remove-btn" data-index="${index}">Remove</button>
            `;

            slot.querySelector('.remove-btn').addEventListener('click', (e) => {
                e.stopPropagation();
                this.removeFromCurrentTeam(index);
            });

            currentTeamDiv.appendChild(slot);
        });
    }

    renderSavedTeams() {
        const teamsList = document.getElementById('teamsList');
        teamsList.innerHTML = '';

        if (this.savedTeams.length === 0) {
            teamsList.innerHTML = '<p style="text-align: center; color: #999;">No saved teams yet.</p>';
            return;
        }

        this.savedTeams.forEach(team => {
            const teamItem = document.createElement('div');
            teamItem.className = 'team-item';
            if (this.selectedTeam && this.selectedTeam.id === team.id) {
                teamItem.classList.add('selected');
            }

            const pokemonNames = team.pokemon
                .map(id => dataLoader.getPokemon(id)?.name || 'Unknown')
                .join(', ');

            teamItem.innerHTML = `
                <h4>${team.name}</h4>
                <div class="team-item-pokemon">${pokemonNames}</div>
            `;

            teamItem.addEventListener('click', () => {
                this.loadTeam(team.id);
                this.renderSavedTeams(); // Re-render to show selection
            });

            // Add delete button
            const deleteBtn = document.createElement('button');
            deleteBtn.textContent = 'Delete';
            deleteBtn.className = 'remove-btn';
            deleteBtn.style.marginTop = '0.5rem';
            deleteBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                this.deleteTeam(team.id);
            });

            teamItem.appendChild(deleteBtn);
            teamsList.appendChild(teamItem);
        });

        // Update battle setup team selector
        this.updateBattleTeamSelector();
    }

    updateBattleTeamSelector() {
        const selector = document.getElementById('playerTeamSelect');
        if (!selector) return;

        selector.innerHTML = '<option value="">Select a team...</option>';

        this.savedTeams.forEach(team => {
            const option = document.createElement('option');
            option.value = team.id;
            option.textContent = team.name;
            selector.appendChild(option);
        });
    }

    getTeamById(teamId) {
        const team = this.savedTeams.find(t => t.id === parseInt(teamId));
        if (!team) return null;

        return team.pokemon.map(id => dataLoader.getPokemon(id));
    }

    init() {
        // Set up event listeners
        document.getElementById('newTeamBtn').addEventListener('click', () => {
            this.clearCurrentTeam();
        });

        document.getElementById('saveTeamBtn').addEventListener('click', () => {
            this.saveCurrentTeam();
        });

        document.getElementById('clearTeamBtn').addEventListener('click', () => {
            this.clearCurrentTeam();
        });

        document.getElementById('pokemonSearch').addEventListener('input', (e) => {
            this.renderPokemonList(e.target.value);
        });

        // Initial render
        this.renderPokemonList();
        this.renderCurrentTeam();
        this.renderSavedTeams();
    }
}

// Global team builder instance
const teamBuilder = new TeamBuilder();
