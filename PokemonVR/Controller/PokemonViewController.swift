//  PokemonViewController.swift
//  Description:Represents a Pokemon entity with complete details.
//  Created by Vidal Ruiz.
//  Created Date: March 2nd, 2025.

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    
    let dataManager = PokemonDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup TableView delegate & data source
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        
        // Fetch Pokemon data
        dataManager.fetch()
        pokemonTableView.reloadData()
    }
}

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.getPokemonCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        if let pokemon = dataManager.getPokemon(at: indexPath.row) {
            cell.pokemonLabel.text = pokemon.name
            cell.pokemonImage.image = UIImage(named: pokemon.image) ?? UIImage(named: "placeholder")
        } else {
            cell.pokemonLabel.text = "Unknown"
            cell.pokemonImage.image = UIImage(named: "placeholder")
        }

        return cell
    }
    
    /// Detects when a row is selected and prints the Pokémon's ID.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        guard let selectedPokemon = dataManager.getPokemon(at: indexPath.row) else { return }
        
        print("Selected Pokémon: \(selectedPokemon.name), ID: \(indexPath.row), Image: \(selectedPokemon.image) ")
        // Print Pokémon Moves
        let movesList = selectedPokemon.moves.joined(separator: ", ")
        print("Moves: \(movesList)")
        
        // Print Pokémon Moves
        let abilitiesList = selectedPokemon.abilities.joined(separator: ", ")
        print("Abilities: \(abilitiesList)")
        // Later, we'll present the Pokémon Detail View here.
        
        
        let detailVC = PokemonDetailViewController()
            detailVC.configure(with: selectedPokemon) // Pass Pokémon data
            detailVC.modalPresentationStyle = .automatic
            present(detailVC, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIImageView(image: UIImage(named: "Pokemon"))
    }
}
