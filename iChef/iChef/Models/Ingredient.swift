//
//  Ingredient.swift
//  iChef
//
//  Created by Nathalia Inacio on 13/01/24.
//

import Foundation

struct IngredientAPIResponse: Decodable {
    let meals: [Ingredient]
}

struct Ingredient: Decodable, Hashable {
    let idIngredient: String
    let strIngredient: String
    let strDescription: String?
    let strType: String?
}
