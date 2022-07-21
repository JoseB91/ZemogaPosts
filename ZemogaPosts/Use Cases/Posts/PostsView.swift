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
    @ObservedResults(
        Post.self,
        where: { $0.isFavorite == true }
    ) var favoritePosts
    @State var showFavorites = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 16) {
                    Toggle("Show Favorites", isOn: $showFavorites)
                        .padding([.top, .leading, .trailing], 16)

                    let posts = showFavorites ? Array(favoritePosts) : Array(posts)
                    List(posts.sorted(by: { $0.isFavorite ?? false && !($1.isFavorite ?? false) }) , id: \.id) { post in
                        NavigationLink(destination: DescriptionView(post: post)) {
                            Text(post.title)
                                .font(.body)
                            if post.isFavorite ?? false {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    } // LIST
                    Button(action: {
                        postsViewModel.deleteAll()
                    }) {
                        Text("Delete All")
                            .foregroundColor(Color.white)
                    }
                        .frame(width: 200.0)
                        .font(.title3)
                        .background(Color.red)
                        .cornerRadius(8)
                        .padding(16)
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
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)) // TODO: Delete this line
            }
            .navigationTitle("\(Constants.posts)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        postsViewModel.deleteAll()
                        postsViewModel.getPosts()
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundColor(.gray)
                        }
                }
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
