//
//  PostsViewModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import Foundation

final class PostsViewModel: ObservableObject {
    
    @Published private(set) var loading = false
    @Published private(set) var posts = [Post]()
    
    func getPosts() {
                    
        loading = true
        PostsService.shared.fetchPosts { posts in
            DispatchQueue.main.async {
                self.loading = false
                self.posts = posts
            }
        } failure: { error in
            self.loading = false
        }
    }
    
}
