//
//  DescriptionView.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import SwiftUI

struct DescriptionView: View {
    
    let post: Post
    @ObservedObject var descriptionViewModel = DescriptionViewModel()
    
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
                        HStack(alignment: .center, spacing: 8) {
                            Text("\(Constants.name)")
                                .font(.title3)
                            Text(descriptionViewModel.user.name)
                                .font(.body)
                        }
                        HStack(alignment: .center, spacing: 8) {
                            Text("\(Constants.email)")
                                .font(.title3)
                            Text(descriptionViewModel.user.email)
                                .font(.body)
                        }
                        HStack(alignment: .center, spacing: 8) {
                            Text("\(Constants.phone)")
                                .font(.title3)
                            Text(descriptionViewModel.user.phone)
                                .font(.body)
                        }
                        HStack(alignment: .center, spacing: 8) {
                            Text("\(Constants.website)")
                                .font(.title3)
                            Text(descriptionViewModel.user.website)
                                .font(.body)
                        }
                    }
                } // USER
                .padding(16)
                
                VStack(alignment: .leading, spacing: 16){
                    Text("\(Constants.comments)")
                        .font(.title)
                        .padding(.leading, 16)
                    ZStack {
                        List(descriptionViewModel.comments, id: \.id) { comment in
                            Text("\(comment.body)")
                                .font(.body)
                        }
                        if descriptionViewModel.loading {
                            ProgressView()
                        }
                    }
                } // COMMENTS
            } // VSTACK
            .padding(16)
            .onAppear {
                descriptionViewModel.getUser(with: post.userID)
                descriptionViewModel.getComments(of: post.userID)
            }
            .navigationTitle(post.title)
        }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(post: Post())
    }
}
