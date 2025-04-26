//
//  HomeViewModel.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    //MARK: - Observable objects
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    
    @Published var genre: [Genre] = []
    @Published var selectedGenre = DeveloperPreview.instance.genre
    
    @Published var moviesForSelectedGenreMovies: [Movie] = []
    @Published var selectedMovie: Movie? = nil
    
    @Published var errorMessage = ""
    @Published var searchTxt = ""
    
    //MovieService instance
    private let movieService = MovieService()
    
    //MARK: - fetch popular movies
    func fetchPopularMovies()  {
        movieService.fetchData(api: .init(endpoint: .popular)) { [weak self] (result: Result<MovieResponse, Error>) in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.popularMovies  = response.results
                case .failure(let error):
                    print("Error: \(error)")
                    self.errorMessage = "Error: \(error)"
                }
            }
            
        }
    }
    
    //MARK: - fetch topRated movies
    func fetchTopRatedMovies()  {
        movieService.fetchData(api: .init(endpoint: .topRated)) {[weak self] (result: Result<MovieResponse, Error>) in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.topRatedMovies = response.results
                case .failure(let error):
                    print("Error: \(error)")
                    self.errorMessage = "Error: \(error)"
                }
            }
        }
    }
    
    //MARK: - fetch trending movies
    func fetchTrendingMovies() {
        movieService.fetchData(api: .init(endpoint: .trending)) {[weak self] (result: Result<MovieResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.trendingMovies = response.results
                case .failure(let error):
                    print("Error: \(error)")
                    self?.errorMessage = "Error: \(error)"
                }
            }
        }
    }
    
    //MARK: - fetch trending movies
    func fetchGenre() {
        movieService.fetchData(api: .init(endpoint: .trending)) {[weak self] (result: Result<GenreResponse, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.genre = response.genres
                }
            case .failure(let error):
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self?.errorMessage = "Error: \(error)"
                }
            }
        }
    }
    
    //MARK: - fetch movies for selected
    func fetchMoviesForSelected() {
            let api = ApiConstructor(endpoint: .discoverMovies, params: [
                "with_genres": "\(selectedGenre.id)"
            ])
        
        movieService.fetchData(api: api) {[weak self] (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.moviesForSelectedGenreMovies = response.results
                }
            case .failure(let error):
                print("Error: \(error)")
                DispatchQueue.main.async {
                    self?.errorMessage = "Error: \(error)"
                }
            }
            
        }
    }
}
