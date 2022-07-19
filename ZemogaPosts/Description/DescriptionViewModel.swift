//
//  DescriptionViewModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import Foundation

final class DescriptionViewModel: ObservableObject {
    
    @Published private(set) var loading = false
    @Published private(set) var comments = [Comment]()
    @Published private(set) var user = User()

    func getComments(of userId: Int) {
                    
        loading = true
        PostsService.shared.fetchComments(of: userId) { comments in
            DispatchQueue.main.async {
                self.loading = false
                self.comments = comments
            }
        } failure: { error in
            self.loading = false
        }
    }
    
    func getUser(with userId: Int) {
                    
        loading = true
        PostsService.shared.fetchUser(with: userId) { user in
            DispatchQueue.main.async {
                self.loading = false
                self.user = user
            }
        } failure: { error in
            self.loading = false
        }
    }
}
