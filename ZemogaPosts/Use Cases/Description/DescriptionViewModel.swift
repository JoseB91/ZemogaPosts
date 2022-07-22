//
//  DescriptionViewModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import Foundation

protocol DescriptionViewModelProtocol {
    func getComments(of userId: Int)
    func getUser(with userId: Int)
    func delete(_ post: Post)
}

final class DescriptionViewModel: ObservableObject, DescriptionViewModelProtocol {
    
    let realm = try! Realm()

    @Published private(set) var loading = false
    @Published private(set) var comments = [Comment]()
    @Published private(set) var user = User()

    private let postsService: PostsServiceProtocol

    init(postsService: PostsServiceProtocol) {
      self.postsService = postsService
    }
    
    // MARK: - API Service Methods
    func getComments(of userId: Int) {
                    
        loading = true
        postsService.fetchComments(of: userId) { comments in
            DispatchQueue.main.async {
                comments.forEach { comment in
                    self.save(comment)
                }
                self.loading = false
                self.comments = comments
            }
        } failure: { error in
            self.loading = false
        }
    }
    
    func getUser(with userId: Int) {
                    
        loading = true
        postsService.fetchUser(with: userId) { user in
            DispatchQueue.main.async {
                self.save(user)
                self.loading = false
                self.user = user
            }
        } failure: { error in
            self.loading = false
        }
    }
    
    //MARK: - Realm methods
    private func save(_ comment: Comment) {
        
        do {
            try realm.write {
                realm.add(comment)
            }
        } catch {
            print("Error saving comment \(error)")
        }
    }
    
    private func save(_ user: User) {
        
        do {
            try realm.write {
                realm.add(user)
            }
        } catch {
            print("Error saving user \(error)")
        }
    }
    
    func delete(_ post: Post) {
        
        do {
            try realm.write {
                //let posts = realm.objects(Post.self)
                
                guard let thawedPost = post.thaw() else {
                    print("Couldn't thaw post")
                    return
                }
                realm.delete(thawedPost)
            }
        } catch {
            print("Error deleting post \(error)")
        }
    }
    


}
