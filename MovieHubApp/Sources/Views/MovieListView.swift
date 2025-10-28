//
//  MovieListView.swift
//  MovieHubApp
//
//  Created by Akshat Gandhi on 28/10/25.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var vm = MovieListViewModel()
    
    var body: some View {
        NavigationStack {
            if vm.isLoading {
                VStack(spacing: 16) {
                    ProgressView()
                    Text("Loading…")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = vm.error {
                VStack(spacing: 12) {
                    Text("Error")
                        .font(.headline)
                    Text(error)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(vm.movies) { movie in
                    NavigationLink(value: movie) {
                        MovieRowView(movie: movie)
                    }
                }
                .listStyle(.plain)
                .navigationDestination(for: Movie.self) { movie in
                    MovieDetailView(movie: movie)
                }
            }
        }
        .navigationTitle("Trending Movies")
    }
}

#Preview {
    MovieListView()
}
