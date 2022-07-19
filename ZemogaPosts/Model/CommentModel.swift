//
//  CommentModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import Foundation

class Comment: Object, Codable {
    @Persisted var id: Int
    @Persisted var postID: Int
    @Persisted var name: String
    @Persisted var email: String
    @Persisted var body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
