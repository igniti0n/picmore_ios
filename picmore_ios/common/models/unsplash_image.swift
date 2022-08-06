//
//  unsplash_image.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation

struct UnsplashImage: Codable, Hashable {
    static func == (lhs: UnsplashImage, rhs: UnsplashImage) -> Bool {
      lhs.id == rhs.id
    }
    
    let id: String
    let likes: Int
    let urls: Urls
    let user: User?
}

struct Urls: Codable, Hashable {
    let raw: String
}

struct User: Codable, Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.bio == rhs.bio
    }
    
    let username: String
    let bio: String?
    let profileImageUrls: ProfileImageUrls?

    enum CodingKeys: String, CodingKey {
        case profileImageUrls = "profile_image"
        case username
        case bio
    }
}

struct ProfileImageUrls: Codable, Hashable {
    let small: String
    
    static func == (lhs: ProfileImageUrls, rhs: ProfileImageUrls) -> Bool {
        lhs.small == rhs.small
    }
}
