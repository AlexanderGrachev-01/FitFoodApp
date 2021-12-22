//
//  FindFoodVC.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 22.12.2021.
//

import UIKit

class FindFoodVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backFromList(_ sender: Any) {
        performSegue(withIdentifier: "goBackFromFoodList", sender: nil)
    }
    
    @IBAction func goToFoodInfo(_ sender: Any) {
        performSegue(withIdentifier: "goToFoodInfo", sender: nil)
    }
}
