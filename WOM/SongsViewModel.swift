//
//  SongsViewModel.swift
//  WOM
//
//  Created by Argenis Cabello on 18-03-24.
//
import Foundation
import Combine

class SongsViewModel: ObservableObject {
    @Published var songs: [Song] = []
    @Published var showError = false
    @Published var errorMessage: String = ""
    var apiManager = ApiManager()

    func fetchSongs() {
        apiManager.fetchSongs { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let songs):
                    self.songs = songs
                case .failure(let error):
                    self.showError = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
