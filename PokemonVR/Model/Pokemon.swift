struct Pokemon {
    
    /// The name of the Pokémon.
    let name: String
    
    /// The image name or URL associated with the Pokémon.
    let image: String
    
    /// Initializes a `Pokemon` instance with a dictionary.
    ///
    /// - Parameter dict: A dictionary containing keys `"name"` and `"image"`.
    /// - Note: The dictionary must contain valid values for both keys; otherwise, it will result in a runtime crash due to forced unwrapping.
    init(dict: [String: String]) {
        self.name = dict["name"]!
        self.image = dict["image"]!
    }
}
