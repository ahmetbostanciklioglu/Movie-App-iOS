//
//  MovieCard.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    var type: MovieCardType = .poster
    
    var body: some View {
        CustomImageView(movie: movie, itemWidth: itemWidth, itemHeight: itemHeight)
    }
}

extension MovieCard {
    var itemWidth: CGFloat {
        screenWidth * type.widthPercent
    }
    
    var itemHeight: CGFloat {
        screenHeight * type.heightPercent
    }
}


#Preview {
    MovieCard(movie: Preview.dev.movie)
}
