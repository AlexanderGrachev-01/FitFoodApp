//
//  ProfileVC.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 22.12.2021.
//

import UIKit
import FirebaseAuth

class ProfileVC: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func backFromProfile(_ sender: Any) {
        performSegue(withIdentifier: "goBackFromProfile", sender: nil)
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        try? Auth.auth().signOut()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PhoneNumberVC")
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    @IBAction func setUsername(_ sender: Any) {
        userNameLabel.text = usernameTextField.text
    }
    
    @IBAction func setUserHeight(_ sender: Any) {
    }
    
    @IBAction func setUserAge(_ sender: Any) {
    }
    
    @IBAction func setUserWeight(_ sender: Any) {
    }
}
