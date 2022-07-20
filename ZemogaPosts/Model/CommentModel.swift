//
//  CommentModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import Foundation

class Comment: Object, ObjectKeyIdentifiable, Codable {
    @Persisted var id: Int
    @Persisted var postId: Int
    @Persisted var name: String
    @Persisted var email: String
    @Persisted var body: String
}
