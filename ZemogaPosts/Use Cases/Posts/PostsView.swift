//
//  PostsView.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import SwiftUI

struct PostsView: View {
    
    @ObservedObject var postsViewModel = PostsViewModel()
    @ObservedResults(Post.self) var posts
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 8) {
                    List(posts, id: \.id) { post in
                        NavigationLink(destination: DescriptionView(post: post)) {
                            Text(post.title)
                                .font(.body)
                        }
                    } // LIST
                    Button(action: {
                        postsViewModel.deleteAll()
                    }) {
                        Text("Delete")
                    }
                }
                if postsViewModel.loading {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            } // ZSTACK
            .onAppear {
                if posts.isEmpty {
                    postsViewModel.getPosts()
                }
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
            }
            .navigationTitle("\(Constants.posts)")
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
