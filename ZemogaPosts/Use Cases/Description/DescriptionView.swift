//
//  DescriptionView.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import SwiftUI

struct DescriptionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss

    @ObservedObject var descriptionViewModel: DescriptionViewModel

    @ObservedRealmObject var post: Post
    @ObservedResults(Comment.self) var comments
    @ObservedResults(User.self) var users
    
    var commentsOfPost : [Comment]? {
        Array(comments.where { $0.postId == post.id })
    }
    
    var user: User? {
        users.where { $0.id == post.userId}.first
    }

    init(post: Post, postsService: PostsServiceProtocol = PostsService()) {
        self.post = post
        _descriptionViewModel = ObservedObject(wrappedValue: DescriptionViewModel(postsService: postsService))
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(Constants.description)")
                    .font(.title)
                Text(post.body)
                    .font(.subheadline)
                    .lineLimit(5)
            } // DESCRIPTION
            .padding(.horizontal, 32)
            .padding(.vertical, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(Constants.user)")
                    .font(.title)
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
            } // USER
            .padding(.horizontal, 32)
            .padding(.vertical, 8)
            
            VStack(alignment: .leading, spacing: 4){
                Text("\(Constants.comments)")
                    .font(.title)
                    .padding(.leading, 32)
                ZStack {
                    if let commentsOfPost = commentsOfPost {
                        List(commentsOfPost, id: \.id) { comment in
                            Text("\(comment.body)")
                                .font(.body)
                        }
                        .listRowBackground(Color.white)
                        .cornerRadius(16)
                    }
                    if descriptionViewModel.loading {
                        ProgressView()
                    }
                }
            } // COMMENTS

        } // VSTACK
        
        ButtonView(action: {
            descriptionViewModel.delete(post)
            dismiss()
        }, text: Constants.delete)
        
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    $post.isFavorite.wrappedValue?.toggle()
                }) {
                    $post.isFavorite.wrappedValue ?? false ? Image(systemName: Constants.starFillImage).foregroundColor(.yellow): Image(systemName: Constants.starImage).foregroundColor(.gray)
                }
            }
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let postsService = PostsService()
        DescriptionView(post: Post(), postsService: postsService)
    }
}
