//
//  DetailViewModel.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    //Observable objects
    @Published var selectedSection: DetailViewSection = .about
    @Published var reviews: [Review] = []
    
    //Properties
    let movie: Movie
    let sections: [DetailViewSection] = [.about, .review]
    
    private let movieService = MovieService()
    
    @Published var errorMessage = ""
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    //Fetch movie reviews
    func fetchReviews() {
        movieService.fetchData(api: .init(endpoint: .movieReviews(movie.id))) { [weak self] (result: Result<ReviewResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.reviews = response.results
                case .failure(let error):
                    print("Error: \(error)")
                    self?.errorMessage = "Error: \(error)"
                }
            }
        }
    }
}
