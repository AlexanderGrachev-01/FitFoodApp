//
//  FoodInfoVC.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 22.12.2021.
//

import UIKit

class FoodInfoVC: UIViewController {
    
    var foodInfo = FoodItem(name: "",
                            kcal: "",
                            carbs: "",
                            protein: "",
                            fat: "")

    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodKcalLabel: UILabel!
    @IBOutlet weak var foodCarbsLabel: UILabel!
    @IBOutlet weak var foodProteinLabel: UILabel!
    @IBOutlet weak var foodFatLabel: UILabel!
    @IBOutlet weak var resultCkalLabel: UILabel!
    @IBOutlet weak var gramTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodNameLabel.text = foodInfo.name
        foodKcalLabel.text = foodInfo.kcal
        foodCarbsLabel.text = foodInfo.carbs
        foodProteinLabel.text = foodInfo.protein
        foodFatLabel.text = foodInfo.fat
        
        gramTextField?.delegate = self
    }
    
    @IBAction func gramChanged(_ sender: Any) {
        resultCkalLabel.text = gramTextField.text
    }
    
        @IBAction func goToMainFromFoodinfo(_ sender: Any) {
        performSegue(withIdentifier: "backToFoodList", sender: nil)
    }
    
    @IBAction func addFoodAndGoOut(_ sender: Any) {
        performSegue(withIdentifier: "goBackFromFoodInfo", sender: nil)
    }
    
}


extension FoodInfoVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
}
