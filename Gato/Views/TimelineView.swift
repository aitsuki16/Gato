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
        List(viewModel.wallPosts, id: \.id) { post in
            TimelineItemView(post: post)
                .padding()
        }
        .onAppear {
            
        }
    }
}

class TimelineViewModel: ObservableObject {
    @Published var wallPosts: [WallPost] = []
    let apiClient = APIClient()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchWallPosts() {
        apiClient.fetchWallPosts()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching wall posts: \(error)")
                }
            }, receiveValue: { [weak self] posts in
                self?.wallPosts = posts
            })
            .store(in: &cancellables)
    }
}
