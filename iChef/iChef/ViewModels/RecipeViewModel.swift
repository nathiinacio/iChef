//
//  RecipeViewModel.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    init(selectedIngredient: String) {
        fetchRecipes(selectedIngredient: selectedIngredient)
    }
    
    func fetchRecipes(selectedIngredient: String?) {
        MealDBService().fetchRecipes(selectedIngredient: selectedIngredient ?? "salmon") { result in
            switch result {
            case .success(let fetchedRecipes):
                DispatchQueue.main.async {
                    for recipe in fetchedRecipes {
                        self.recipes.append(recipe)
                    }
                }
            case .failure(let error):
                debugPrint("Error fetching recipes: \(error.localizedDescription)")
            }
        }
    }
}
