//
//  CardView.swift
//  iChef
//
//  Created by Nathalia Inacio on 14/01/24.
//

import SwiftUI

struct CardView: View {
    
    var title: String?
    var recipeImageURL: URL?
    var ingredientImageURL: URL? {
        let urlString = "https://www.themealdb.com/images/ingredients/\(title?.withSpacesEncoded() ?? "").png"
         return URL(string: urlString)
     }
    
    var body: some View {
        HStack(spacing: 16) {
            CustomImageView(imageURL: recipeImageURL == nil ? ingredientImageURL : recipeImageURL)
                .foregroundColor(recipeImageURL == nil ? .clear : .gray)
                .frame(width: recipeImageURL == nil ? 60 : 100, height: recipeImageURL == nil ? 60 : 100)
                .padding(.leading, 16)

            Text(title ?? "")
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(Color.black)
                .padding(.trailing, 48)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .padding()
                .background(AppTheme.primaryColor)
                .clipShape(Circle())
                .padding(.leading, -70)
                .frame(width: 20, height: 20, alignment: .trailing)
            
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: 70, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(AppTheme.primaryColor, lineWidth: 1)
        )
    }
}

extension String {
    func withSpacesEncoded() -> String {
        return addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? self
    }
}

extension URL {
    func withSpacesEncoded() -> URL {
        if let encodedString = absoluteString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
           let encodedURL = URL(string: encodedString) {
            return encodedURL
        }
        return self
    }
}
