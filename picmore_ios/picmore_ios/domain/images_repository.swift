//
//  images_repository.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation

protocol ImagesRepository {
    func fetchImages(for page: Int) async throws -> [UnsplashImage]
}
