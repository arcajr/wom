//
//  SongsView.swift
//  WOM Test
//
//  Created by Argenis Cabello on 18-03-24.
//
import SwiftUI

struct SongsView: View {
    @ObservedObject var songsViewModel: SongsViewModel

    var body: some View {
        NavigationView {
            List(songsViewModel.songs) { song in
                SongRow(song: song)
            }
            .navigationBarTitle("Canciones")
        }
    }
}

struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView(songsViewModel: SongsViewModel())
    }
}
