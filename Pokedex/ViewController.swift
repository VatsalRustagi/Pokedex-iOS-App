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
    var pokemons = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pokemonCollectionView.delegate = self
        self.pokemonCollectionView.dataSource = self
        
        parsePokemonCSV()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parsePokemonCSV(){
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows{
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, id: pokeId)
                pokemons.append(poke)
            }
        }
        catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: "pokecell", for: indexPath) as? PokeCell{
            cell.updateUI(pokemon: pokemons[indexPath.row])
            return cell
            //cell.updateUI(pokemon: pokemons[indexPath.row])
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
}

