//
//  PokeCell.swift
//  PokedexMarcelo
//
//  Created by Aluno_Istec on 02/07/2019.
//  Copyright © 2019 Marcelo Abreu. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 8.0
    }
    
    func configureCell(pokemon: Pokemon){
        
        self.pokemon = pokemon
        
        //passar nome do pokemon criado
        nameLabel.text = self.pokemon.namePoke.capitalized
        //passar imagem adicionada no pokemon
        //thumbImage.image = passedImage
        
        
        
    }
    
    
    
    
    
}
