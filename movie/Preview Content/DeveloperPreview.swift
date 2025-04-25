//
//  DeveloperPreview.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation


class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let movie = Movie(
        adult: false,
        backdropPath: "/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg",
        genreIDS: [
            18,
            80
        ],
        id: 278,
        originalLanguage: "en",
        originalTitle: "The Shawshank Redemption",
        overview: "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
        popularity: 35.044,
        posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
        releaseDate: "1994-09-23",
        title: "The Shawshank Redemption",
        video: false,
        voteAverage: 8.708,
        voteCount: 28175
    )
    
    let genre = Genre(id: 28, name: "Action")
    
    let review = Review(author: "Test Author", authorDetails: nil, content: "Test content", createdAt: "2023", id: "Test", updatedAt: "Test", url: "Test")
}
