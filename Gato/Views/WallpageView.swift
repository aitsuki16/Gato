//
//  WallpageView.swift
//  Gato
//
//  Created by user on 2023/06/29.
//

import SwiftUI

struct WallpageView: View {
    @State private var postText = ""
    @State private var showSheet = false
    @State private var selectedImage: UIImage?
    @State private var wallPosts: [WallPost] = []
    @State private var isFetchingPosts = false
    @EnvironmentObject var apiClient: APIClient

    var body: some View {
        VStack {
            List(wallPosts) { post in
                VStack(alignment: .leading) {
                    Text(post.body ?? "")
                        .font(.body)
                    
                    // Display post photo
                    if let imageURLString = post.image, let imageURL = URL(string: imageURLString) {
                        AsyncImage(url: imageURL) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                            case .failure:
                                ProgressView()
                            case .empty:
                                ProgressView()
                            @unknown default:
                                ProgressView()
                            }
                        }
                    }
                }
                .padding()
            }
            .listStyle(PlainListStyle())
            HStack {
                Button(action: {
                    self.showSheet = true
                }) {
                    Text("Add Photo")
                        .foregroundColor(.indigo)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.indigo, lineWidth: 2)
                        )
                }
                
                Spacer()
                
                Button(action: {
                    //text and selectedImage
                    let newPost = WallPost(id: UUID().uuidString, body: postText, image: selectedImage?.jpegData(compressionQuality: 0.8)?.base64EncodedString())
                    wallPosts.insert(newPost, at: 0)
                    postText = ""
                    selectedImage = nil
                    
                    //newAPI
                    apiClient.addWallPost(newPost) { result in
                        switch result {
                        case .success(let addedPost):

                            // Reload
                    fetchWallPosts()
                            
                        case .failure(let error):
                            print("Error adding wall post: \(error)")
                          
                        }
                    }
                }) {
                    Text("Post")
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.indigo)
                        )
                }
                .disabled(postText.isEmpty)
            }
            .padding()
        }
        .sheet(isPresented: $showSheet) {
            ImagePicker(selectedImage: $selectedImage)
        }
        .navigationBarTitle("Wall Page")
        .onAppear {
            fetchWallPosts()
        }
    }
    //fetch
    private func fetchWallPosts() {
        isFetchingPosts = true
        apiClient.fetchWallPosts { result in
            isFetchingPosts = false
            switch result {
            case .success(let posts):
                wallPosts = posts
            case .failure(let error):
                print("Error fetching wall posts: \(error)")
            
            }
        }
    }
}


struct WallpageView_Previews: PreviewProvider {
    static var previews: some View {
        WallpageView()
    }
}
