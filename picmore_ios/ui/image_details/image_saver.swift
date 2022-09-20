//
//  image_saver.swift
//  picmore_ios
//
//  Created by istajcer on 15.08.2022..
//

import Foundation
import UIKit
import os.log

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "apptim")

    func writeToPhotoAlbum(image: UIImage) {
        os_log("{APPTIM_EVENT}: %{public}@", log: log, "saveImage, START")
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveComplete), nil)
    }

    @objc func saveComplete(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            os_log("{APPTIM_EVENT}: %{public}@", log: log, "saveImage, STOP")
            successHandler?()
        }
    }
}
