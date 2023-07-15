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
    @State private var isImageSelected = false
    @State private var isUploadComplete = false

    var body: some View {
        VStack {
            List(wallPosts, id: \.image) { posting in
            }
            
            Button(action: {
                self.showImagePicker = true
            }) {
                Text("Add Photo")
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage) { image in
                    selectedImage = image
                    isImageSelected = true
                }
            }
            
            TextEditor(text: $postText)
                .frame(height: 300)
                                .border(Color.gray, width: 1)
                                .padding()
            
            Button(action: {
                guard let image = selectedImage else {
                
                    return
                }
                let newPost = WallPost(body: postText, image: image)
                uploadPost(newPost)
            }) {
                Text("Post")
            }
            .disabled(postText.isEmpty && !isImageSelected)
            
            .navigationBarTitle("Wall Page")
        }
        .onAppear {
            fetchWallPosts()
        }
        .sheet(isPresented: $isUploadComplete) {
            VStack {
                Text("Image uploaded successfully!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: {
                    isUploadComplete = false
                }) {
                    Text("OK")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
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
                print("Error fetching wall posts: \(error)")
            }
        }
    }

    
    private func uploadPost(_ post: WallPost) {
        let apiTimeline = APITimeline()
        apiTimeline.uploadImageToWallPage(post: post) { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.postText = ""
                    self.selectedImage = nil
                    self.isImageSelected = false
                    self.isUploadComplete = true
                }
            
                self.fetchWallPosts()
            case .failure(let error):
                print("Error uploading post: \(error)")
            }
        }
    }
}

struct WallpageView_Previews: PreviewProvider {
    static var previews: some View {
        WallpageView(wallPosts: .constant([]))
    }
}

