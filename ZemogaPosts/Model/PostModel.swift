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
    @Persisted var userId: Int
    @Persisted var title: String
    @Persisted var body: String
    @Persisted var isFavorite: Bool? = false
}

