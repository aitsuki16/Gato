//
//  AuthModelSignOut.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/09.
//

import Foundation

class SignOutModel: AuthModel {
    func signOut() {
        loginUserToken = nil
    }
}
