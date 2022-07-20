//
//  DescriptionView.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import SwiftUI

struct DescriptionView: View {
    
    @ObservedRealmObject var post: Post
    @ObservedObject var descriptionViewModel = DescriptionViewModel()
    @ObservedResults(Comment.self) var comments
    @ObservedResults(User.self) var users
    
    var commentsOfPost : [Comment]? {
        Array(comments.where { $0.postId == post.id })
    }
    
    var user: User? {
        users.where { $0.id == post.userId}.first
    }
    
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(Constants.description)")
                        .font(.title)
                    Text(post.body)
                        .font(.subheadline)
                        .lineLimit(4)
                } // DESCRIPTION
                .padding(16)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(Constants.user)")
                        .font(.title)
                    VStack(alignment: .leading, spacing: 8) {
                        if let user = user {
                            HStack(alignment: .center, spacing: 8) {
                                Text("\(Constants.name)")
                                    .font(.title3)
                                Text(user.name)
                                    .font(.body)
                            }
                            HStack(alignment: .center, spacing: 8) {
                                Text("\(Constants.email)")
                                    .font(.title3)
                                Text(user.email)
                                    .font(.body)
                            }
                            HStack(alignment: .center, spacing: 8) {
                                Text("\(Constants.phone)")
                                    .font(.title3)
                                Text(user.phone)
                                    .font(.body)
                            }
                            HStack(alignment: .center, spacing: 8) {
                                Text("\(Constants.website)")
                                    .font(.title3)
                                Text(user.website)
                                    .font(.body)
                            }
                        }
                    }
                } // USER
                .padding(16)
                
                VStack(alignment: .leading, spacing: 16){
                    Text("\(Constants.comments)")
                        .font(.title)
                        .padding(.leading, 16)
                    ZStack {
                        if let commentsOfPost = commentsOfPost {
                            List(commentsOfPost, id: \.id) { comment in
                                Text("\(comment.body)")
                                    .font(.body)
                            }
                        }
                        if descriptionViewModel.loading {
                            ProgressView()
                        }
                    }
                } // COMMENTS
            } // VSTACK
            .padding(16)
            .onAppear {
                if let commentsOfPost = commentsOfPost, commentsOfPost.isEmpty {
                    descriptionViewModel.getComments(of: post.id)
                }
                guard let _ = user else {
                    descriptionViewModel.getUser(with: post.userId)
                    return
                }
            }
            .navigationTitle(post.title)
        }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(post: Post())
    }
}
