//
//  PokemonTableViewCell.swift
//  PokedexTest
//
//  Created by Pedro Toro on 10/4/23.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokemonImage.layer.cornerRadius =  15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
