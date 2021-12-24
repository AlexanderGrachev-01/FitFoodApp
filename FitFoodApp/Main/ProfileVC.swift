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
        userNameLabel.text = UserInfo.name
        usernameTextField.text = UserInfo.name
        heightTextField.text = UserInfo.height
        ageTextField.text = UserInfo.age
        weightTextField.text = UserInfo.weight
        
        heightTextField.delegate = self
        ageTextField.delegate = self
        weightTextField.delegate = self
    }
    
    
    @IBAction func clearInfo(_ sender: Any) {
        UserInfo.name = nil
        UserInfo.height = nil
        UserInfo.weight = nil
        UserInfo.age = nil
        UserInfo.carbs = nil
        UserInfo.protein = nil
        UserInfo.fat = nil
        UserInfo.kcal = nil
        UserInfo.kcalSh = nil
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
        UserInfo.name = usernameTextField.text
        userNameLabel.text = UserInfo.name
    }
    
    @IBAction func setUserHeight(_ sender: Any) {
        UserInfo.height = heightTextField.text
    }
    
    @IBAction func setUserAge(_ sender: Any) {
        UserInfo.age = ageTextField.text
    }
    
    @IBAction func setUserWeight(_ sender: Any) {
        UserInfo.weight = weightTextField.text
    }
}

extension ProfileVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
