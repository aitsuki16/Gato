//
//  TimelineItemView.swift
//  Gato
//
//  Created by user on 2023/07/05.
//

import SwiftUI

struct TimelineItemView: View {
    let post: WallPost
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.body ?? "")
                .font(.body)
            if let imageURL = URL(string: post.image ?? "") {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        Rectangle()
                            .fill(Color.gray)
                            //.aspectRatio(contentMode: .fit)
                            //.frame(maxWidth: .infinity)
                            .cornerRadius(10)
                    case .success(let image):
                        //image
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                    default:
                        // Placeholder image on failure
                        Rectangle()
                            .fill(Color.gray)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct TimelineItemView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineItemView(post: WallPost(id: "1", body: "Body", image: "https://thumb.ac-illust.com/d7/d79bd6078773c70c65a9eb6c5a18b895_t.jpeg"))
    }
}
