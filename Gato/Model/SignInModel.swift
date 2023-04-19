//
//  SignInModel.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/17.
//

import Foundation


    class SignInModel: ObservableObject {
        
        struct User: Codable {
            let email: String
            let password: String
        }
        
        @Published var email: String = ""
        @Published var password: String = ""
        
        func signIn() -> Bool {
            let user = User(email: "", password: "")
            
            if email == user.email && password == user.password {
                
                // to save user info to UserDefaults
                do {
                    let encoder = JSONEncoder()
                    let data = try encoder.encode(user)
                    UserDefaults.standard.set(data, forKey: "CurrentUser")
                    return true
                } catch {
                    print("Error saving user to UserDefaults: \(error.localizedDescription)")
                }
            }
            
            return false
        }
    }
