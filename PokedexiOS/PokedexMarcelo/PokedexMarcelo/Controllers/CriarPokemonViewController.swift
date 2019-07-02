//
//  CriarPokemonViewControllwe.swift
//  PokedexMarcelo
//
//  Created by Marcelo Abreu on 27/06/2019.
//  Copyright © 2019 Marcelo Abreu. All rights reserved.
//

import UIKit

class CriarPokemonViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    //
    //
    //Picker Setup
    //
    //
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedType = types[pickerView.selectedRow(inComponent: 0)]
        //let selectedSubType = types[pickerView.selectedRow(inComponent: 1)]
        
        typeLabelValue.text = selectedType
        //subTypeLabelValue.text = selectedSubType
    }
    //
    //
    //
    //
    
    
    //Class Reference
    var addPokemon:Pokemon?
    
    //TextFields
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descricaoField: UITextField!
    
    @IBOutlet weak var XPField: UITextField!
    @IBOutlet weak var HPField: UITextField!
    @IBOutlet weak var powerField: UITextField!
    
    @IBOutlet weak var evolutionField: UITextField!
    
    
    //PickerViews
    @IBOutlet weak var typePickerField: UIPickerView!
    @IBOutlet weak var subTypePickerField: UIPickerView!
    
    
    ///pokemon types
    let types = ["None", "Water", "Fire", "Grass", "Ground",
    "Rock", "Steel", "Ice", "Electric", "Dragon",
    "Ghost", "Psychic", "Normal", "Fighting", "Poison",
    "Bug", "Flying", "Dark", "Fairy"]
    
    //ImageView to upload Image
    @IBOutlet weak var pokeImageField: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    //validation label
    @IBOutlet weak var validationLabel: UILabel!
    
    
    @IBOutlet weak var typeLabelValue: UILabel!
    @IBOutlet weak var subTypeLabelValue: UILabel!
    
    public var isValidated: Bool!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        descricaoField.delegate = self
        
        imagePicker.delegate = self
        
        XPField.delegate = self
        HPField.delegate = self
        powerField.delegate = self
        evolutionField.delegate = self
        
        validationLabel.isHidden = true
        typeLabelValue.isHidden = true
        subTypeLabelValue.isHidden = true
        
        isValidated = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // upload button clicked
    @IBAction func uploadTapped(_ sender: Any){
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func validateValues(){
        
        guard let _ = nameField.text, nameField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "Enter the Pokemon's name."
            return
            
        }
        
        guard let _ = descricaoField.text, descricaoField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "Say something nice!"
            return
            
        }
        
        guard let _ = XPField.text, XPField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "He must have some XP!"
            return
            
        }
        
        guard let _ = HPField.text, HPField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "Come on... s/he is not a Walker!"
            return
            
        }
        
        guard let _ = powerField.text, powerField.text?.count != 0 else{
            
            validationLabel.isHidden = false
            validationLabel.text = "S/He's stronger than you give him/her power"
            return
            
        }
        
        
        
        validationLabel.isHidden = true
        isValidated = true
        print("All camps validated")
        
        
    }
    
    //add Pokemon Button Clicked
    @IBAction func addTapped(_ sender: Any) {
        
        validateValues()
        
        let XPvalue = Int(XPField.text!)
        let HPvalue = Int(HPField.text!)
        let powerValue = Int(powerField.text!)
        
        
        //done
        if(isValidated){
            
            addPokemon = Pokemon(name: nameField.text ?? "", type: typeLabelValue.text ?? "", subType: typeLabelValue.text ?? "", description: descricaoField.text ?? "", xp: XPvalue ?? 00, hp:  HPvalue ?? 00, power: powerValue ?? 00, evolution: evolutionField.text ?? "None")
        
        } else {
            
            validationLabel.text = "Please complete all camps!"
            
        }
        
        //func prepare(for segue: UIStoryboardSegue, sender: Any?)
        //{
            //if segue.destination is ListarPokemonViewController
            //{
                //let vc = segue.destination as? ListarPokemonViewController
                //vc?.pokemon = addPokemon
                //vc?.newImagemCell = pokeImageField.image
            //}
        //}
        
    }
    ///Return number pad keyboard when touch anywhere
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        XPField.resignFirstResponder()
        HPField.resignFirstResponder()
        powerField.resignFirstResponder()
        
    }
    
}

//Delegate for textfields
extension CriarPokemonViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn (_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
}

extension CriarPokemonViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            pokeImageField.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
