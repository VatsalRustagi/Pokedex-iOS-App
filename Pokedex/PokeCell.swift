//
//  PokeCell.swift
//  Pokedex
//
//  Created by Vatsal Rustagi on 5/19/17.
//  Copyright © 2017 Vatsalr23. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func updateUI(pokemon: Pokemon){
        pokemonImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokemonLabel.text = pokemon.name.capitalized
    }
}
