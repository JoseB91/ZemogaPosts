//
//  PostsService.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 19/7/22.
//

import Foundation

protocol PostsServiceProtocol {
    func fetchPosts(success: @escaping (_ posts: [Post]) -> Void,
              failure: @escaping (_ error: Error?) -> Void)
    
    func fetchComments(of userId: Int,
              success: @escaping (_ comemnts: [Comment]) -> Void,
              failure: @escaping (_ error: Error?) -> Void)
    
    func fetchUser(with userId: Int,
              success: @escaping (_ user: User) -> Void,
              failure: @escaping (_ error: Error?) -> Void)
    
    
}

final class PostsService: PostsServiceProtocol {
        
    // MARK: API
    private enum PostsServiceAPI {
        
        case posts
        case comments(Int)
        case user(Int)
        
        func url() -> URL? {
            
            let postsUri = Constants.postsUri
            let commentsUri = Constants.commentsUri
            let usersUri = Constants.usersUri
            
            switch self {
            case .posts:
                return URL(string: postsUri)
            case .comments(let userId):
                return URL(string: "\(postsUri)/\(userId)/\(commentsUri)")
            case .user(let userId):
                return URL(string: "\(usersUri)/\(userId)")
            }
        }
    }
    
    // MARK: Services
        
    func fetchPosts(success: @escaping (_ posts: [Post]) -> Void,
              failure: @escaping (_ error: Error?) -> Void) {
        
        guard let url = PostsServiceAPI.posts.url() else {
            failure(URLError(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
            let response = response as? HTTPURLResponse,
            error == nil else {
                print("Error", error ?? URLError(.badServerResponse))
                failure(error)
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                print("StatusCode: \(response.statusCode)")
                print("Response: \(response)")
                failure(error)
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                success(posts)
            } catch {
                print(error)
                failure(error)
            }
        }.resume()
    }
    
    func fetchComments(of userId: Int,
              success: @escaping (_ comemnts: [Comment]) -> Void,
              failure: @escaping (_ error: Error?) -> Void) {
        
        guard let url = PostsServiceAPI.comments(userId).url() else {
            failure(URLError(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
            let response = response as? HTTPURLResponse,
            error == nil else {
                print("Error", error ?? URLError(.badServerResponse))
                failure(error)
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                print("StatusCode: \(response.statusCode)")
                print("Response: \(response)")
                failure(error)
                return
            }
            
            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                success(comments)
            } catch {
                print(error)
                failure(error)
            }
        }.resume()
    }
    
    func fetchUser(with userId: Int,
              success: @escaping (_ user: User) -> Void,
              failure: @escaping (_ error: Error?) -> Void) {
        
        guard let url = PostsServiceAPI.user(userId).url() else {
            failure(URLError(.badURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
            let response = response as? HTTPURLResponse,
            error == nil else {
                print("Error", error ?? URLError(.badServerResponse))                
                failure(error)
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                print("StatusCode: \(response.statusCode)")
                print("Response: \(response)")
                failure(error)
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                success(user)
            } catch {
                print(error)
                failure(error)
            }
        }.resume()
    }
}
    
