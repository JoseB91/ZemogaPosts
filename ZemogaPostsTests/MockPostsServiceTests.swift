//
//  MockPostsServiceTests.swift
//  ZemogaPostsTests
//
//  Created by José Briones Romero on 21/7/22.
//

import XCTest
@testable import ZemogaPosts

class MockPostsServiceTests: XCTestCase {

    var mockPostsService: MockPostsService?
    let mockUserId = 1
    
    override func setUpWithError() throws {
        mockPostsService = MockPostsService()
    }

    override func tearDownWithError() throws {
        mockPostsService = nil
    }

    func test_fetchPosts() throws {
        // Arrange
        guard let mockPostsService = mockPostsService else {
            XCTFail()
            return
        }
        
        let expectation = XCTestExpectation(description: "Success case fetching posts")
        var expectedPosts = [Post()]
        
        // Act
        mockPostsService.fetchPosts { posts in
            expectation.fulfill()
            expectedPosts = posts
        } failure: { error in
            XCTFail()
        }

        // Assert
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(expectedPosts.count, mockPostsService.mockPosts.count)
        XCTAssertEqual(expectedPosts.first, mockPostsService.mockPosts.first)
        XCTAssert(mockPostsService.fetchPostsCalled)
    }

    func test_fetchComments() throws {
        // Arrange
        guard let mockPostsService = mockPostsService else {
            XCTFail()
            return
        }
        
        let expectation = XCTestExpectation(description: "Success case fetching comments")
        var expectedComments = [Comment()]
        
        // Act
        mockPostsService.fetchComments(of: mockUserId) { comments in
            expectation.fulfill()
            expectedComments = comments
        } failure: { error in
            XCTFail()
        }

        // Assert
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(expectedComments.count, mockPostsService.mockComments.count)
        XCTAssertEqual(expectedComments.first, mockPostsService.mockComments.first)
        XCTAssert(mockPostsService.fetchCommentsCalled)
    }
    
    func test_fetchUser() throws {
        // Arrange
        guard let mockPostsService = mockPostsService else {
            XCTFail()
            return
        }
        
        let expectation = XCTestExpectation(description: "Success case fetching user")
        var expectedUser = User()
        
        // Act
        mockPostsService.fetchUser(with: mockUserId) { user in
            expectation.fulfill()
            expectedUser = user
        } failure: { error in
            XCTFail()
        }

        // Assert
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(expectedUser, mockPostsService.mockUser)
        XCTAssert(mockPostsService.fetchUserCalled)
    }
}
