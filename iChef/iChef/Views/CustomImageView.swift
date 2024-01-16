//
//  CustomImageView.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//

import SwiftUI
import Kingfisher

struct CustomImageView: View {
    let imageURL: URL?

    var body: some View {
        KFImage(imageURL)
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
            .clipShape(Rectangle())
            .shadow(radius: 3)
            .redacted(reason: imageURL == nil ? .placeholder : .init())
    }

}
