//
//  Recipe.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import Foundation

struct RecipeAPIResponse: Codable {
    let meals: [Recipe]
}

struct Recipe: Codable, Hashable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
