//
//  Endpoint.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

enum Endpoint {
    case trending, popular, topRated, genre, movieReviews(_ movieId: Int), discoverMovies
    
    
    private var path: String {
        switch self {
        case .trending:
            return "/3/trending/movie/week"
        case .popular:
            return "/3/movie/popular"
        case .topRated:
            return "/3/trending/top_rated"
        case .genre:
            return "/3/genre/movie/list"
        case .movieReviews(let movieId):
            return "/3/movie/\(movieId)/reviews"
        case .discoverMovies:
            return "/3/discover/movie"
        }
    }
    
    var fullPath: String {
        Constants.apiBaseUrl + path
    }
    
}
