//
//  PostModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import Foundation

class Post: Object, ObjectKeyIdentifiable, Codable {
    @Persisted var id: Int
    @Persisted var userID: Int
    @Persisted var title: String
    @Persisted var body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

