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

enum SignUpError {
    case name
    case email
    case password
    
    var errorMessage: String {
        switch self {
        case.name:
            return "Please input a valid name"
        case.email:
            return "Please input a valid email"
        case.password:
            return "please input a valid password"
        }
    }
}


class SignUpModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?
 
    func signUp(user: User) -> AnyPublisher<User, Error> {
        if let email = user.email {
            if !Validator.isValidEmail(email) {
                errorMessage = SignUpError.email.errorMessage
                return Fail(error: NSError(domain: "", code: 0, userInfo: nil)).eraseToAnyPublisher()
            }
            if let name = user.name {
                if !Validator.isValidName(name) {
                    errorMessage = SignUpError.name.errorMessage
                    return Fail(error: NSError(domain: "", code: 0, userInfo: nil)).eraseToAnyPublisher()
                }
            }
            if let password = user.password {
                if !Validator.isValidPassword(password) {
                    errorMessage = SignUpError.password.errorMessage
                    return Fail(error: NSError(domain: "", code: 0, userInfo: nil)).eraseToAnyPublisher()
                }
            }
            errorMessage = nil

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
