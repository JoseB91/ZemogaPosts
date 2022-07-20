//
//  UserModel.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import RealmSwift
import Foundation

class User: Object, ObjectKeyIdentifiable, Codable {
    @Persisted var id: Int = 0
    @Persisted var name: String = ""
    var username: String = ""
    @Persisted var email: String = ""
    var address: Address = Address()
    @Persisted var phone: String = ""
    @Persisted var website: String = ""
    var company: Company = Company()
}

// MARK: - Address
class Address: Codable {
    var street: String = ""
    var suite: String = ""
    var city: String = ""
    var zipcode: String = ""
    var geo: Geo = Geo()
}

// MARK: - Geo
class Geo: Codable {
    var lat: String = ""
    var lng: String = ""
}

// MARK: - Company
class Company: Codable {
    var name: String = ""
    var catchPhrase: String = ""
    var bs: String = ""
}
