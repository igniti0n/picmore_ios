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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ImageView.details(with: image.urls.raw)
                HStack(alignment: .center, spacing: 100) {
                    ImageView.avatar(with: image.user?.profileImageUrls?.small ?? "")
                    Text("\(image.user?.username ?? "n/a")")
                }.padding()
                Text("\(image.user?.bio ?? "No bio provided for this user.")")
                    .padding()
            }
        }
    }
}
