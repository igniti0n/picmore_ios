//
//  infinite_list.swift
//  picmore_ios
//
//  Created by istajcer on 05.08.2022..
//

import SwiftUI

struct InfiniteList<Content, LoadingView>: View
where Content: View, LoadingView: View  {
    // MARK: - Properties
    @Binding var data: [UnsplashImage]
    @Binding var isLoading: Bool
    @Binding var isError: Bool
    let loadingView: LoadingView
    let loadMore: () -> Void
    let content: (UnsplashImage) -> Content
    let myColor = Color(#colorLiteral(red: 1, green: 0.7568627451, blue: 0.2, alpha: 1))
    let blueColor = Color(#colorLiteral(red: 0, green: 0.337254902, blue: 0.4352941176, alpha: 1))

    // MARK: - Init
    init(data: Binding<[UnsplashImage]>,
         isLoading: Binding<Bool>,
                isError: Binding<Bool>,
         loadingView: LoadingView,
         loadMore: @escaping () -> Void,
         @ViewBuilder content: @escaping (UnsplashImage) -> Content) {
        _data = data
        _isError = isError
        _isLoading = isLoading
        self.loadingView = loadingView
        self.loadMore = loadMore
        self.content = content
    }
    
    // MARK: - Computed propertes
     var body: some View {
            List {
                listItems
            }
            .onAppear(perform: loadMore)
            .listStyle(GroupedListStyle())
    }
    
    var listItems: some View {
        Group {
            ForEach(data, id: \.id) { item in
                content(item)
                    .listRowBackground(myColor)
                    .onAppear {
                        if item == data.last {
                            loadMore()
                        }
                    }
            }
            if isError && !isLoading {
                Text("Error fetchign, try again?")
                    .onTapGesture {
                        loadMore()
                    }
            }
            if isLoading {
                loadingView
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
