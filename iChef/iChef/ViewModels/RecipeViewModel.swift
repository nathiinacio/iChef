//
//  RecipeViewModel.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = true
    @Published var hadError: Bool = false


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
                        self.isLoading = false
                        self.hadError = false
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.hadError = true
                }
                debugPrint("Error fetching recipes: \(error.localizedDescription)")
            }
        }
    }
}
