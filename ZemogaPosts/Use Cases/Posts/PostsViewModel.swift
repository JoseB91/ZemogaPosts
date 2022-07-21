//
//  PostsViewModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import Foundation

final class PostsViewModel: ObservableObject {
    
    let realm = try! Realm()
    
    @Published private(set) var loading = false
    
    func getPosts() {
                    
        loading = true
        PostsService.shared.fetchPosts { posts in
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
    func save(_ post: Post) {
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
