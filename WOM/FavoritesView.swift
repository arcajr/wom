//
//  FavoritesView.swift
//  WOM Test
//
//  Created by Argenis Cabello on 18-03-24.
//
import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favoritesManager: FavoritesManager
    
    var body: some View {
        NavigationView {
            List(favoritesManager.favorites) { song in
                SongRow(song: song)
            }
            .navigationBarTitle("Favoritos")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(favoritesManager: FavoritesManager())
    }
}
