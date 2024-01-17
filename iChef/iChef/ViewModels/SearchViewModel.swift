//
//  SearchViewModel.swift
//  iChef
//
//  Created by Nathalia Inacio on 17/01/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var recipes: [RecipeDetail] = []
    @Published var isLoading: Bool = true
    @Published var hadError: Bool = false
    
    func searchRecipe(recipe: String?) {
        MealDBManager().searchRecipe(query: recipe ?? "") { result in
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
