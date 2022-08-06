//
//  list_item.swift
//  picmore_ios
//
//  Created by istajcer on 05.08.2022..
//

import SwiftUI
import Alamofire

struct ListItem: View {
    var onItemTapped: (() -> Void)?
    let image: UnsplashImage
    
    var body: some View {
        ImageView.list(with: image.urls.raw)
    }
}

struct ImageView: View {
    // MARK: - Properties
    @ObservedObject var imageLoader: ImageLoader
    @State var image:UIImage = UIImage()
    let height: Double
    let width: Double
    let cornerRadius: Double
    
    // MARK: - Init
    init(withURL url:String, height: Double, width: Double, cornerRadius: Double = 20) {
        imageLoader = ImageLoader(urlString:url)
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
    }
    
    static func avatar(with url: String) -> ImageView {
        ImageView(withURL: url, height: 48, width: 48, cornerRadius: 80)
    }
    
    static func list(with url: String) -> ImageView {
        ImageView(withURL: url,  height: 400, width: UIScreen.main.bounds.width - 40)
    }
    
    static func details(with url: String) -> ImageView {
        ImageView(withURL: url, height: 600, width:  UIScreen.main.bounds.width, cornerRadius: 0)
    }
    
    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height, alignment: .center)
                .clipped()
                .cornerRadius(cornerRadius)
                .onReceive(imageLoader.didChange) { data in
                        self.image = UIImage(data: data) ?? UIImage()
                }
    }
}

