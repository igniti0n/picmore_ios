//
//  images_repository_impl.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation
import Alamofire

class ImagesRepositoryImpl: ImagesRepository {
    func fetchImages(for page: Int) async throws -> [UnsplashImage] {

        try await withCheckedThrowingContinuation { continuation in
            AF.request("https://api.unsplash.com/photos", method: .get, parameters: ["page" : page], interceptor: ClientTokenInterceptor())
                .responseDecodable(of: [UnsplashImage].self) { response in
                    print("Page: \(page)")
                    print("Response: \(response)")
                    switch response.result {
                    case .success(let images):
                        continuation.resume(with: .success(images))
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
        
    }
}


class ClientTokenInterceptor: RequestInterceptor {
    static var defaultParameters = ["client_id": "CLK0SBmLhZBvGYfNrPNVAy4MNWXpC2NXMxZdGVAmjZA"]
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        let encoding = URLEncodedFormParameterEncoder.default
        if let request = try? encoding.encode(ClientTokenInterceptor.defaultParameters, into: urlRequest) {
            urlRequest = request
        }
        print("Req: \(urlRequest)")

        completion(.success(urlRequest))
    }
}
