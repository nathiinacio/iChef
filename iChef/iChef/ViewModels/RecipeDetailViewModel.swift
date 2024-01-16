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
        //TODO
    }
}
