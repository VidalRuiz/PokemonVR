//
//  PokemonCell.swift
//  MVC
//
//  Created by Vidal Ruiz.
//

import UIKit

/// `PokemonCell` is a custom `UITableViewCell` that displays basic information
/// about a Pokémon, including its name and image. It is used in the Pokémon list
/// within `PokemonListViewController`.
///
/// ### Related Files:
/// - `Main.storyboard`: Contains the cell design and UI elements.
/// - `PokemonListViewController.swift`: Uses this cell to display Pokémon.
/// - `PokemonDataManager.swift`: Provides Pokémon data to populate the cell.
///
/// This class is connected to a prototype cell in the `UITableView` inside `Main.storyboard`.
/// The cell has an `UIImageView` for displaying the Pokémon's sprite and a `UILabel`
/// for displaying its name.
class PokemonCell: UITableViewCell {

    /// `UIImageView` for displaying the Pokémon's image.
    /// - Connected to the storyboard via an `IBOutlet`.
    @IBOutlet weak var pokemonImage: UIImageView!
    
    /// `UILabel` for displaying the Pokémon's name.
    /// - Connected to the storyboard via an `IBOutlet`.
    @IBOutlet weak var pokemonLabel: UILabel!
    
    /// Called when the cell is initialized from a storyboard or XIB.
    /// Used for any one-time setup (if needed).
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    /// Called when the cell's selection state changes.
    /// - Parameters:
    ///   - selected: A Boolean indicating whether the cell is selected.
    ///   - animated: A Boolean indicating whether the selection should be animated.
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Configures the cell’s appearance and UI settings.
    /// - Sets rounded corners for the Pokémon image.
    /// - Ensures smooth rendering.
    private func setupUI() {
        pokemonImage.layer.cornerRadius = 10
        pokemonImage.clipsToBounds = true
    }
    
    /// Populates the cell with Pokémon data.
    /// - Parameter pokemon: A `Pokemon` object containing the name and image.
    func configure(with pokemon: Pokemon) {
        pokemonLabel.text = pokemon.name
        pokemonImage.image = UIImage(named: pokemon.image) ?? UIImage(named: "placeholder")
    }
}
