//
//  unsplash_image.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation

struct UnsplashImage: Codable {
    let id: String
    let likes: Int
    let urls: Urls
    let user: User
}

struct Urls: Codable {
    let raw: String
}

struct User: Codable {
    let username: String
    let bio: String
    let profileImageUrls: ProfileImageUrls

    enum CodingKeys: String, CodingKey {
        case profileImageUrls = "profile_image"
        case username
        case bio
    }
}

struct ProfileImageUrls: Codable {
    let small: String
}
