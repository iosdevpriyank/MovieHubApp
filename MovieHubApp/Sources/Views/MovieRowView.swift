//
//  MovieRowView.swift
//  MovieHubApp
//
//  Created by Akshat Gandhi on 28/10/25.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: movie.posterURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 80, height: 120)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    MovieRowView(movie: Movie(id: 1, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years...", posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg"))
}
