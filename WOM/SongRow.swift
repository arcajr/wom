//
//  SongRow.swift
//  WOM Test
//
//  Created by Argenis Cabello on 18-03-24.
//
import SwiftUI

struct SongRow: View {
    let song: Song

    var body: some View {
        HStack {
            Text(song.trackName)
            Spacer()
            Text(song.artistName)
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song(id: 1, wrapperType: "track", kind: "song", artistId: 123, collectionId: 456, trackId: 789, artistName: "Artist Name", collectionName: "Album Name", trackName: "Song Name", collectionCensoredName: "Album Name", trackCensoredName: "Song Name", artistViewUrl: "https://example.com/artist", collectionViewUrl: "https://example.com/album", trackViewUrl: "https://example.com/song", previewUrl: "https://example.com/preview", artworkUrl30: "https://example.com/artwork30", artworkUrl60: "https://example.com/artwork60", artworkUrl100: "https://example.com/artwork100", collectionPrice: 9.99, trackPrice: 1.29, releaseDate: "2022-01-01T00:00:00Z", collectionExplicitness: "notExplicit", trackExplicitness: "notExplicit", discCount: 1, discNumber: 1, trackCount: 1, trackNumber: 1, trackTimeMillis: 240000, country: "US", currency: "USD", primaryGenreName: "Pop", contentAdvisoryRating: "Clean", isStreamable: true))
    }
}
