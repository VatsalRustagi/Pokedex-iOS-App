//
//  ViewController.swift
//  Pokedex
//
//  Created by Vatsal Rustagi on 5/19/17.
//  Copyright © 2017 Vatsalr23. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    //let pokemons = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pokemonCollectionView.delegate = self
        self.pokemonCollectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: "pokecell", for: indexPath) as? PokeCell{
            
            
            cell.updateUI(pokemon: Pokemon(name: "pokemon", id: indexPath.row+1))
            return cell
            //cell.updateUI(pokemon: pokemons[indexPath.row])
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
}

