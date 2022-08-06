//
//  image_details.swift
//  picmore_ios
//
//  Created by istajcer on 05.08.2022..
//

import Foundation
import SwiftUI

struct ImageDetails: View {
    let image: UnsplashImage
    @ObservedObject var viewModel = ImageDetailsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ImageView.details(with: image.urls.raw)
                HStack(alignment: .center) {
                    Image(uiImage: UIImage(named: "heart-sharp")!)
                        .resizable()
                        .frame(width: 28, height: 28, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    Text("\(image.likes)")
                        .padding()
                    Spacer()
                    ImageView.avatar(with: image.user?.profileImageUrls?.small ?? "")
                    Spacer()
                    Text("\(image.user?.username ?? "n/a")")
                }.padding()
                Text("\(image.user?.bio ?? "No bio provided for this user.")")
                    .padding()
                Button("Calculate fibonacci") {
                    viewModel.calculateNumber()
                }
                Text("\(viewModel.fibonacciNumber)")
            }
        }
    }
}
