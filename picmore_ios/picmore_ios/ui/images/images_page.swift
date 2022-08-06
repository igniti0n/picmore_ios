//
//  images_page.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation

import SwiftUI

struct ImagesPageView: View {
    // MARK: Properties
    @ObservedObject var viewModel: ImagesViewModel
    
    // MARK: -Init
    init(viewModel: ImagesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Hello.")
    }
}
