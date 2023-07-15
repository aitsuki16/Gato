//
//  TimelineItemView.swift
//  Gato
//
//  Created by user on 2023/07/05.
//

import SwiftUI

struct TimelineItemView: View {
    let post: WallPost
    @State private var imageURL: URL? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.body)
                .font(.body)
            
            if let imageURL = imageURL {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        Rectangle()
                            .fill(Color.gray)
                            .cornerRadius(10)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                    default:
                        Rectangle()
                            .fill(Color.gray)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                    }
                }
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        if let image = post.image {
            let imageName = UUID().uuidString + ".jpg"
            let imagePath = FileManager.default.temporaryDirectory.appendingPathComponent(imageName)
            do {
                try image.jpegData(compressionQuality: 0.8)?.write(to: imagePath)
                imageURL = URL(string: imagePath.path)
            } catch {
                print("Error saving image: \(error)")
            }
        }
    }
}

struct TimelineItemView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineItemView(post: WallPost(body: "Sample", image: UIImage(named: "")!))
    }
}
