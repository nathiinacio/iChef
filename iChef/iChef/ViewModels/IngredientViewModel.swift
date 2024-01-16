//
//  IngredientViewModel.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import Foundation

class IngredientViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = []
    @Published var selectedIngredient: String? = nil
    @Published var isLoading: Bool = true
    
    init() {
        fetchIngredients()
    }
    
    func fetchIngredients() {
        MealDBService().fetchIngredients { result in
            switch result {
            case .success(let fetchedIngredients):
                DispatchQueue.main.async {
                    self.ingredients = fetchedIngredients
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                debugPrint("Error fetching ingredients: \(error.localizedDescription)")
            }
        }
    }
}
