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
}

class SignUpModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?
 
    func signUp(user: User) -> AnyPublisher<User, Error> {
        if let email = user.email {
            if !Validator.isValidEmail(email) {
                errorMessage = "Please input valid email address"
                return Fail(error: NSError(domain: "", code: 0, userInfo: nil)).eraseToAnyPublisher()
            }
            if let name = user.name {
                if !Validator.isValidName(name) {
                    errorMessage = "Please input valid name"
                    return Fail(error: NSError(domain: "", code: 0, userInfo: nil)).eraseToAnyPublisher()
                }
            }
            if let password = user.password {
                if !Validator.isValidPassword(password) {
                    errorMessage = "Please input valid password"
                    return Fail(error: NSError(domain: "", code: 0, userInfo: nil)).eraseToAnyPublisher()
                }
            }
        }
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
            return decoded
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}
