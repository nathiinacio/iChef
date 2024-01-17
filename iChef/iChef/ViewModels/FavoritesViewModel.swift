//
//  FavoritesViewModel.swift
//  iChef
//
//  Created by Nathalia Inacio on 17/01/24.
//

import SwiftUI
import Combine

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [Recipe] = []
    var cancellables: Set<AnyCancellable> = []

    let favoritesPublisher = PassthroughSubject<Void, Never>()

    init() {
        updateFavorites()
    }

    func updateFavorites() {
        favorites = Array(FavoritesManager.shared.getFavorites())
    }
    
    func sendFavoritesUpdate() {
        favoritesPublisher.send()
    }
}
