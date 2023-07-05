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
    @State private var wallPosts: [ImagePost] = []
    
    var body: some View {
        VStack {
            List(wallPosts) { post in
                VStack(alignment: .leading) {
                    Text(post.body)
                        .font(.body)
                    
                    if let postImage = post.photo {
                        Image(uiImage: postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            
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
                    let newPost = ImagePost(body: postText, photo: selectedImage)
                    wallPosts.append(newPost)
                    
                    postText = ""
                    selectedImage = nil
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
    }
}

struct WallpageView_Previews: PreviewProvider {
    static var previews: some View {
        WallpageView()
    }
}
