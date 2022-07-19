//
//  PostModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import Foundation

struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

