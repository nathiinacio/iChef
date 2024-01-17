//
//  RecipesListView.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import SwiftUI

struct RecipesListView: View {
    
    @ObservedObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            ScrollView(.vertical, showsIndicators: true) {
                if recipeViewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: AppTheme.accentColor))
                        .scaleEffect(1.5)
                        .padding(.top, 50)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if !recipeViewModel.hadError {
                    Text("Select your favorite recipe")
                        .font(.system(size: 18, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                    Divider()
                        .padding(.vertical, 8)
                    VStack {
                        ForEach(recipeViewModel.recipes, id: \.idMeal) { recipe in
                            NavigationLink(
                                destination: RecipeDetailView(recipeID: recipe.idMeal),
                                label: {
                                    CardView(title: recipe.strMeal, recipeImageURL: URL(string: recipe.strMealThumb ?? ""))
                                })
                        }
                    }
                } else {
                    Text("Oops, sorry! Unfortunely, we don't have any recipes with this main ingredient...")
                        .font(.system(size: 18, weight: .light))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 16)
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(false)
            .navigationBarTitle("Recipes", displayMode: .inline)
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(recipeViewModel: RecipeViewModel(selectedIngredient: "salmon"))
    }
}
