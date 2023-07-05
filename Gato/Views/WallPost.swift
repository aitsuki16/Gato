//
//  WallPost.swift
//  Gato
//
//  Created by user on 2023/06/30.
//

import Foundation
import UIKit

struct ImagePost: Identifiable {
    
    let id = UUID()
    let body: String
    let photo: UIImage?
}
