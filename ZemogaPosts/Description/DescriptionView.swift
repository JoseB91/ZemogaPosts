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
        // ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(Constants.description)")
                        .font(.title)
                    Text(post.body)
                        .font(.subheadline)
                        .lineLimit(4)
                } // DESCRIPTION
                
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
            } // VSTACK
            .padding(16)
            
            VStack(alignment: .leading, spacing: 16){
                Text("\(Constants.comments)")
                    .font(.title)
            }
            
            List(descriptionViewModel.comments, id: \.id) { comment in
                Text("\(comment.body)")
                    .font(.body)
            }
            .onAppear {
                descriptionViewModel.getUser(with: post.userID)
                descriptionViewModel.getComments(of: post.userID)
            }
            .navigationTitle(post.title)
        }
    // }

}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(post: Post(userID: 1, id: 1, title: "Title", body: "Body"))
    }
}
