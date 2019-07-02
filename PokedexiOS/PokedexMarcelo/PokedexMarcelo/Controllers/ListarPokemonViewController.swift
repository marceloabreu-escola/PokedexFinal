//
//  ListarPokemonViewController.swift
//  PokedexMarcelo
//
//  Created by Marcelo Abreu on 27/06/2019.
//  Copyright © 2019 Marcelo Abreu. All rights reserved.
//

import UIKit

class ListarPokemonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    

    public var pokemon = [Pokemon]()
    public var imagemCell: UIImage!
    
    public var filteredPokemon = [Pokemon]()
    public var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ListarPokemonView has loaded!")
        
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //collection view functions
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            //let poke: Pokemon!
            
            if(inSearchMode){
                
                //poke = filteredPokemon[indexPath.row]
                //cell.configureCell(pokemon: poke)
                
            } else {
                
                //poke = pokemon[indexPath.row]
                //cell.configureCell(pokemon: poke)
                
            }
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //var poke: Pokemon!
        
        if(inSearchMode){
            
            //poke = filteredPokemon[indexPath.row]
            
        } else {
            
            //poke = pokemon[indexPath.row]
        }
        
        //performSegue(withIdentifier: "PokemonDetailSegue", sender: poke)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (inSearchMode){
            
            //return filteredPokemon.count
            
        }
        
        return 10
        //return pokemon.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 120, height: 121)
    }
    
    //search bar functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == ""{
            inSearchMode = false
            collection.reloadData()
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            filteredPokemon = pokemon.filter({$0.namePoke.range(of: lower) != nil})
            collection.reloadData()
        }
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailSegue"{
            if let detailsViewController = segue.destination as? PokemonDetailViewController{
                if let poke = sender as? Pokemon{
                    detailsViewController.pokemon = poke
                }
            }
        }
    }
    
}


