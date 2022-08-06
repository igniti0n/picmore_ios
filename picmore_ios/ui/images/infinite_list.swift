//
//  infinite_list.swift
//  picmore_ios
//
//  Created by istajcer on 05.08.2022..
//

import SwiftUI

public struct InfiniteList<Data, Content, LoadingView>: View
where Data: RandomAccessCollection, Data.Element: Hashable, Content: View, LoadingView: View  {
    // MARK: - Properties
    @Binding var data: Data
    @Binding var isLoading: Bool
    @Binding var isError: Bool
    let loadingView: LoadingView
    let loadMore: () -> Void
    let content: (Data.Element) -> Content
        
    // MARK: - Init
    public init(data: Binding<Data>,
         isLoading: Binding<Bool>,
                isError: Binding<Bool>,
         loadingView: LoadingView,
         loadMore: @escaping () -> Void,
         @ViewBuilder content: @escaping (Data.Element) -> Content) {
        _data = data
        _isError = isError
        _isLoading = isLoading
        self.loadingView = loadingView
        self.loadMore = loadMore
        self.content = content
    }
    
    // MARK: - Computed propertes
    public var body: some View {
            List {
                listItems
            }.onAppear(perform: loadMore)
            .listStyle(PlainListStyle())
    }
    
    private var listItems: some View {
        Group {
            ForEach(data, id: \.self) { item in
                content(item)
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
