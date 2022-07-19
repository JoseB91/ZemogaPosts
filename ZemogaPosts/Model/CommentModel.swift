//
//  CommentModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import Foundation

struct Comment: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
