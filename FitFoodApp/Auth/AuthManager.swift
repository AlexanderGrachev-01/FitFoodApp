//
//  AuthManager.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 23.12.2021.
//

import Foundation
import FirebaseAuth

protocol AuthProtocol: AnyObject {
    var verificationID: String? { get }
    func verifyPhone(_ phoneNumber: String, completion: @escaping(Bool) -> Void)
    func verifyCode(_ smsCode: String, completion: @escaping(Bool) -> Void)
}

final class AuthManager: AuthProtocol {
    var verificationID: String?

    func verifyPhone(_ phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(
            phoneNumber,
            uiDelegate: nil) {
                [weak self] verificationID, error in
                guard let verificationID = verificationID, error == nil
                else {
                    completion(false)
                    return
                }
                self?.verificationID = verificationID
                completion(true)
            }
    }
    
    func verifyCode(_ smsCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationID = verificationID else {
            completion(false)
            return
        }
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: smsCode)
        
        Auth.auth().signIn(with: credential) { result, error in
            guard result != nil,
                  error == nil
            else {
                return
            }
            completion(true)
        }

    }
    
}
