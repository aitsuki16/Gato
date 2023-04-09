//
//  AuthModelSignOut.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/09.
//

import Foundation

class SignOutModel: AuthModel {
    
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "userId")
        UserDefaults.standard.removeObject(forKey: "accessToken")
        self.isLoggedIn = false
    }
    
}
