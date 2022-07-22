//
//  PostsView.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import SwiftUI

struct PostsView: View {
    
    @ObservedObject var postsViewModel: PostsViewModel
    @ObservedResults(Post.self) var posts
    @ObservedResults(
        Post.self,
        where: { $0.isFavorite == true }
    ) var favoritePosts
    @State var showFavorites = false
    
    init(postsService: PostsServiceProtocol = PostsService()) {
        _postsViewModel = ObservedObject(wrappedValue: PostsViewModel(postsService: postsService))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 16) {
                    Toggle(Constants.showFavorites, isOn: $showFavorites)
                        .padding([.top, .leading, .trailing], 16)

                    let posts = showFavorites ? Array(favoritePosts) : Array(posts)
                    List(posts.sorted(by: { $0.isFavorite ?? false && !($1.isFavorite ?? false) }) , id: \.id) { post in
                        NavigationLink(destination: DescriptionView(post: post)) {
                            Text(post.title)
                                .font(.body)
                            if post.isFavorite ?? false {
                                Image(systemName: Constants.starFillImage)
                                    .foregroundColor(.yellow)
                            }
                        }
                    } // LIST
                    .cornerRadius(16)
                    ButtonView(action: {
                        postsViewModel.deleteAll()
                    }, text: Constants.deleteAll)
                } // VSTACK
                if postsViewModel.loading {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            } // ZSTACK
            .onAppear {
                if posts.isEmpty {
                    postsViewModel.getPosts()
                }
            }
            .navigationTitle("\(Constants.posts)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        postsViewModel.deleteAll()
                        postsViewModel.getPosts()
                    }) {
                        Image(systemName: Constants.loadImage)
                            .foregroundColor(.gray)
                        }
                }
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
   
    static let postsService = PostsService()
    
    static var previews: some View {
        PostsView(postsService: postsService)
    }
}
