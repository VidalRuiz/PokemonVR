

//
//  PokemonDataManager.swift
//  MVC
//
//  Created by Vidal Ruiz.
//

import Foundation


class PokemonDataManager {
    
    //MARK: Properties
    private var pokemons : [Pokemon] = []
    
    
    //MARK: data source array :P
    // Static list of Pokémon with image identifiers and names
    // Consider using a JSON file or a remote API for scalability
    let pokemonsArray = [
        ["image":"0", "name": "Wartortle"],
        ["image":"1", "name": "Bulbasaur"],
        ["image":"2", "name": "Blastoise"],
        ["image":"3", "name":"Butterfree"],
        ["image":"4", "name":"Ivysaur"],
        ["image":"5", "name":"Jigglypuff"],
        ["image":"6", "name":"Charmander"],
        ["image":"7", "name":"Meowth"],
        ["image":"8", "name":"Alakazam"],
        ["image":"9", "name":"Pidgey"],
        ["image":"10", "name":"Raichu"],
        ["image":"11", "name":"Rattata"],
        ["image":"12", "name":"Vaporeon"],
        ["image":"13", "name":"Jynx"],
        ["image":"14", "name":"Venusaur"],
        ["image":"15", "name":"Vulpix"],
        ["image":"16", "name":"Slowbro"],
        ["image":"17", "name":"Dewgong"],
        ["image":"18", "name":"Spearow"],
        ["image":"19", "name":"Wigglytuff"],
        ["image":"20", "name":"Scyther"],
        ["image":"21", "name":"Golduck"],
        ["image":"22", "name":"Lapras"],
        ["image":"23", "name":"Sandshrew"]
    ]
    
    //MARK:Methods
    // Method to populate the 'pokemons' array using the predefined data source
    func fetch() {
        // Avoid duplicate entries by clearing the array first
        pokemons = pokemonsArray.map { Pokemon(dict: $0) }
    }
    
    // Retrieves a Pokemon object at a given index
    func getPokemon(at index: Int) -> Pokemon? {
        // Ensure the index is within the valid range
        guard index >= 0, index < pokemons.count else {
            return nil // Return nil if the index is invalid
        }
        return pokemons[index]
    }
    
    // Returns the number of Pokémon stored in the array
    // Ensures the list is initialized before counting
    func getPokemonCount() -> Int {
        return pokemons.isEmpty ? 0 : pokemons.count
    }
    
}
