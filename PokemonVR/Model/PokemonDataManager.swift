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
        ["image": "0", "name": "Wartortle", "moves": ["Water Gun", "Bite", "Rapid Spin"], "abilities": ["Torrent", "Rain Dish"]],
        ["image": "1", "name": "Bulbasaur", "moves": ["Vine Whip", "Tackle", "Leech Seed"], "abilities": ["Overgrow", "Chlorophyll"]],
        ["image": "2", "name": "Blastoise", "moves": ["Hydro Pump", "Skull Bash", "Aqua Tail"], "abilities": ["Torrent", "Rain Dish"]],
        ["image": "3", "name": "Butterfree", "moves": ["Gust", "Confusion", "Silver Wind"], "abilities": ["Compound Eyes", "Tinted Lens"]],
        ["image": "4", "name": "Ivysaur", "moves": ["Razor Leaf", "Sleep Powder", "Sludge Bomb"], "abilities": ["Overgrow", "Chlorophyll"]],
        ["image": "5", "name": "Jigglypuff", "moves": ["Sing", "Pound", "Double Slap"], "abilities": ["Cute Charm", "Competitive"]],
        ["image": "6", "name": "Charmander", "moves": ["Flamethrower", "Scratch", "Dragon Claw"], "abilities": ["Blaze", "Solar Power"]],
        ["image": "7", "name": "Meowth", "moves": ["Pay Day", "Bite", "Fury Swipes"], "abilities": ["Pickup", "Technician"]],
        ["image": "8", "name": "Alakazam", "moves": ["Psychic", "Kinesis", "Shadow Ball"], "abilities": ["Synchronize", "Inner Focus"]],
        ["image": "9", "name": "Pidgey", "moves": ["Gust", "Quick Attack", "Wing Attack"], "abilities": ["Tangled Feet", "Big Pecks"]],
        ["image": "10", "name": "Raichu", "moves": ["Thunderbolt", "Quick Attack", "Iron Tail"], "abilities": ["Static", "Surge Surfer"]],
        ["image": "11", "name": "Rattata", "moves": ["Tackle", "Hyper Fang", "Quick Attack"], "abilities": ["Run Away", "Guts"]],
        ["image": "12", "name": "Vaporeon", "moves": ["Water Gun", "Quick Attack", "Aurora Beam"], "abilities": ["Water Absorb", "Hydration"]],
        ["image": "13", "name": "Jynx", "moves": ["Ice Punch", "Lovely Kiss", "Psychic"], "abilities": ["Oblivious", "Forewarn"]],
        ["image": "14", "name": "Venusaur", "moves": ["Solar Beam", "Tackle", "Sludge Bomb"], "abilities": ["Overgrow", "Chlorophyll"]],
        ["image": "15", "name": "Vulpix", "moves": ["Ember", "Quick Attack", "Flamethrower"], "abilities": ["Flash Fire", "Drought"]],
        ["image": "16", "name": "Slowbro", "moves": ["Water Gun", "Confusion", "Surf"], "abilities": ["Own Tempo", "Regenerator"]],
        ["image": "17", "name": "Dewgong", "moves": ["Aurora Beam", "Headbutt", "Ice Beam"], "abilities": ["Thick Fat", "Ice Body"]],
        ["image": "18", "name": "Spearow", "moves": ["Peck", "Fury Attack", "Drill Peck"], "abilities": ["Keen Eye", "Sniper"]],
        ["image": "19", "name": "Wigglytuff", "moves": ["Sing", "Body Slam", "Dazzling Gleam"], "abilities": ["Cute Charm", "Competitive"]],
        ["image": "20", "name": "Scyther", "moves": ["Slash", "Wing Attack", "X-Scissor"], "abilities": ["Swarm", "Technician"]],
        ["image": "21", "name": "Golduck", "moves": ["Hydro Pump", "Confusion", "Psychic"], "abilities": ["Damp", "Cloud Nine"]],
        ["image": "22", "name": "Lapras", "moves": ["Ice Beam", "Water Gun", "Surf"], "abilities": ["Water Absorb", "Shell Armor"]],
        ["image": "23", "name": "Sandshrew", "moves": ["Scratch", "Defense Curl", "Earthquake"], "abilities": ["Sand Veil", "Sand Rush"]]
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
