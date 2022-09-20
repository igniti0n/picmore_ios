//
//  image_details.swift
//  picmore_ios
//
//  Created by istajcer on 05.08.2022..
//

import Foundation
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
import os.log

struct ImageDetails: View {
    let image: UnsplashImage
    @ObservedObject var viewModel = ImageDetailsViewModel()
    
    init(image: UnsplashImage) {
        self.image = image
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "apptim")
        os_log("{APPTIM_EVENT}: %{public}@", log: log, "navGo, STOP")
    }
    
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                FilteredImage(imageUrl: image.urls.raw, detailsViewModel: viewModel)
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
                }
                .padding()
                Text("\(image.user?.bio ?? "No bio provided for this user.")")
                 .padding()
            }
        }
        .toast(message: "Image saved to gallery!",
               isShowing: $viewModel.showToast)
    }
    
}
