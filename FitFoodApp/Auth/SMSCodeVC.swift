//
//  SMSCodeVC.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 21.12.2021.
//

import UIKit
import FirebaseAuth

class SMSCodeVC: UIViewController {

    @IBOutlet weak var smsCodeTextField: UITextField!
    @IBOutlet weak var confirmCodeButton: UIButton!
    
    private let authManager: AuthProtocol = AuthManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        smsCodeTextField?.becomeFirstResponder()
        smsCodeTextField?.returnKeyType = .continue
        smsCodeTextField?.delegate = self
        confirmCodeButton.isHidden = true
    }
}

extension SMSCodeVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text,
           !text.isEmpty {
            AuthManager.shared.verifyCode(text) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "MainPageVC")
                    UIApplication.shared.keyWindow?.rootViewController = vc
                }
                
            }
            
        }
        return true
    }
}

