//
//  PostsView.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import SwiftUI

struct PostsView: View {
    
    @ObservedObject var postsViewModel = PostsViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(postsViewModel.posts, id: \.id) { post in
                    NavigationLink(destination: DescriptionView(post: post)) {
                        Text(post.title)
                            .font(.body)
                    } // Link
                } // List
                if postsViewModel.loading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } // Loading
            } // ZStack
            .onAppear {
                postsViewModel.getPosts()
            }
            .navigationTitle("\(Constants.posts)")
        } // Navigation View
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
