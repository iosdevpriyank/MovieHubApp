//
//  MovieDetailView.swift
//  MovieHubApp
//
//  Created by Akshat Gandhi on 28/10/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(height: 350)
                
                Text(movie.title)
                    .font(.title)
                    .bold()
                
                Text(movie.overview)
                    .font(.body)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MovieDetailView(movie: Movie(id: 1, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years...", posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"))
}
