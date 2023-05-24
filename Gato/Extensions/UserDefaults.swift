//
//  UserDefaults.swift
//  Gato
//
//  Created by Ryo Tabuchi on 2023/05/24.
//

import Foundation

extension UserDefaults {
    private static let loginUserTokenUserDefaultsKey = "loginUserTokenUserDefaultsKey"
    
    var loginUserToken: String? {
        get {
            return string(forKey: Self.loginUserTokenUserDefaultsKey)
        }
        set {
            set(newValue, forKey: Self.loginUserTokenUserDefaultsKey)
        }
    }
}
