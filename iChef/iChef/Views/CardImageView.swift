//
//  CardImageView.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//

import SwiftUI
import Kingfisher

struct CardImageView: View {
    let imageURL: URL?

    var body: some View {
        KFImage(imageURL)
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
            .clipShape(Rectangle())
            .shadow(radius: 3)
            .redacted(reason: imageURL == nil ? .placeholder : .init())
    }

}
