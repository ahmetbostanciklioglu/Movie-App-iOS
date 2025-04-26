//
//  HomeView.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @Namespace var namespace
    
    
    let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                
                SearchBar(searchText: $viewModel.searchTxt)
                    .padding(.top, 10)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.popularMovies) { movie in
                            MovieCard(movie: movie)
                                .onTapGesture {
                                    viewModel.selectedMovie = movie
                                }
                            Spacer()
                                .frame(width: 36)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.trendingMovies) { movie in
                            MovieCard(movie: movie)
                                .onTapGesture {
                                    viewModel.selectedMovie = movie
                                }

                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.genre) { genre in
                            GenreCard(genre: genre, namespace: namespace, selectedGenre: $viewModel.selectedGenre)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        viewModel.selectedGenre = genre
                                        Task {
                                            viewModel.fetchMoviesForSelected()
                                        }
                                    }
                                }
                        }
                    }
                }
                Spacer()
                    .frame(width: 36)
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.moviesForSelectedGenreMovies) { movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(.appBackground)
        .scrollIndicators(.hidden)
        .fullScreenCover(item: $viewModel.selectedMovie) { movie in
            DetailView(movie: movie)
        }
        .task {
            viewModel.fetchPopularMovies()
            viewModel.fetchTrendingMovies()
            viewModel.fetchGenre()
            viewModel.fetchMoviesForSelected()
        }
    }
}

#Preview {
    HomeView()
}
