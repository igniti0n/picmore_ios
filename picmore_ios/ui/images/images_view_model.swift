//
//  images_view_model.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation

enum ImagesPageState {
    case loading
    case loaded
    case error
}

final class ImagesViewModel: ObservableObject {
    // MARK: - Properties
    @Published var state: ImagesPageState = .loading
    let imagesInteractor: ImagesInteractor
    
    // MARK: - Init
    init() {
        self.imagesInteractor = ServiceFactory.imagesInteractor
        fetchImages(for: 0)
    }
}

// MARK: - Public methods
extension ImagesViewModel {
    func fetchImages(for page: Int) {
        do {
            Task {
                let images = try await imagesInteractor.fetchImages(for: page)
                print("Got images!, \(images)")
            }
        } catch(let error) {
            state = .error
            print("Error!, \(error)")
        }
      
    }
}

// MARK: - Private methods
private extension ImagesViewModel {
    
}

