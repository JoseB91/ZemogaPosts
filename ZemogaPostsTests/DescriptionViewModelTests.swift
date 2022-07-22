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
    let mockUserId = 1
    
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
        descriptionViewModel?.getComments(of: mockUserId)
        
        // Assert
        XCTAssert(mockPostsService.fetchCommentsCalled)
        XCTAssertNotNil(descriptionViewModel?.realm)
    }

    func test_getUser() throws {
        // Arrange
        guard let mockPostsService = mockPostsService else {
            XCTFail()
            return
        }

        // Act
        descriptionViewModel?.getUser(with: mockUserId)
        
        // Assert
        XCTAssert(mockPostsService.fetchUserCalled)
        XCTAssertNotNil(descriptionViewModel?.realm)
    }
}
