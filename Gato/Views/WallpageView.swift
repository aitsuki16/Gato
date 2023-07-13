//
//  WallpageView.swift
//  Gato
//
//  Created by user on 2023/06/29.
//

import SwiftUI

struct WallpageView: View {
    @State private var postText = ""
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @Binding var wallPosts: [WallPost]
    
    var body: some View {
        VStack {
            List(wallPosts, id: \.image) { posting in
                // Display the posts
            }
            
            Button(action: {
                self.showImagePicker = true
            }) {
                Text("Add Photo")
                // Button styling
            }
            
            Button(action: {
                guard let image = selectedImage else {
                    // Handle the case when selectedImage is nil
                    return
                }
                let newPost = WallPost(body: postText, image: image)
                uploadPost(newPost)
            }) {
                Text("Post")
                // Button styling
            }
            .disabled(postText.isEmpty)
            
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .navigationBarTitle("Wall Page")
        }
        .onAppear {
            fetchWallPosts()
        }
    }
    
    private func fetchWallPosts() {
        let apiTimeline = APITimeline()
        apiTimeline.fetchWallPosts { result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.wallPosts = posts
                }
            case .failure(let error):
                // Handle the error
                print("Error fetching wall posts: \(error)")
            }
        }
    }

    
    private func uploadPost(_ post: WallPost) {
        let apiTimeline = APITimeline()
        apiTimeline.uploadImageToWallPage(post: post) { result in
            switch result {
            case .success:
                // Clear the text and selected image after successful upload
                self.postText = ""
                self.selectedImage = nil
                // Fetch wall posts again to update the list
                self.fetchWallPosts()
            case .failure(let error):
                // Handle the error
                print("Error uploading post: \(error)")
            }
        }
    }
}

//struct WallpageView_Previews: PreviewProvider {
//    static var previews: some View {
//        WallpageView(wallPosts: )
//    }
//}
