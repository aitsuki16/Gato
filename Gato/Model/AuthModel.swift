//
//  AuthModel.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/01.
//

import Foundation

class AuthModel: ObservableObject {
    private let loggedInKey = "isLoggedIn"
    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: loggedInKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: loggedInKey)
            objectWillChange.send()
        }
    }
    


}
