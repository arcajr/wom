//
//  ApiManager.swift
//  WOM Test
//
//  Created by Argenis Cabello on 18-03-24.
//
import Foundation

class ApiManager {
    func fetchSongs(completion: @escaping (Result<[Song], Error>) -> Void) {
        let urls = [
            "https://itunes.apple.com/search?term=song&country=US&media=music&limit=10",
            "https://itunes.apple.com/search?term=song&country=SE&media=music&limit=10",
            "https://itunes.apple.com/search?term=song&country=CL&media=music&limit=10"
        ]

        let group = DispatchGroup()

        var allSongs: [Song] = []

        for url in urls {
            group.enter()

            guard let url = URL(string: url) else {
                completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
                return
            }

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                defer { group.leave() }

                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(NSError(domain: "No data received", code: -1, userInfo: nil)))
                    return
                }

                if data.count == 0 {
                    completion(.failure(NSError(domain: "Empty response received", code: -1, userInfo: nil)))
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                    allSongs.append(contentsOf: searchResponse.results)
                    print("Canciones decodificadas: \(searchResponse.results.count)")
                } catch {
                    print("Respuesta de decodificación de error: \(error)")
                    completion(.failure(error))
                    return
                }
            }.resume()
        }

        group.notify(queue: .main) {
            completion(.success(allSongs))
        }
    }
}

struct SearchResponse: Codable {
    let resultCount: Int
    let results: [Song]
}
