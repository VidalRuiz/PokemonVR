//
//  PokemonViewController.swift
//  Description: Displays a list of Pokémon and allows selection to view details.
//  Created by Vidal Ruiz.
//  Created Date: March 2nd, 2025.
//

import UIKit

/// Controls the main Pokémon list view, allowing users to select a Pokémon
/// and view its detailed information in a new modal.
class PokemonViewController: UIViewController {

    // MARK: - UI Elements
    
    /// TableView to display the list of Pokémon.
    @IBOutlet weak var pokemonTableView: UITableView!
    
    // MARK: - Properties
    
    /// Manages Pokemon data retrieval.
    let dataManager = PokemonDataManager()
    
    // MARK: - Lifecycle
    
    /// Called after the view has been loaded into memory.
    /// Sets up the table view and fetches Pokémon data.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup TableView delegate & data source
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        
        // Fetch and load Pokémon data
        dataManager.fetch()
        pokemonTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    /// Returns the number of Pokémon available in the list.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.getPokemonCount()
    }
    
    /// Configures each table cell with Pokémon data.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        // Retrieve Pokémon data
        if let pokemon = dataManager.getPokemon(at: indexPath.row) {
            cell.pokemonLabel.text = pokemon.name
            cell.pokemonImage.image = UIImage(named: pokemon.image) ?? UIImage(named: "placeholder")
        } else {
            cell.pokemonLabel.text = "Unknown"
            cell.pokemonImage.image = UIImage(named: "placeholder")
        }

        return cell
    }
    
    /// Handles the selection of a Pokémon in the list.
    /// - Prints the Pokémon's details to the console.
    /// - Opens the detail view to display the selected Pokémon's full information.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedPokemon = dataManager.getPokemon(at: indexPath.row) else { return }
        
        // Debugging Output: Prints Pokémon details
        print("Selected Pokémon: \(selectedPokemon.name), ID: \(indexPath.row), Image: \(selectedPokemon.image)")
        let movesList = selectedPokemon.moves.joined(separator: ", ")
        print("Moves: \(movesList)")
        let abilitiesList = selectedPokemon.abilities.joined(separator: ", ")
        print("Abilities: \(abilitiesList)")
        
        // Present the Pokémon detail view
        let detailVC = PokemonDetailViewController()
        detailVC.configure(with: selectedPokemon) // Pass Pokémon data
        //detailVC.modalPresentationStyle = .automatic
        //present(detailVC, animated: true, completion: nil)
        detailVC.modalTransitionStyle = .crossDissolve  // Smooth fade-in effect
        present(detailVC, animated: true, completion: nil)
    }

    /// Sets a custom header view for the Pokémon list.
    /// - Returns an image header with the Pokémon logo.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIImageView(image: UIImage(named: "Pokemon"))
    }
}
