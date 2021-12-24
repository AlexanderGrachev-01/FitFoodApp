//
//  Persistance.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 24.12.2021.
//

import Foundation

final class UserInfo {
    
    private enum UserKeys: String {
        case userName
        case userHeight
        case userAge
        case userWeight
        case userKcalSh
        case userKcal
        case userCarbs
        case userProtein
        case userFat
    }
    
    static var name: String! {
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userName.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userName.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var height: String!{
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userHeight.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userHeight.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var age: String! {
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userAge.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userAge.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var weight: String! {
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userWeight.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userWeight.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var kcalSh: String! {
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userKcalSh.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userKcalSh.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var kcal: String! {
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userKcal.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userKcal.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var carbs: String! {
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userCarbs.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userCarbs.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var protein: String! {
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userProtein.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userProtein.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var fat: String! {
        get {
            return UserDefaults.standard.string(forKey: UserKeys.userFat.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = UserKeys.userFat.rawValue
            if let name = newValue {
                print("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    
}
