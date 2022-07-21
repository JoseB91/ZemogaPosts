//
//  MockPostsViewModel.swift
//  ZemogaPostsTests
//
//  Created by José Briones Romero on 21/7/22.
//

import Foundation
@testable import ZemogaPosts

final class MockPostsViewModel: PostsViewModelProtocol {
    
    var getPostsCalled = false
    var deleteAllCalled = false
    
    func getPosts() {
        getPostsCalled = true
    }
    
    func deleteAll() {
        deleteAllCalled = true
    }

    
}
