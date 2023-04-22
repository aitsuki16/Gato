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
    
    struct TokenResponse: Codable {
        let token: String
    }
    
    // Save the authentication token to user defaults or keychain
    func saveAuthToken(_ token: String) {
        // Here you would implement code to save the token to user defaults or keychain
        // For example:
        UserDefaults.standard.set(token, forKey: "AuthToken")
    }
    
    // Call Api
    // 成功したらsaveCurrentUser
    func signIn(completion: @escaping (Result<Void, Error>) -> Void) {
        // Construct the request URL with the user's email and password
        let url = URL(string: "https://divine-flower-4961.fly.dev/api/signin/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let user = User(email: email, password: password)
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }

        // Send the request and handle the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "SignInError", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            // Parse the API response and extract the authentication token
            let decoder = JSONDecoder()
            do {
                let tokenResponse = try decoder.decode(TokenResponse.self, from: data)
                // Save the token to user defaults or keychain
                self.saveAuthToken(tokenResponse.token)
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    private func saveCurrentUser(_ user: User) {
        // Here it Save user info to UserDefaults
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            UserDefaults.standard.set(data, forKey: "CurrentUser")
        } catch {
            print("Error saving user to UserDefaults: \(error.localizedDescription)")
        }
    }
}
