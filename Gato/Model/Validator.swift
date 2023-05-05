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
}
