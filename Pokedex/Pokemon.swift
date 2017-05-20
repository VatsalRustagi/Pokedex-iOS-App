//
//  File.swift
//  Pokedex
//
//  Created by Vatsal Rustagi on 5/19/17.
//  Copyright © 2017 Vatsalr23. All rights reserved.
//

import Foundation

class Pokemon{
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String{
        return _name
    }
    
    var pokedexId: Int{
        return _pokedexId
    }
    
    init(name: String, id: Int){
        _name = name
        _pokedexId = id
    }
}
