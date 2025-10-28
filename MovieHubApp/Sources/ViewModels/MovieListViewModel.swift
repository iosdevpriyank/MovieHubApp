//
//  MovieListViewModel.swift
//  MovieHubApp
//
//  Created by Akshat Gandhi on 28/10/25.
//

import Foundation
internal import Combine

final class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    private let service: MovieServiceProtocol
    
    init(service: MovieServiceProtocol = MovieService()) {
        self.service = service
        Task {
            await loadMovies()
        }
    }
    
    func loadMovies() async {
        isLoading = true
        defer { isLoading = false }
        do {
            movies = try await service.fetchTrending()
        } catch {
            self.error = "Failed to load movies."
        }
    }
}
