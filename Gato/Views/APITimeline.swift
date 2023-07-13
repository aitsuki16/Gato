//
//  APIClient.swift
//  Gato
//
//  Created by user on 2023/07/05.
//

import Foundation
import Combine

struct APITimeline {
    func uploadImageToWallPage(post: WallPost, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "https://divine-flower-4961.fly.dev/api/posts") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        // Create a multipart form data request
        // Set the appropriate headers and body
        // Use URLSession to make the request
        
        // Example implementation using URLSession.shared.dataTask:
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // Set the appropriate headers
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let body = createFormDataBody(with: post, boundary: boundary)
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            if httpResponse.statusCode == 200 {
                completion(.success(()))
            } else {
                completion(.failure(APIError.uploadFailed(httpResponse.statusCode)))
            }
        }
        task.resume()
    }
    
    private func createFormDataBody(with post: WallPost, boundary: String) -> Data {
        var body = Data()
        
        // Construct the multipart form data body
        
        // Add the post text
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"text\"\r\n\r\n".data(using: .utf8)!)
        body.append(post.body.data(using: .utf8)!)
        body.append("\r\n".data(using: .utf8)!)
        
        // Add the image data
        if let imageData = post.image?.jpegData(compressionQuality: 0.8) {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
            body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
            body.append(imageData)
            body.append("\r\n".data(using: .utf8)!)
        }
        
        // Add the boundary suffix
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        return body
    }
    
    func fetchWallPosts(completion: @escaping (Result<[WallPost], Error>) -> Void) {
          // Perform the API request to fetch wall posts
          // Upon receiving the response, call the completion handler with the appropriate result
      }

}


enum APIError: Error {
    case invalidURL
    case invalidResponse
    case uploadFailed(Int)
}
