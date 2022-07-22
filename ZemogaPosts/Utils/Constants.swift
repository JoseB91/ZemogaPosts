//
//  Constants.swift
//  ZemogaPosts
//
//  Created by José Briones Romero on 18/7/22.
//

import Foundation

struct Constants {
    
    // URIs
    static let postsUri = "https://jsonplaceholder.typicode.com/posts"
    static let usersUri = "https://jsonplaceholder.typicode.com/users"
    static let commentsUri = "comments"
    
    // UI Texts
    static let posts = "Posts"
    static let description = "Description"
    static let user = "User"
    static let name = "Name"
    static let email = "Email"
    static let phone = "Phone"
    static let website = "Website"
    static let comments = "Comments"
    static let deleteAll = "Delete All"
    static let delete = "Delete"
    static let showFavorites = "Show Favorites"
    
    //System Images
    static let loadImage = "arrow.counterclockwise"
    static let starFillImage = "star.fill"
    static let starImage = "star"
    
    // Errors
    static let couldNotSave = "An error has occured saving data."
    static let couldNotDelete = "An error has occured deleting data."
    static let couldNotThaw = "An error has occured thawing data."

}
