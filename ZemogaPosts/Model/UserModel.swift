//
//  UserModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import Foundation

import Foundation

struct User: Codable {
    var id: Int = 0
    var name: String = ""
    var username: String = ""
    var email: String = ""
    var address: Address = Address()
    var phone: String = ""
    var website: String = ""
    var company: Company = Company()
}

// MARK: - Address
struct Address: Codable {
    var street: String = ""
    var suite: String = ""
    var city: String = ""
    var zipcode: String = ""
    var geo: Geo = Geo()
}

// MARK: - Geo
struct Geo: Codable {
    var lat: String = ""
    var lng: String = ""
}

// MARK: - Company
struct Company: Codable {
    var name: String = ""
    var catchPhrase: String = ""
    var bs: String = ""
}
