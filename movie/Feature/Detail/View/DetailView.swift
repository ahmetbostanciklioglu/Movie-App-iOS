//
//  DetailView.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import SwiftUI

enum DetailViewSection: String {
case about, review
    var rawValue: String {
        switch self {
        case .about:
            return "About Movie"
        case .review:
            return "Reviews"
        }
    }
}


struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @Namespace var namespace
    
    @StateObject private var detailViewModel: DetailViewModel
    let movie: Movie
    
    init(movie: Movie) {
        _detailViewModel = StateObject(wrappedValue: DetailViewModel(movie: movie))
        self.movie = movie
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            
            VStack {
                HStack {
                    Image.CancelIcon
                    Text("2023")
                    Text(" | ")
                    Image.ClockIcon
                    Text("148 Minutes")
                    Text(" | ")
                    Image.GenreIcon
                    Text("Action")
                }
                .foregroundStyle(.appGrayColor2)
                .frame(maxWidth: .infinity)
                                
                HStack {
                    ForEach(detailViewModel.sections, id: \.self) { section in
                        DetailSectionCard(section: section, namespace: namespace, selectedSection: $detailViewModel.selectedSection)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    detailViewModel.selectedSection = section
                                }
                            }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                
                switch detailViewModel.selectedSection {
                case .about:
                    Text(detailViewModel.movie.overview)
                case .review:
                    ScrollView {
                        VStack {
                            ForEach(detailViewModel.reviews) { review in
                                ReviewCard(review: review)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                Spacer()
            }
            .padding()
            .padding(.top, contentOffset)
        }
        .preferredColorScheme(.dark)
        .background(.appBackground)
        .task {
            await detailViewModel.fetchReviews()
        }
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.26
    }
    
    var backdropImageSize: CGFloat {
        screenHeight * 0.15
    }
    
    var posterImageOffset: CGFloat {
        screenHeight * 0.053
    }
    
    var backdropImageOffset: CGFloat {
        screenHeight * 0.175
    }
    
    var titleOffset: CGFloat {
        screenHeight * 0.096
    }
    
    var contentOffset: CGFloat {
        screenHeight * 0.13
    }
}

#Preview {
    DetailView(movie: Preview.dev.movie)
}


private extension DetailView {
    var header: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .top) {
                CustomImageView(movie: detailViewModel.movie, itemWidth: screenWidth, itemHeight: posterImageHeight)
                    .offset(y: posterImageOffset)
                HStack {
                    Image.BackIcon
                        .onTapGesture {
                            dismiss()
                        }
                    Spacer()
                    Text("Detail")
                    Spacer()
                    Image.BookmarkIcon
                }
                .padding()
                .background(Color.appBackground)
                
            }
            HStack(spacing: 12) {
                CustomImageView(movie: detailViewModel.movie, itemWidth: backdropImageSize * 0.79, itemHeight: backdropImageSize, imageType: .backdrop)
                
                Text(detailViewModel.movie.title)
                    .poppins(.bold, 18)
                    .minimumScaleFactor(0.5)
                    .padding(.top, titleOffset)
                    
            }
            .padding(.leading, 30)
            .offset(y: backdropImageOffset)
        }
    }
}
