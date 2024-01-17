//
//  RecipeDetailView.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import Foundation
import SwiftUI

struct RecipeDetailView: View {

    var recipeID: String
    @ObservedObject private var recipeDetailViewModel = RecipeDetailViewModel()

    var body: some View {
        VStack {
            if recipeDetailViewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: AppTheme.accentColor))
                    .scaleEffect(1.5)
                    .padding(.top, 50)
                    .frame(maxWidth: .infinity, alignment: .center)
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        DetailImageView(recipe: Recipe(strMeal: recipeDetailViewModel.recipe?.strMeal ?? "",
                                           strMealThumb: recipeDetailViewModel.recipe?.strMealThumb ?? "",
                                           idMeal: recipeDetailViewModel.recipe?.idMeal ?? ""))
                        RecipeInformationView(recipeDetail: recipeDetailViewModel.recipe)
                    }
                    .cornerRadius(30)
                    .offset(y: -30)
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
        .onAppear{
            recipeDetailViewModel.fetchRecipeDetail(selectedRecipe: recipeID)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeID: "Apple Frangipan Tart")
    }
}
