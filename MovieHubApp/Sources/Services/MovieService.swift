//
//  MovieService.swift
//  MovieHubApp
//
//  Created by Akshat Gandhi on 28/10/25.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchTrending() async throws -> [Movie]
}

final class MovieService: MovieServiceProtocol {
    func fetchTrending() async throws -> [Movie] {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(Config.apiKey)") else {
            throw APIError.invalidURL
        }
        
        async let (data, _) = URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(MovieResponse.self, from: data)
        return response.results
    }
}
