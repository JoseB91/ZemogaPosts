//
//  MockPostsService.swift
//  ZemogaPostsTests
//
//  Created by José Briones Romero on 20/7/22.
//

import Foundation
@testable import ZemogaPosts

final class MockPostsService: PostsServiceProtocol {
    
    var fetchPostsCalled = false
    var fetchCommentsCalled = false
    var fetchUserCalled = false
        
    let mockPosts: [Post] = [Post()]
    let mockComments: [Comment] = [Comment()]
    let mockUser: User = User()

    func fetchPosts(success: @escaping ([Post]) -> Void, failure: @escaping (Error?) -> Void) {
        fetchPostsCalled = true
        success(mockPosts)
    }
    
    func fetchComments(of userId: Int, success: @escaping ([Comment]) -> Void, failure: @escaping (Error?) -> Void) {
        fetchCommentsCalled = true
        success(mockComments)
    }
    
    func fetchUser(with userId: Int, success: @escaping (User) -> Void, failure: @escaping (Error?) -> Void) {
        fetchUserCalled = true
        success(mockUser)
    }
    
}
