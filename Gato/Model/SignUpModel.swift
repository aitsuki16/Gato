//
//  SignUpModel.swift
//  Gato
//
//  Created by Ai on 2022/12/24.
//

import Foundation
import Combine

struct User: Decodable, Encodable {

    let name: String?
    let email: String?
    let password: String?
    let phone: String?
}

class SignUpModel: ObservableObject {
    @Published var isLoggedIn: Bool = false

    func signUp(user: User) -> AnyPublisher<User, Error> {
        let url = URL(string: "https://divine-flower-4961.fly.dev/api/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONEncoder().encode(user)
            let response = URLSession.shared.dataTaskPublisher(for: request)
            let decoded = response
                .map { $0.data }
                .decode(type: User.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
            print(response)
            print(decoded)
            loginStatusToTrue()
            return decoded
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    func loginStatusToTrue() {
        isLoggedIn = true
    }

    
    //added new function to try json
    func login(email: String,name: String,phone: String?, password: String) {
        var request = URLRequest(url: URL(string: "https://divine-flower-4961.fly.dev/api/register")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: [
            "name": "test2",
            "email": "test2@a.com",
            "phone": "123",
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


