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

    func getFavorites() -> Set<String> {
        if let favorites = try? JSONDecoder().decode(Set<String>.self, from: favoritesData) {
            return favorites
        }
        return Set<String>()
    }

    func toggleFavorite(_ recipeId: String) {
        var favorites = getFavorites()

        if favorites.contains(recipeId) {
            favorites.remove(recipeId)
        } else {
            favorites.insert(recipeId)
        }

        if let encodedData = try? JSONEncoder().encode(favorites) {
            favoritesData = encodedData
        }
    }
    
    func isFavorite(_ recipeId: String) -> Bool {
        let favorites = getFavorites()
        return favorites.contains(recipeId)
    }
}
