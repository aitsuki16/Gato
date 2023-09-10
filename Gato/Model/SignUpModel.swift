//
//  SignUpModel.swift
//  Gato
//
//  Created by Ai on 2022/12/24.
//

import Foundation
import Combine

struct User: Codable {
    let name: String?
    let email: String?
    let password: String?
}

enum SignUpError: Error {
    case name
    case email
    case password
    
    var errorMessage: String {
        switch self {
        case .name:
            return "Please input a valid name"
        case .email:
            return "Please input a valid email"
        case .password:
            return "Please input a valid password"
        }
    }
}

class SignUpModel: AuthModel {
    @Published var didSignUp: Bool = false
    @Published var errorMessage: String?

    func signUp(user: User) -> AnyPublisher<TokenResponse, Error> {
        return validateUser(user)
            .flatMap { validUser in
                let url = URL(string: "https://divine-flower-4961.fly.dev/api/register")!
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
                do {
                    request.httpBody = try JSONEncoder().encode(validUser)
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
    
    private func validateUser(_ user: User) -> AnyPublisher<User, Error> {
        if let email = user.email, !Validator.isValidEmail(email) {
            errorMessage = SignUpError.email.errorMessage
            return Fail(error: SignUpError.email).eraseToAnyPublisher()
        }

        if let name = user.name, !Validator.isValidName(name) {
            errorMessage = SignUpError.name.errorMessage
            return Fail(error: SignUpError.name).eraseToAnyPublisher()
        }

        if let password = user.password, !Validator.isValidPassword(password) {
            errorMessage = SignUpError.password.errorMessage
            return Fail(error: SignUpError.password).eraseToAnyPublisher()
        }

        errorMessage = nil
        return Just(user).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
