//
//  list_item.swift
//  picmore_ios
//
//  Created by istajcer on 05.08.2022..
// wasacri, fottolok,adammy, anataero, ninjason

import SwiftUI
import Alamofire
import os.log

struct ListItem: View {
    var onItemTapped: (() -> Void)?
    let image: UnsplashImage
    @State private var showingNavView = false
    
    var body: some View {
        NavigationLink(isActive: $showingNavView) {
            ImageDetails(image: image)
        } label: {
            ZStack(alignment: .bottom) {
                ImageView.list(with: image.urls.raw)
                ListItemFooter(numberOfLikes: "\(image.likes)", username: image.user?.username ?? "n/a")
            }
            .clipShape(CornerRadiusShape(radius: 20, corners: .allCorners))
        }.onDisappear {
        }.onTapGesture {
            showingNavView = true
            let log = OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "apptim")
            os_log("{APPTIM_EVENT}: %{public}@", log: log, "navGo, START")
        }
       
    }
    
    private struct CornerRadiusShape: Shape {
            var radius = CGFloat.infinity
            var corners = UIRectCorner.allCorners

            func path(in rect: CGRect) -> Path {
                let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
                return Path(path.cgPath)
            }
        }
}
