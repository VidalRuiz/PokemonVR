//  Pokemon.swift
//  Description:Represents a Pokémon entity with complete details.
//  Created by Vidal Ruiz.
//  Created Date: March 1st, 2025.
import Foundation

class PokemonDataManager {
    
    //MARK: Properties
    private var pokemons: [Pokemon] = []
    
    //MARK: Static data source array
    // Pokémon list with name, image, moves, and abilities
    let pokemonsArray: [[String: Any]] = [
        ["image": "0", "name": "Wartortle", "moves": ["Water Gun", "Bite"], "abilities": ["Torrent"]],
        ["image": "1", "name": "Bulbasaur", "moves": ["Vine Whip", "Tackle"], "abilities": ["Overgrow"]],
        ["image": "2", "name": "Blastoise", "moves": ["Hydro Pump", "Skull Bash"], "abilities": ["Torrent"]],
        ["image": "3", "name": "Butterfree", "moves": ["Gust", "Confusion"], "abilities": ["Compound Eyes"]],
        ["image": "4", "name": "Ivysaur", "moves": ["Razor Leaf", "Sleep Powder"], "abilities": ["Overgrow"]],
        ["image": "5", "name": "Jigglypuff", "moves": ["Sing", "Pound"], "abilities": ["Cute Charm"]],
        ["image": "6", "name": "Charmander", "moves": ["Flamethrower", "Scratch"], "abilities": ["Blaze"]],
        ["image": "7", "name": "Meowth", "moves": ["Pay Day", "Bite"], "abilities": ["Pickup"]],
        ["image": "8", "name": "Alakazam", "moves": ["Psychic", "Kinesis"], "abilities": ["Synchronize"]],
        ["image": "9", "name": "Pidgey", "moves": ["Gust", "Quick Attack"], "abilities": ["Tangled Feet"]],
        ["image": "10", "name": "Raichu", "moves": ["Thunderbolt", "Quick Attack"], "abilities": ["Static"]],
        ["image": "11", "name": "Rattata", "moves": ["Tackle", "Hyper Fang"], "abilities": ["Run Away"]],
        ["image": "12", "name": "Vaporeon", "moves": ["Water Gun", "Quick Attack"], "abilities": ["Water Absorb"]],
        ["image": "13", "name": "Jynx", "moves": ["Ice Punch", "Lovely Kiss"], "abilities": ["Oblivious"]],
        ["image": "14", "name": "Venusaur", "moves": ["Solar Beam", "Tackle"], "abilities": ["Overgrow"]],
        ["image": "15", "name": "Vulpix", "moves": ["Ember", "Quick Attack"], "abilities": ["Flash Fire"]],
        ["image": "16", "name": "Slowbro", "moves": ["Water Gun", "Confusion"], "abilities": ["Own Tempo"]],
        ["image": "17", "name": "Dewgong", "moves": ["Aurora Beam", "Headbutt"], "abilities": ["Thick Fat"]],
        ["image": "18", "name": "Spearow", "moves": ["Peck", "Fury Attack"], "abilities": ["Keen Eye"]],
        ["image": "19", "name": "Wigglytuff", "moves": ["Sing", "Body Slam"], "abilities": ["Cute Charm"]],
        ["image": "20", "name": "Scyther", "moves": ["Slash", "Wing Attack"], "abilities": ["Swarm"]],
        ["image": "21", "name": "Golduck", "moves": ["Hydro Pump", "Confusion"], "abilities": ["Damp"]],
        ["image": "22", "name": "Lapras", "moves": ["Ice Beam", "Water Gun"], "abilities": ["Water Absorb"]],
        ["image": "23", "name": "Sandshrew", "moves": ["Scratch", "Defense Curl"], "abilities": ["Sand Veil"]]
    ]
    
    //MARK:Methods
    // Method to populate the 'pokemons' array using the predefined data source
    func fetch() {
        // Avoid duplicate entries by clearing the array first
        pokemons = pokemonsArray.map { Pokemon(dict: $0)! }
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
