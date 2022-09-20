//
//  images_page.swift
//  picmore_ios
//
//  Created by Ivan Stajcer on 31.07.2022..
//

import Foundation
import SwiftUI
import os.log

struct ImagesPage: View {
    @ObservedObject var viewModel: ListViewModel = ListViewModel()
    
    init() {
      let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.337254902, blue: 0.4352941176, alpha: 1)
      UINavigationBar.appearance().standardAppearance = coloredAppearance
      UINavigationBar.appearance().compactAppearance = coloredAppearance
      UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
        InfiniteList(data: $viewModel.images,
                     isLoading: $viewModel.isLoading,
                     isError: $viewModel.isError,
                     loadingView: ProgressView(),
                     loadMore: viewModel.loadMore
        ) { image in
          
                ListItem(image: image)
     

        }
    }
}
