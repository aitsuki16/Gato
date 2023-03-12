//
//  SignUpModel.swift
//  Gato
//
//  Created by Ai on 2022/12/24.
//

import Foundation
import Combine

struct User: Decodable, Encodable {
    
    let nickname: String?
    let email: String?
    let password: String?
    let phoneNumber: String?
}

class SignUpModel {
    func signUp(user: User) -> AnyPublisher<User, Error> {
        let url = URL(string: "https://example.com/api/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONEncoder().encode(user)
            return URLSession.shared.dataTaskPublisher(for: request)
                .map { $0.data }
                .decode(type: User.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
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

