//
//  SignUpModel.swift
//  Gato
//
//  Created by Ai on 2022/12/24.
//

import Foundation

struct SignUpUser: Decodable {
    
    let data: [User]
    
    {　//
        "data":
            “email”: “test@a.com”,
            “name”: “test”,
            “password”: “$2y$10$7mkdxs4qjqx4iSpRZXIwQuT71XambJ0nrlkHvddiR03t1wqyyXO0K”,
            “updated_at”: “2022-12-20T12:07:43.000000Z”,
            “created_at”: “2022-12-20T12:07:43.000000Z”,
            “id”: 15
    }
            

    
}

struct User: Decodable {

let name: String?
let email: String?
let pass: String?
}

