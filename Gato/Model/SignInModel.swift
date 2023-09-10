//
//  SignInModel.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/17.
//

import Foundation
import SwiftUI
import Combine

enum SignInError: Error {
    case email
    case password
    
    var errorMessage: String {
        switch self {
        case .email:
            return "Please input a valid email"
        case .password:
            return "Please input a valid password"
        }
    }
}

struct SignInCredentials: Codable {
    let email: String?
    let password: String?
}

class SignInModel: AuthModel {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    // Call Api
    func signIn(credentials: SignInCredentials) -> AnyPublisher<TokenResponse, Error> {
        return validateCredentials(credentials)
            .flatMap { validCredentials in
                let url = URL(string: "https://divine-flower-4961.fly.dev/api/signin/")!
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
                do {
                    request.httpBody = try JSONEncoder().encode(validCredentials)
                    return URLSession.shared.dataTaskPublisher(for: request)
                        .map { $0.data }
                        .decode(type: TokenResponse.self, decoder: JSONDecoder())
                        .eraseToAnyPublisher()
                } catch {
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    // Save current user to UserDefaults
    private func saveCurrentUser(_ credentials: SignInCredentials) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(credentials)
            UserDefaults.standard.set(data, forKey: "CurrentUser")
        } catch {
            print("Error saving user to UserDefaults: \(error.localizedDescription)")
        }
    }
    
    // Return a view to show validation errors
    func validationErrorView(_ errorMessage: String) -> some View {
        Text(errorMessage)
            .foregroundColor(.yellow)
            .bold()
    }
    
    private func validateCredentials(_ credentials: SignInCredentials) -> AnyPublisher<SignInCredentials, Error> {
   
        if let email = credentials.email, !Validator.isValidName(email) {
            errorMessage = SignInError.email.errorMessage
            return Fail(error: SignInError.email).eraseToAnyPublisher()
        }

        if let password = credentials.password, !Validator.isValidPassword(password) {
            errorMessage = SignInError.password.errorMessage
            return Fail(error: SignInError.password).eraseToAnyPublisher()
        }

        errorMessage = ""
        return Just(credentials).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}

