//
//  DetallePokemonViewController.swift
//  PokedexTest
//
//  Created by Pedro Toro on 10/6/23.
//

import UIKit

class DetallePokemonViewController: UIViewController {
    
// MARK - Variables
    
    var pokemonShow: Pokemon?
    
// MARK - IBoutles
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonDescription: UITextView!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//Mostrar imagen
        pokemonImage.loadfrom(URLAddres: pokemonShow?.imageUrl ?? "")
        pokemonType.text = "Type: \(pokemonShow?.type ?? "")"
        pokemonAttack.text = "Attack: \(pokemonShow!.attack)"
        pokemonDefense.text = "Defense: \(pokemonShow!.defense)"
        pokemonDescription.text = pokemonShow?.description ?? ""
    }
}

extension UIImageView {
    func loadfrom(URLAddres: String) {
        guard let url = URL(string: URLAddres) else { return }
        
        DispatchQueue.main.async { [weak self] in
            if let imagenData = try? Data(contentsOf: url) {
                if let loadedimage = UIImage(data: imagenData) {
                    self?.image = loadedimage
                }
            }
        }
    }
}
