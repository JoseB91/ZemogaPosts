//
//  PostViewModelTests.swift
//  PostViewModelTests
//
//  Created by José Briones Romero on 18/7/22.
//

import XCTest
@testable import ZemogaPosts

class PostViewModelTests: XCTestCase {

    var postsViewModel: PostsViewModel?
    var mockPostsService: MockPostsService?
    
    override func setUpWithError() throws {
        mockPostsService = MockPostsService()
        guard let mockPostsService = mockPostsService else { return }
        postsViewModel = PostsViewModel(postsService: mockPostsService)
    }

    override func tearDownWithError() throws {
        postsViewModel = nil
        mockPostsService = nil
    }

    func test_getPosts() throws {
        // Arrange
        guard let mockPostsService = mockPostsService else {
            XCTFail()
            return
        }

        // Act
        postsViewModel?.getPosts()
        
        // Assert
        XCTAssert(mockPostsService.fetchPostsCalled)
    }

}
