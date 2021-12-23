//
//  PhoneNumberVC.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 21.12.2021.
//

import UIKit

final class PhoneNumberVC: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    @IBOutlet weak var sendCodeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhoneNumberTextField?.becomeFirstResponder()
        PhoneNumberTextField?.returnKeyType = .continue
        PhoneNumberTextField?.delegate = self
        sendCodeButton.isHidden = true
    }
}

extension PhoneNumberVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text,
           !text.isEmpty {
            let number = "+7\(text)"
            AuthManager.shared.verifyPhone(number) { [weak self] success in
                guard success else { return }
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "SMSCodeVC")
                    UIApplication.shared.keyWindow?.rootViewController = vc
                }
                
            }
            
        }
        return true
    }
}
