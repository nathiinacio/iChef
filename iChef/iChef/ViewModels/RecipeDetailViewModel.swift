//
//  RecipeDetailViewModel.swift
//  iChef
//
//  Created by Nathalia Inacio on 14/01/24.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    @Published var recipe: RecipeDetail?
    @Published var isLoading: Bool = true
    
    
    func fetchRecipeDetail(selectedRecipe: String) {
        MealDBManager().fetchRecipeDetail(selectedRecipe: selectedRecipe) { result in
            switch result {
            case .success(let fetchedRecipe):
                DispatchQueue.main.async {
                    self.recipe = fetchedRecipe.first
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                debugPrint("Error fetching recipe: \(error.localizedDescription)")
            }
        }
    }
}
