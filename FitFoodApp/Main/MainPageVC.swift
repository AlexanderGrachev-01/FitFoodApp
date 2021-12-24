//
//  MainPageVC.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 22.12.2021.
//

import UIKit

class MainPageVC: UIViewController {

    @IBOutlet weak var kcalLabel: UILabel!
    @IBOutlet weak var kcalsWindowView: UIView!
    @IBOutlet weak var carbsWindowView: UIView!
    @IBOutlet weak var carbsCounterLabel: UILabel!
    @IBOutlet weak var proteinWindowView: UIView!
    @IBOutlet weak var proteinCounterLabel: UILabel!
    @IBOutlet weak var fatWindowView: UIView!
    @IBOutlet weak var fatCounterLabel: UILabel!
    @IBOutlet weak var addBreakfastView: UIView!
    @IBOutlet weak var addLunchView: UIView!
    @IBOutlet weak var addDinerView: UIView!
    @IBOutlet weak var addSnacksView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changingTheAppearance()
        
        
        if UserInfo.kcal == nil { UserInfo.kcal = "0" }
            kcalLabel.text = UserInfo.kcal
        if UserInfo.carbs == nil { UserInfo.carbs = "0" }
            carbsCounterLabel.text = UserInfo.carbs
        if UserInfo.protein == nil { UserInfo.protein = "0" }
            proteinCounterLabel.text = UserInfo.protein
        if UserInfo.fat == nil { UserInfo.fat = "0" }
            fatCounterLabel.text = UserInfo.fat
    }
    
    @IBAction func openProfile(_ sender: Any) {
        performSegue(withIdentifier: "goToProfile", sender: nil)
    }
    
    @IBAction func addBreakfast(_ sender: Any) {
        performSegue(withIdentifier: "addSomeFood", sender: nil)
    }
    
    @IBAction func addLunch(_ sender: Any) {
        performSegue(withIdentifier: "addSomeFood", sender: nil)
    }
    
    @IBAction func addDiner(_ sender: Any) {
        performSegue(withIdentifier: "addSomeFood", sender: nil)
    }
    
    @IBAction func addSnacks(_ sender: Any) {
        performSegue(withIdentifier: "addSomeFood", sender: nil)
    }
    
    
    
    
    
    func changingTheAppearance() {
        
        let viewBW: CGFloat = 1
        let buttonBW: CGFloat = 2
        let cornR: CGFloat = 10
        
        kcalsWindowView.layer.borderWidth = viewBW
        carbsWindowView.layer.borderWidth = viewBW
        proteinWindowView.layer.borderWidth = viewBW
        fatWindowView.layer.borderWidth = viewBW
        
        addBreakfastView .layer.borderWidth = buttonBW
        addLunchView.layer.borderWidth = buttonBW
        addDinerView.layer.borderWidth = buttonBW
        addSnacksView.layer.borderWidth = buttonBW
        
        kcalsWindowView.layer.cornerRadius = 100
        carbsWindowView.layer.cornerRadius = cornR
        proteinWindowView.layer.cornerRadius = cornR
        fatWindowView.layer.cornerRadius = cornR
        addBreakfastView.layer.cornerRadius = cornR
        addLunchView.layer.cornerRadius = cornR
        addDinerView.layer.cornerRadius = cornR
        addSnacksView.layer.cornerRadius = cornR
    }
}
