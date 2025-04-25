//
//  CustomImageView.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import SwiftUI

struct CustomImageView: View {
    let movie: Movie
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    var imageType: MovieImageType = .poster
    
    
    var body: some View {
        AsyncImage(url: URL(string: movie.getImage(for: imageType))) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack {
                Color.appGrayColor1
                
                Text(movie.title)
                    .poppins(.light)
                    .padding()
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CustomImageView(movie: Preview.dev.movie, itemWidth: 150, itemHeight: 150)
}
