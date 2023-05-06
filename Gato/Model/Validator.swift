//
//  Validator.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/05/05.
//

import Foundation

class Validator {
    
    // Email validation
    static func isValidEmail(_ email: String) -> Bool {
        // Regular expression for email validation
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        
        // Create a predicate with the email regex
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Check if the email matches the predicate
        return emailPredicate.evaluate(with: email)
    }
    
    static func isValidName(_ name: String) -> Bool {
        // Regular expression for name validation (4-12 letters, no spaces)
        let nameRegex = "\\A\\w{4,12}\\z"
        
        // Create a predicate with the name regex
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        
        // Check if the name matches the predicate
        return namePredicate.evaluate(with: name)
    }
    
    class Validator {
        
        static func isValidPassword(_ password: String) -> Bool {
            
            // Regular expression for password validation
            let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
            
            // Create a predicate with the password regex
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            
            // Check if the password matches the predicate
            return passwordPredicate.evaluate(with: password)
        }
    }
}
