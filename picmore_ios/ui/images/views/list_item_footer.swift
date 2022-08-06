//
//  list_item_footer.swift
//  picmore_ios
//
//  Created by istajcer on 06.08.2022..
//

import Foundation
import SwiftUI

struct ListItemFooter: View {
    let numberOfLikes: String
    let username: String
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: "heart-sharp")!)
                .resizable()
                .frame(width: 28, height: 28, alignment: .center)
                .aspectRatio(contentMode: .fit)
            Text(numberOfLikes)
            Spacer()
            Text(username)
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .background(Color.white.opacity(0.8))
    }
}
