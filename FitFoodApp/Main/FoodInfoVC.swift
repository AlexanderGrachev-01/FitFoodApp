//
//  FoodInfoVC.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 22.12.2021.
//

import UIKit

class FoodInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func goToMainFromFoodinfo(_ sender: Any) {
        performSegue(withIdentifier: "goBackFromFoodInfo", sender: nil)
    }
}
