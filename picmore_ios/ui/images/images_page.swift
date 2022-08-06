//
//  images_page.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation
import SwiftUI

struct ImagesPage: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        InfiniteList(data: $viewModel.images,
                     isLoading: $viewModel.isLoading,
                     isError: $viewModel.isError,
                     loadingView: ProgressView(),
                     loadMore: viewModel.loadMore
        ) { image in
            NavigationLink {
                ImageDetails(image: image)
            } label: {
                ListItem(image: image)
            }

        }
    }
}
