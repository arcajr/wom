//
//  ContentView.swift
//  WOM Test
//
//  Created by Argenis Cabello on 18-03-24.
//
import SwiftUI

struct ContentView: View {
    @ObservedObject var songsViewModel: SongsViewModel
    @StateObject var favoritesManager = FavoritesManager()

    init() {
        songsViewModel = SongsViewModel()
    }

    var body: some View {
        TabView {
            SongsView(songsViewModel: songsViewModel)
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("Canciones")
                }
            FavoritesView(favoritesManager: favoritesManager)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }
        }
        .onAppear {
            // Elimina esta línea
            // songsViewModel.fetchSongs()
        }
        .alert(isPresented: $songsViewModel.showError) {
            Alert(title: Text("Error"), message: Text("Se produjo un error al cargar las canciones. Por favor, inténtelo de nuevo más tarde."), dismissButton: .default(Text("OK")))
        }
        .onReceive(songsViewModel.$songs) { songs in
            print("Songs updated: \(songs.count)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
