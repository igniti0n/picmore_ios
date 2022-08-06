//
//  File.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation

protocol ImagesInteractor {
    func fetchImages(for page: Int) async throws -> [UnsplashImage]
}

class ImagesInteractorImpl: ImagesInteractor {
    // MARK: - Properties
    let imagesRepository: ImagesRepository
    
    // MARK: - init
    init() {
        imagesRepository = ServiceFactory.imagesRepository
    }

    func fetchImages(for page: Int) async throws -> [UnsplashImage] {
       try await imagesRepository.fetchImages(for: page)
    }
}
