//
//  Photo.swift
//  Gato
//
//  Created by user on 2023/06/10.
//

import Foundation


class MyPhoto {
    var id: UInt
    var userId: UInt
    var filePath: String
    var createdAt: Date?
    var updatedAt: Date?
    
    init(id: UInt, userId: UInt, filePath: String, createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.userId = userId
        self.filePath = filePath
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
