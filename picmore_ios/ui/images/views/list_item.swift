//
//  list_item.swift
//  picmore_ios
//
//  Created by istajcer on 05.08.2022..
//

import SwiftUI
import Alamofire

struct ListItem: View {
    var onItemTapped: (() -> Void)?
    let image: UnsplashImage
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageView.list(with: image.urls.raw)
            ListItemFooter(numberOfLikes: "\(image.likes)", username: image.user?.username ?? "n/a")
        }
        .clipShape(CornerRadiusShape(radius: 20, corners: .allCorners))
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
