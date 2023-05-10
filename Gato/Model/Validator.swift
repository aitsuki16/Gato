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

        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        
        //email regex
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Check email matches the predicate
        return emailPredicate.evaluate(with: email)
    }
    
    static func isValidName(_ name: String) -> Bool {
        //validation (4-12 letters, no spaces)
        let nameRegex = "\\A\\w{4,12}\\z"
        
        // Create predicate name regex
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        
        // Check name matches the predicate
        return namePredicate.evaluate(with: name)
    }
    
        
        static func isValidPassword(_ password: String) -> Bool {
            
            //password validation
            let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
            
            //password regex
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            
            // Check password matches the predicate
            return passwordPredicate.evaluate(with: password)
    }
}
