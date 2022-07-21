//
//  PostsViewModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import Foundation

protocol PostsViewModelProtocol {
    func getPosts()
    func deleteAll()
}

final class PostsViewModel: ObservableObject, PostsViewModelProtocol {
    
    let realm = try! Realm()
    
    @Published private(set) var loading = false
    
    private let postsService: PostsServiceProtocol

    init(postsService: PostsServiceProtocol) {
      self.postsService = postsService
    }
    
    // MARK: - API Service methods
    func getPosts() {
                    
        loading = true
        postsService.fetchPosts { posts in
            DispatchQueue.main.async {
                posts.forEach { post in
                    self.save(post)
                }
                self.loading = false
            }
        } failure: { error in
            self.loading = false
        }
    }
    
    //MARK: - Realm methods
    private func save(_ post: Post) {
        do {
            try realm.write {
                post.isFavorite = false
                realm.add(post)
            }
        } catch {
            print("Error saving post \(error)")
        }
    }
    
    func deleteAll() {
        do {
            try realm.write {
                let allPosts = realm.objects(Post.self)
                realm.delete(allPosts)
            }
        } catch {
            print("Error deleting all posts \(error)")
        }
    }
}
