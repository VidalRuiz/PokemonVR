//  Pokemon.swift
//  Description:Represents a Pokémon entity with complete details.
//  Created by Vidal Ruiz.
//  Created Date: March 1st, 2025.
///
struct Pokemon: Codable {
    
    /// The name of the Pokémon.
    let name: String
    
    /// The image name  associated with the Pokémon.
    let image: String
    
    /// A list of moves that the Pokémon can perform.
    let moves: [String]
    
    /// The Pokémon's abilities.
    let abilities: [String]
    
    /// Initializes a `Pokemon` instance from a dictionary.
    ///
    /// - Parameter dict: A dictionary containing `"name"`, `"image"`, `"moves"`, and `"abilities"`.
    /// - Returns: `nil` if any required key is missing.
    init?(dict: [String: Any]) {
        guard let name = dict["name"] as? String,
              let image = dict["image"] as? String,
              let moves = dict["moves"] as? [String],
              let abilities = dict["abilities"] as? [String]
        else {
            return nil
        }
        self.name = name
        self.image = image
        self.moves = moves
        self.abilities = abilities
    }
}
