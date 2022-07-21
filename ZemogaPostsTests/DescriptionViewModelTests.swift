//
//  DescriptionViewModelTests.swift
//  ZemogaPostsTests
//
//  Created by José Briones Romero on 21/7/22.
//

import XCTest
@testable import ZemogaPosts

class DescriptionViewModelTests: XCTestCase {

    var descriptionViewModel: DescriptionViewModel?
    var mockPostsService: MockPostsService?

    
    override func setUpWithError() throws {
        mockPostsService = MockPostsService()
        guard let mockPostsService = mockPostsService else { return }
        descriptionViewModel = DescriptionViewModel(postsService: mockPostsService)
    }

    override func tearDownWithError() throws {
        descriptionViewModel = nil
        mockPostsService = nil
    }
    
    func test_getComments() throws {
        // Arrange
        guard let mockPostsService = mockPostsService else {
            XCTFail()
            return
        }

        // Act
        descriptionViewModel?.getComments(of: 1) //TODO: Change this
        
        // Assert
        XCTAssert(mockPostsService.fetchCommentsCalled)
    }

    func test_getUser() throws {
        // Arrange
        guard let mockPostsService = mockPostsService else {
            XCTFail()
            return
        }

        // Act
        descriptionViewModel?.getUser(with: 1) //TODO: Change this
        
        // Assert
        XCTAssert(mockPostsService.fetchUserCalled)
    }
}
