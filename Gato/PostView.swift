//
//  PostView.swift
//  Gato
//
//  Created by user on 2023/06/21.
//

import SwiftUI

struct PostView: View {
    let post: Post
    let screenWidth: CGFloat
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                
                Image(post.profileImageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                Text(post.userName).font(.headline)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
            
                Image(post.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth, height: 250)
                .clipped()
            Text(post.text)
                .lineLimit(nil)
                .font(.system(size: 15))
                .padding(.leading, 16).padding(.trailing, 16).padding(.bottom, 16)
        }.listRowInsets(EdgeInsets())
        
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(post: $post, screenWidth: 0.5)
//    }
//}
