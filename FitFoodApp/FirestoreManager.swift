//
//  FirestoreManager.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 24.12.2021.
//

import Foundation
import FirebaseFirestore

struct FoodItem {
    let name: String
    let kcal: String
    let carbs: String
    let protein: String
    let fat: String
}

protocol FirestoreProtocol: AnyObject {
    //func getUserInfo(_ completion: @escaping (UserInfo) -> Void)
    func getFoodItems(_ completion: @escaping ([FoodItem]) -> Void)
}

final class FirestoreManager: FirestoreProtocol {
    static let shared: FirestoreProtocol = FirestoreManager()
    private let db = Firestore.firestore()

//    func getUserInfo(_ completion: @escaping (UserInfo) -> Void) {
//        db.collection("userInfo").getDocuments { snapshot, error in
//            guard let snapshot = snapshot,
//                    error == nil
//            else {
//                return
//            }
//            let userInfo: UserInfo = snapshot.documents. { snap in
//                if let name: String = snap.data()["Name"] as? String,
//                   let height: String = snap.data()["Height"] as? String,
//                   let age: String = snap.data()["Age"] as? String,
//                   let weight: String = snap.data()["Weight"] as? String {
//                return UserInfo(
//                    name: name,
//                    height: height,
//                    age: age,
//                    weight: weight
//                )
//                } else {
//                    return UserInfo(name: "", height: "", age: "", weight: "")
//                }
//            }
//            completion(userInfo)
//        }
//    }
    
    func getFoodItems(_ completion: @escaping ([FoodItem]) -> Void) {
        db.collection("foodInfo").getDocuments { snapshot, error in
            guard let snapshot = snapshot,
                  error == nil
            else {
                return
            }
            let items: [FoodItem] = snapshot.documents.compactMap { snap in
                if let name: String = snap.data()["name"] as? String,
                   let kcal: String = snap.data()["kcal"] as? String,
                   let carbs: String = snap.data()["carbs"] as? String,
                   let protein: String = snap.data()["protein"] as? String,
                   let fat: String = snap.data()["fat"] as? String {
                    return FoodItem(
                        name: name,
                        kcal: kcal,
                        carbs: carbs,
                        protein: protein,
                        fat: fat
                    )
                } else {
                    return FoodItem.init(name: "", kcal: "", carbs: "", protein: "", fat: "")
                }
            }
            completion(items)
        }
    }
    
    
}
