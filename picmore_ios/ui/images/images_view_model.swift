//
//  images_view_model.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//
import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    // MARK: - Properties
    @Published var images = [UnsplashImage]()
    @Published var isLoading = false
    @Published var isError = false
    private var page = 0
    private let imagesInteractor: ImagesInteractor = ImagesInteractorImpl()
}

// MARK: - Public methods
extension ListViewModel {
    func loadMore() {
        guard !isLoading else { return }
        isLoading = true
        Task {
            do {
                let newImages = try await imagesInteractor.fetchImages(for: page)
                showLoaded(with: newImages)
            } catch(let error) {
                showError()
                print("Error fetching images: \(error)")
            }
        }
    }
}

// MARK: - Private methods
private extension ListViewModel {
    func showError() {
        DispatchQueue.main.async { [weak self] in
            self?.isError = false
            self?.isLoading = false
        }
    }
    
    func showLoaded(with newImages: [UnsplashImage]) {
        DispatchQueue.main.async { [weak self] in
            self?.page += 1
            self?.images.append(contentsOf: newImages)
            self?.isError = true
            self?.isLoading = false
        }
    }
}

