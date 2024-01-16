//
//  VideoComponentView.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//

import SwiftUI

struct VideoComponentView: View {
    let videoURL: String
    let detailImageURL: String

    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 200, height: 120)
                .cornerRadius(10)

            CardImageView(imageURL: URL(string: detailImageURL))
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: (UIScreen.main.bounds.width - 30)/3)
                .cornerRadius(10)
                .overlay(
                    VStack {
                        Button(action: {
                            openYouTube(url: videoURL)
                        }, label: {
                            Image(systemName: "play.fill")
                                .foregroundColor(AppTheme.accentColor)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                    })
            }
            .cornerRadius(10)
    }
}

func openYouTube(url: String) {
    guard let url = URL(string: url) else { return }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
}

struct VideoComponentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoComponentView(videoURL: "", detailImageURL: "")
    }
}
