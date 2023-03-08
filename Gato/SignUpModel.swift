//
//  SignUpModel.swift
//  Gato
//
//  Created by Ai on 2022/12/24.
//

import Foundation



struct User: Decodable {
    
    let nickname: String?
    let email: String?
    let password: String?
    let phoneNumber: Int?
    
}

class SignUpViewModel {
    
    
    //added new function to try json
    func login(email: String, password: String) {
        var request = URLRequest(url: URL(string: "https://divine-flower-4961.fly.dev/api/register")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: [
            "email": "test2@a.com",
            "name": "test2",
            "password": "password"
        ])
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data)
                    print(user)
                }
                catch {
                    print("Could not decode the data. Error: \(error)")
                }
            }
        }
        task.resume()
    }
}

