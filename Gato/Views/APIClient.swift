//
//  APIClient.swift
//  Gato
//
//  Created by user on 2023/07/05.
//

import Foundation
import Combine
import UIKit
import SwiftUI

class APIClient: ObservableObject {
    func fetchWallPosts() -> AnyPublisher<[WallPost], Error> {
        guard let url = URL(string: "https://divine-flower-4961.fly.dev/api/posts") else {
            return Fail(error: NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, _ -> [WallPost] in
                let decoder = JSONDecoder()
                return try decoder.decode([WallPost].self, from: data)
            }
            .eraseToAnyPublisher()
    }
    
    func addWallPost(_ post: WallPost, image: UIImage?) -> AnyPublisher<WallPost, Error> {
        guard let url = URL(string: "https://divine-flower-4961.fly.dev/api/posts") else {
            return Fail(error: NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
                .eraseToAnyPublisher()
        }
        
        let boundary = UUID().uuidString
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let body = createMultipartFormData(post, image: image, boundary: boundary)
        request.httpBody = body
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response -> WallPost in
                if let httpResponse = response as? HTTPURLResponse,
                   httpResponse.statusCode != 200 {
                    throw NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)
                }
                return try JSONDecoder().decode(WallPost.self, from: data)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func createMultipartFormData(_ post: WallPost, image: UIImage?, boundary: String) -> Data {
        var body = Data()
        
        if let content = post.body {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"content\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(content)\r\n".data(using: .utf8)!)
        }
        
        if let image = image,
           let imageData = image.jpegData(compressionQuality: 0.8) {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"photo\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            body.append(imageData)
            body.append("\r\n".data(using: .utf8)!)
            
            // Convert
            let base64Image = imageData.base64EncodedString()
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"image\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(base64Image)\r\n".data(using: .utf8)!)
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        return body
    }

}


