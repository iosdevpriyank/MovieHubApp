//
//  Constant.swift
//  MovieHubApp
//
//  Created by Akshat Gandhi on 28/10/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case noData
    case unknown
    case decodingError
    case noInternetConnection
    case noDataFromServer
    case noDataFromServerWithError(String)
}
