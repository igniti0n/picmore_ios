//
//  filtered_image.swift
//  picmore_ios
//
//  Created by istajcer on 15.08.2022..
//

import Foundation
import SwiftUI
import os.log

struct FilteredImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State private var filterIntensity: Float = 10
    @State private var processedImage: UIImage = UIImage()
    private var currentFilter = CIFilter.colorMatrix()
    private let imageSaver = ImageSaver()
    private let context: CIContext
    private let detailsViewModel: ImageDetailsViewModel
    private let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "apptim")


    init(imageUrl: String, detailsViewModel: ImageDetailsViewModel) {
        self.imageLoader = ImageLoader(urlString: imageUrl)
        self.context = CIContext()
        self.detailsViewModel = detailsViewModel
    }
    
    var body: some View {
            VStack(alignment: .center) {
                Image(uiImage: processedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:  UIScreen.main.bounds.width, height: 600, alignment: .center)
                    .clipped()
                    .cornerRadius(0)
        
                Button("Apply filter.") {
                    applyProcessing()
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                Button("Save image to gallery.") {
                    save()
                }
            }
            .onReceive(imageLoader.didChange) { data in
                print("Loaded")
                processedImage = UIImage(data: data) ?? UIImage()
                loadImage()
            }
 
    }
    
    func loadImage() {
        let beginImage = CIImage(image: processedImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
    }
    
    func applyProcessing() {
        DispatchQueue.global().async {
            os_log("{APPTIM_EVENT}: %{public}@", log: log, "filterImg, START")
            currentFilter.setValue(CIVector(x: CGFloat(filterIntensity), y: 0, z: 0, w: 0), forKey: "inputRVector")
            currentFilter.setValue(CIVector(x: 0, y: CGFloat(filterIntensity), z: 0, w: 0), forKey: "inputGVector")
            currentFilter.setValue(CIVector(x: 0, y: 0, z: CGFloat(filterIntensity), w: 0), forKey: "inputBVector")
            guard let outputImage = currentFilter.outputImage else { return }
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                os_log("{APPTIM_EVENT}: %{public}@", log: log, "filterImg, STOP")
                DispatchQueue.main.async {
                    processedImage = UIImage(cgImage: cgimg)
                }
            }
        }
    }
    
    func save() {
        imageSaver.successHandler = {
            detailsViewModel.showToast = true
        }
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
}
