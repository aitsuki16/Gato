//
//  WallPost.swift
//  Gato
//
//  Created by user on 2023/06/30.
//

import Foundation

struct WallPost: Codable {
    //added optional because of error asking to make it optional
    let id: String?
    let body: String?
    let image: UIImage?
}
