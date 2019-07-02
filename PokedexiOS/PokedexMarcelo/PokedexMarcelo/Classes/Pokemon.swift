//
//  Pokedex.swift
//  PokedexMarcelo
//
//  Created by Marcelo Abreu on 27/06/2019.
//  Copyright © 2019 Marcelo Abreu. All rights reserved.
//

import Foundation

class Pokemon{
    
    public var namePoke:String!
    public var typePoke:String
    public var subTypePoke:String
    public var descriptionPoke:String
    public var xpPoke:Int
    public var hpPoke:Int
    public var powerPoke:Int
    
    public var evolutionName:String
    let number = Int.random(in: 1 ... 30)
    
    init(name:String, type:String, subType:String, description:String, xp:Int, hp:Int, power:Int, evolution:String){
        self.namePoke = name
        self.typePoke = type
        self.subTypePoke = subType
        self.descriptionPoke = description
        self.xpPoke = xp
        self.hpPoke = hp
        self.powerPoke = power
        self.evolutionName = evolution
    }
    
    func Evoluir() -> Void {
        
        print(number)
        
        if evolutionName == "None" {
            //Warning "No Evolution Possible"
        } else {
            self.namePoke = evolutionName
            self.xpPoke += number
            self.hpPoke += number
            self.powerPoke += number
        }
        
    }
    
}
