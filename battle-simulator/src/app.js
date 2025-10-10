// Main Application - Initializes and manages the app

class App {
    constructor() {
        this.currentSection = 'teamBuilder';
    }

    async init() {
        console.log('Initializing Pokemon Battle Simulator...');

        // Show loading message
        this.showLoading();

        // Load all data
        const loaded = await dataLoader.loadAll();

        if (!loaded) {
            alert('Failed to load Pokemon data. Please refresh the page.');
            return;
        }

        // Hide loading message
        this.hideLoading();

        // Initialize components
        teamBuilder.init();
        battleUI.init();

        // Set up navigation
        this.setupNavigation();

        // Show team builder by default
        this.showSection('teamBuilder');

        console.log('App initialized successfully!');
    }

    setupNavigation() {
        const teamBuilderBtn = document.getElementById('teamBuilderBtn');
        const battleBtn = document.getElementById('battleBtn');

        teamBuilderBtn.addEventListener('click', () => {
            this.showSection('teamBuilder');
        });

        battleBtn.addEventListener('click', () => {
            this.showSection('battle');
        });
    }

    showSection(sectionName) {
        // Update navigation buttons
        document.querySelectorAll('.nav-btn').forEach(btn => {
            btn.classList.remove('active');
        });

        // Hide all sections
        document.querySelectorAll('.section').forEach(section => {
            section.classList.remove('active');
        });

        // Show selected section
        if (sectionName === 'teamBuilder') {
            document.getElementById('teamBuilderBtn').classList.add('active');
            document.getElementById('teamBuilderSection').classList.add('active');
        } else if (sectionName === 'battle') {
            document.getElementById('battleBtn').classList.add('active');
            document.getElementById('battleSection').classList.add('active');

            // Make sure battle setup is visible
            document.getElementById('battleSetup').style.display = 'block';
            document.getElementById('battleScreen').style.display = 'none';
        }

        this.currentSection = sectionName;
    }

    showLoading() {
        const loadingDiv = document.createElement('div');
        loadingDiv.id = 'loading';
        loadingDiv.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.8);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            color: white;
            font-size: 1.5rem;
        `;
        loadingDiv.innerHTML = '<div>Loading Pokemon data...</div>';
        document.body.appendChild(loadingDiv);
    }

    hideLoading() {
        const loadingDiv = document.getElementById('loading');
        if (loadingDiv) {
            loadingDiv.remove();
        }
    }
}

// Initialize app when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    const app = new App();
    app.init();
});
