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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodNameLabel.text = foodInfo.name
        foodKcalLabel.text = foodInfo.kcal
        foodCarbsLabel.text = foodInfo.carbs
        foodProteinLabel.text = foodInfo.protein
        foodFatLabel.text = foodInfo.fat
    }
    @IBAction func goToMainFromFoodinfo(_ sender: Any) {
        performSegue(withIdentifier: "backToFoodList", sender: nil)
    }
}
