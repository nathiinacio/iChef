//
//  DetailImageView.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//

import SwiftUI

struct DetailImageView: View {
    let recipe: Recipe
    @Environment(\.presentationMode) var presentation
    @State private var isFavorite: Bool = false
    @ObservedObject private var viewModel = FavoritesViewModel()

    var body: some View {
        ZStack {
            CardImageView(imageURL: URL(string: recipe.strMealThumb))
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
                                FavoritesManager.shared.toggleFavorite(recipe)
                                viewModel.updateFavorites()
                                viewModel.sendFavoritesUpdate()
                                isFavorite.toggle()
                            }, label: {
                                Image(systemName: isFavorite ? "bookmark.fill" : "bookmark")
                                    .foregroundColor(AppTheme.accentColor)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            })
                            .onAppear {
                                isFavorite = FavoritesManager.shared.isFavorite(recipe)
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
