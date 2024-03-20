//
//  FavoritesManager.swift
//  WOM Test
//
//  Created by Argenis Cabello on 18-03-24.
//

import Foundation
import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favorites: [Song] = []

    func addToFavorites(_ song: Song) {
        favorites.append(song)
    }

    func removeFromFavorites(_ song: Song) {
        favorites.removeAll { $0.id == song.id }
    }

    func isFavorite(_ song: Song) -> Bool {
        favorites.contains { $0.id == song.id }
    }
}
