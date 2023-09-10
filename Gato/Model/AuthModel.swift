//
//  AuthModel.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/01.
//

import Foundation

class AuthModel: ObservableObject {
    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.loginUserToken != nil
        }
    }
    
    var loginUserToken: String? {
        get {
            UserDefaults.standard.loginUserToken
        }
        set {
            UserDefaults.standard.loginUserToken = newValue
        }
    }
}

struct TokenResponse: Decodable {
    let token: String
}
