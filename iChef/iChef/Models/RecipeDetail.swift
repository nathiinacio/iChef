//
//  RecipeDetail.swift
//  iChef
//
//  Created by Nathalia Inacio on 14/01/24.
//

import Foundation

struct RecipeDetailAPIResponse: Codable {
    let meals: [RecipeDetail]
}

struct RecipeDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strYoutube: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    
    subscript(key: String) -> String? {
        switch key {
        case "strIngredient1": return strIngredient1
        case "strIngredient2": return strIngredient2
        case "strIngredient3": return strIngredient3
        case "strIngredient4": return strIngredient4
        case "strIngredient5": return strIngredient5
        case "strIngredient6": return strIngredient6
        case "strIngredient7": return strIngredient7
        case "strIngredient8": return strIngredient8
        case "strIngredient9": return strIngredient9
            
        case "strMeasure1": return strMeasure1
        case "strMeasure2": return strMeasure2
        case "strMeasure3": return strMeasure3
        case "strMeasure4": return strMeasure4
        case "strMeasure5": return strMeasure5
        case "strMeasure6": return strMeasure6
        case "strMeasure7": return strMeasure7
        case "strMeasure8": return strMeasure8
        case "strMeasure9": return strMeasure9
        
        default: return ""
        }
    }
}
