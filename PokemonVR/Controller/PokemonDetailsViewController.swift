//
//  PokemonDetailViewController.swift
//  PokemonVR
//
//  Created by Vidal Ruiz.
//

import UIKit

class PokemonDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // UI Elements
    private let pokemonImageView = UIImageView()
    private let pokemonNameLabel = UILabel()
    private let tableView = UITableView()
    private let closeButton = UIButton(type: .system)
    
    var pokemon: Pokemon? // Holds the selected Pokémon
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    /// Sets up the UI elements programmatically
    private func setupUI() {
        view.backgroundColor = .white
        
        // Pokémon Image
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        pokemonImageView.contentMode = .scaleAspectFit
        view.addSubview(pokemonImageView)
        
        // Pokémon Name Label
        pokemonNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        pokemonNameLabel.textAlignment = .center
        view.addSubview(pokemonNameLabel)
        
        // TableView for Moves and Abilities
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "detailCell")
        view.addSubview(tableView)
        
        // Close Button
        closeButton.setTitle("Close", for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(closeButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            // ImageView Constraints
            pokemonImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            pokemonImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 200),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Name Label Constraints
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 8),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // TableView Constraints
            tableView.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -16),
            
            // Close Button Constraints
            closeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    /// Sets up the TableView sections and cells
    private func setupTableView() {
        tableView.reloadData()
    }
    
    /// Populates the UI with the selected Pokémon's details
    func configure(with pokemon: Pokemon) {
        self.pokemon = pokemon
        pokemonImageView.image = UIImage(named: pokemon.image) ?? UIImage(named: "placeholder")
        pokemonNameLabel.text = pokemon.name
        tableView.reloadData() // Refresh table with Pokémon data
    }
    
    /// Handles closing the modal when button is tapped
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - TableView DataSource & Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // Moves and Abilities
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pokemon = pokemon else { return 0 }
        return section == 0 ? pokemon.moves.count : pokemon.abilities.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Moves" : "Abilities"
    }
    
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
        
        // Optional: Add a small accessory (arrow) for a professional look
        cell.accessoryType = .disclosureIndicator

        return cell
    }
}
