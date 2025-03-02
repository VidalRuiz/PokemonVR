//  PokemonDetailViewController.swift
//  Description: Create a view controller to show pokemo's details.
//  Created by Vidal Ruiz.
//  Created Date: March 2nd, 2025.

import UIKit
class PokemonDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UI Elements
    /// ImageView to display the Pokémon's artwork.
    private let pokemonImageView = UIImageView()
    /// Label to show the Pokémon's name.
    private let pokemonNameLabel = UILabel()
    /// TableView to display the Pokémon's moves and abilities.
    private let tableView = UITableView()
    /// Button to close the detail view and return to the main list.
    private let closeButton = UIButton(type: .system)

    // MARK: - Data
    /// Holds the selected Pokémon from the main list.
    var pokemon: Pokemon?
    
    // MARK: - Lifecycle
    /// Called after the view has been loaded into memory.
    /// Initializes the UI components and sets up the table view.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    /// Configures and arranges the UI elements programmatically.
    /// This function sets up the Pokémon detail screen, adding a rounded image,
    /// a label for the Pokemon's name, a table view for moves and abilities,
    /// and a close button to dismiss the view.
    private func setupUI() {
        // Set background color to white for a clean design
        view.backgroundColor = UIColor(named: "PrimaryBackground") // Dynamic background

        // MARK: - Pokemon ImageView
        /// Displays the Pokemon's artwork inside a circular frame with a border
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.layer.cornerRadius = 100 // Makes the image circular (200px / 2)
        pokemonImageView.layer.masksToBounds = true
        pokemonImageView.layer.borderWidth = 3
        pokemonImageView.layer.borderColor = UIColor(named: "BorderColor")?.cgColor // Dynamic border color
        view.addSubview(pokemonImageView)
        
        // MARK: - Pokémon Name Label
        /// Displays the Pokémon's name in bold and centered
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        pokemonNameLabel.textAlignment = .center
        pokemonNameLabel.textColor = UIColor(named: "PrimaryText") // Dynamic text color
        view.addSubview(pokemonNameLabel)
        
        // MARK: - TableView for Moves and Abilities
        /// A table view to list the Pokémon's moves and abilities
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "PrimaryBackground") // Match background
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
        view.addSubview(tableView)
        
        // MARK: - Close Button
        /// Button to dismiss the Pokémon detail view
        closeButton.setTitle("Close", for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitleColor(UIColor(named: "PrimaryText"), for: .normal) // Dynamic button color
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(closeButton)
        
        // MARK: - Auto Layout Constraints
        NSLayoutConstraint.activate([
            // Positioning the Pokémon image at the top
            pokemonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 200),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Positioning the name label below the image
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 8),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Positioning the table view below the name label
            tableView.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -16),
            
            // Positioning the close button at the bottom
            closeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    // MARK: - Configuration

    /// Populates the UI with the selected Pokémon's details.
    /// - Parameter pokemon: The selected Pokémon to display.
    func configure(with pokemon: Pokemon) {
        self.pokemon = pokemon
        pokemonImageView.image = UIImage(named: pokemon.image) ?? UIImage(named: "placeholder")
        pokemonNameLabel.text = pokemon.name
        tableView.reloadData() // Refreshes table view with the new Pokémon data.
    }

    // MARK: - TableView Setup

    /// Sets up the TableView by reloading its data.
    private func setupTableView() {
        tableView.reloadData()
    }

    // MARK: - TableView DataSource & Delegate

    /// Returns the number of sections in the table view.
    /// - Moves are displayed in section 0.
    /// - Abilities are displayed in section 1.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // Sections: Moves and Abilities
    }

    /// Returns the number of rows per section.
    /// - The first section (0) contains the Pokémon's moves.
    /// - The second section (1) contains the Pokémon's abilities.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemon = pokemon else { return 0 }
        return section == 0 ? pokemon.moves.count : pokemon.abilities.count
    }

    /// Provides the title for each section in the table.
    /// - "Moves" for section 0.
    /// - "Abilities" for section 1.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "SecondaryBackground") // Darker for Light Mode

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = section == 0 ? "Moves" : "Abilities"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(named: "PrimaryText") // Dynamic text color
        
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }

    /// Configures each table view cell to display the Pokémon's moves and abilities.
    /// - Moves are shown with a 🥋 (karate) icon.
    /// - Abilities are shown with a ⚡ (lightning) icon.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        guard let pokemon = pokemon else { return cell }

        let isMoveSection = indexPath.section == 0
        let text = isMoveSection ? pokemon.moves[indexPath.row] : pokemon.abilities[indexPath.row]

        // Assign an appropriate icon based on the section
        let icon = isMoveSection ? "🥋" : "⚡"

        // Set the cell text with an icon
        cell.textLabel?.text = "\(icon) \(text)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        cell.textLabel?.textColor = .darkGray
        // Use dynamic text color from Assets
        cell.textLabel?.textColor = UIColor(named: "PrimaryText") ?? .label
        
        // Optional: Customize background color for better contrast
        cell.backgroundColor = UIColor(named: "PrimaryBackground") // White for Light Mode, Black for Dark Mode
        
        // Optional: Add a small accessory (arrow) for a professional look
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    // MARK: - Actions

    /// Handles closing the modal when the close button is tapped.
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
