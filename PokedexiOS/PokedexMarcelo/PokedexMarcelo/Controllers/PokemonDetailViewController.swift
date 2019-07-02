//
//  PokemonDetailViewController.swift
//  PokedexMarcelo
//
//  Created by Developer on 02/07/2019.
//  Copyright © 2019 Marcelo Abreu. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var xpPokemonLabel: UILabel!
    
    @IBOutlet weak var hpPokemonLAbel: UILabel!
    
    
    @IBOutlet weak var powerPokemonLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var evolutionImage: UIImageView!
    
    @IBOutlet weak var evolucaoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

}
