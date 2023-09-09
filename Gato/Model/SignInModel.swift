//
//  SignInModel.swift
//  Gato
//
//  Created by Aida Igarashi on 2023/04/17.
//

import Foundation
import SwiftUI

class SignInModel: AuthModel {
    struct SignInCredetials: Codable {
        let email: String
        let password: String
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    struct TokenResponse: Codable {
        let token: String
    }
    
    // Call Api
    func signIn(completion: @escaping (Result<Void, Error>) -> Void) {
        // Construct the request URL with the user's email and password
        let url = URL(string: "https://divine-flower-4961.fly.dev/api/signin/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let credetials = SignInCredetials(email: email, password: password)
        do {
            let jsonData = try JSONEncoder().encode(credetials)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        // Send the request and handle the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to sign in."
                }
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "SignInError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to sign in"])))
                return
            }
            
            // Parse the API response and extract the authentication token
            let decoder = JSONDecoder()
            do {
                let tokenResponse = try decoder.decode(TokenResponse.self, from: data)
                // Save the token to user defaults or keychain
                self.loginUserToken = tokenResponse.token
                print(String(UserDefaults.standard.loginUserToken ?? ""))
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // Save current user to UserDefaults
    private func saveCurrentUser(_ user: User) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
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
}




