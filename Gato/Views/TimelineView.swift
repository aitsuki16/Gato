//
//  TimelineView.swift
//  Gato
//
//  Created by user on 2023/07/05.
//

import SwiftUI
import Combine

struct TimelineView: View {
    private let viewModel = TimelineViewModel()
    
    var body: some View {
        List(viewModel.wallPosts, id: \.image) { post in
            TimelineItemView(post: post)
                .padding()
        }
        .onAppear {
            
        }
    }
}

class TimelineViewModel: ObservableObject {
    @Published var wallPosts: [WallPost] = []
    let apiTimeline = APITimeline() 
    private var cancellables = Set<AnyCancellable>()
    
    func fetchWallPosts() {
        apiTimeline.fetchWallPosts { [weak self] result in
            switch result {
            case .success(let posts):
                self?.wallPosts = posts
            case .failure(let error):
                // Handle the error
                print("Error fetching wall posts: \(error)")
            }
        }
    }
}
