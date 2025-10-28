//
//  Movie.swift
//  MovieHubApp
//
//  Created by Akshat Gandhi on 28/10/25.
//

import Foundation

struct Movie: Identifiable, Decodable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var posterURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}
