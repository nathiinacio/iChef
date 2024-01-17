//
//  FavoritesManager.swift
//  iChef
//
//  Created by Nathalia Inacio on 16/01/24.
//

import Foundation
import SwiftUI

class FavoritesManager {
    static let shared = FavoritesManager()

    private let favoritesKey = "favoritesKey"

    @AppStorage("favorites", store: UserDefaults(suiteName: "group.com.iChef")) private var favoritesData: Data = Data()

    func getFavorites() -> Set<Recipe> {
        if let favorites = try? JSONDecoder().decode(Set<Recipe>.self, from: favoritesData) {
            return favorites
        }
        return Set<Recipe>()
    }

    func toggleFavorite(_ recipe: Recipe) {
        var favorites = getFavorites()

        if favorites.contains(recipe) {
            favorites.remove(recipe)
        } else {
            favorites.insert(recipe)
        }

        if let encodedData = try? JSONEncoder().encode(favorites) {
            favoritesData = encodedData
        }
    }
    
    func isFavorite(_ recipe: Recipe) -> Bool {
        let favorites = getFavorites()
        return favorites.contains(recipe)
    }
}
