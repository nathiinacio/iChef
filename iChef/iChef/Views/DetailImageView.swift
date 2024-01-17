//
//  DetailImageView.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//

import SwiftUI

struct DetailImageView: View {
    let recipeID: String
    let detailImageURL: URL?
    @Environment(\.presentationMode) var presentation
    @State private var isFavorite: Bool = false

    var body: some View {
        ZStack {
            CardImageView(imageURL: detailImageURL)
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.width)
                .overlay(
                    VStack {
                        HStack {
                            Button(action: {
                                presentation.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(AppTheme.accentColor)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                FavoritesManager.shared.toggleFavorite(recipeID)
                                isFavorite.toggle()
                            }, label: {
                                Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                                    .foregroundColor(AppTheme.accentColor)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            })
                            .onAppear {
                                isFavorite = FavoritesManager.shared.isFavorite(recipeID)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 80)
                        
                        Spacer()
                    
                    }
                )
            }
        }
    }
