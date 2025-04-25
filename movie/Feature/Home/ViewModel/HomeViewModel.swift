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
    func fetchPopularMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .popular))
            popularMovies = movieApiResponse.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    //MARK: - fetch topRated movies
    func fetchTopRatedMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: .init(endpoint: .topRated))
            topRatedMovies = movieApiResponse.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    //MARK: - fetch trending movies
    func fetchTrendingMovies() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: .init(endpoint: .trending))
            trendingMovies = movieApiResponse.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    //MARK: - fetch trending movies
    func fetchGenre() async {
        do {
            let genreApiResponse: GenreResponse = try await movieService.fetchData(api: .init(endpoint: .genre))
            genre = genreApiResponse.genres
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    //MARK: - fetch movies for selected
    func fetchMoviesForSelected() async {
        do {
            let api = ApiConstructor(endpoint: .discoverMovies, params: [
                "with_genres": "\(selectedGenre.id)"
            ])
            let selectedMovieApi: MovieResponse = try await movieService.fetchData(api: api)
            moviesForSelectedGenreMovies = selectedMovieApi.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
}
