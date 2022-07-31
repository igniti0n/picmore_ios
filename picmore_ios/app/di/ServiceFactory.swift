//
//  File.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation

struct ServiceFactory {
    static var imagesRepository: ImagesRepository = {
        ImagesRepositoryImpl()
    }()
    
    static var imagesInteractor: ImagesInteractor = {
        ImagesInteractorImpl()
    }()
}
