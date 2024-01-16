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
        List(recipeViewModel.recipes, id: \.idMeal) { recipe in
            Text(recipe.strMeal)
        }
        .navigationTitle("Recipes")
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecipeViewModel(selectedIngredient: "salmon")
        return NavigationView {
            RecipesListView(recipeViewModel: viewModel)
        }
    }
}

