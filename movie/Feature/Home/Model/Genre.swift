//
//  Genre.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

import Foundation

struct GenreResponse: Codable {
    let genres: [Genre]
}

struct Genre: Identifiable, Codable {
    let id: Int
    let name: String
}
