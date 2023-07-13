//
//  WallPost.swift
//  Gato
//
//  Created by user on 2023/07/11.
//
import Foundation
import UIKit

struct WallPost: Codable {
    let body: String
    let image: UIImage?
    
    init(body: String, image: UIImage) {
        self.body = body
        self.image = image
    }
    
    private enum CodingKeys: String, CodingKey {
        case body
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(body, forKey: .body)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        body = try container.decode(String.self, forKey: .body)
        image = nil
    }
}

