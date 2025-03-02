//
//  PokemonViewController.swift
//  MVC
//
//  Created by Vidal Ruiz.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokemonTableView: UITableView!
    
    let dataManager = PokemonDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataManager.fetch()
//        var i = 0
//        while i < dataManager.countPokemons() {
//            print(dataManager.getPokemon(at: i))
//            i += 1
//        }
    }
}


extension PokemonViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.getPokemonCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        
        if let pokemon = dataManager.getPokemon(at: indexPath.row) {
            cell.pokemonLabel.text = pokemon.name
            cell.pokemonImage.image = UIImage(named: pokemon.image)
        } else {
            cell.pokemonLabel.text = "Unknown"
            cell.pokemonImage.image = UIImage(named: "placeholder") // Provide a default image
        }

        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Pokemon"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIImageView.init(image: UIImage(named: "Pokemon"))
    }

}
