//
//  MockDescriptionViewModel.swift
//  ZemogaPostsTests
//
//  Created by José Briones Romero on 21/7/22.
//

import Foundation
@testable import ZemogaPosts

final class MockDescriptionViewModel: DescriptionViewModelProtocol {
    
    var getCommentsCalled = false
    var getUserCalled = false
    var deleteCalled = false

    func getComments(of userId: Int) {
        getCommentsCalled = true
    }
    
    func getUser(with userId: Int) {
        getUserCalled = true
    }
    
    func delete(_ post: Post) {
        deleteCalled = true
    }
    
    

}
