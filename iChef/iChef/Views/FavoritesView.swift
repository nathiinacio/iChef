//
//  FavoritesView.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject private var viewModel = FavoritesViewModel()

    var body: some View {
        if viewModel.favorites.isEmpty {
            Text("No favorites yet.")
                .padding()
                .foregroundColor(.gray)
        } else {
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .center, spacing: 0) {
                Image(systemName: "bookmark.fill")
                    .foregroundColor(.black)
                    .padding()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)
                    
                Text("Favorites")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                }
                
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Check out your favorite recipes")
                            .font(.system(size: 18, weight: .light))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 8)

                        
                        Divider()
                            .padding(.bottom, 8)
                        
                        ForEach(viewModel.favorites, id: \.self) { recipe in
                            NavigationLink(
                                destination: RecipeDetailView(recipeID: recipe.idMeal),
                                label: {
                                    CardView(title: recipe.strMeal, recipeImageURL: URL(string: recipe.strMealThumb ?? ""))
                            })
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, 8)
            }
            .navigationBarHidden(true)
            .onAppear {
                viewModel.updateFavorites()
            }
        }
    }
}
