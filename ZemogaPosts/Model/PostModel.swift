//
//  PostModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import Foundation

class Post: Object, Codable {
    @Persisted var id: Int
    @Persisted var userID: Int
    @Persisted var title: String
    @Persisted var body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

//class Rate: Object, ObjectKeyIdentifiable, Codable {
//    var motd = Motd()
//    var success = false
//    @Persisted var query: Query?
//    var info = Info()
//    @Persisted var date: String
//    @Persisted var result: Double
//}
//
//extension Rate {
//    convenience init(from: String, to: String, date: String, result: Double) {
//        self.init()
//        self.query?.from = from
//        self.query?.to = to
//        self.date = date
//        self.result = result
//    }
//}
//
//class Query: EmbeddedObject, ObjectKeyIdentifiable, Codable {
//    @Persisted var from: String
//    @Persisted var to: String
//    var amount = 0
//}
//
