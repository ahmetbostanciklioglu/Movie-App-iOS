//
//  GenreCard.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import SwiftUI

struct GenreCard: View {
    let genre: Genre
    let namespace: Namespace.ID
    @Binding var selectedGenre: Genre
    
    var body: some View {
        Text(genre.name)
            .poppins(genre.id == selectedGenre.id ? .bold : .medium, 18)
            .background(
                ZStack {
                    if selectedGenre.id == genre.id {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.appGrayColor1)
                            .frame(height: 4)
                            .offset(y: 13)
                            .matchedGeometryEffect(id: "GenreCard", in: namespace)
                    }
                }
            )
    }
}

#Preview {
    GenreCard(genre: Preview.dev.genre, namespace: Namespace().wrappedValue, selectedGenre: .constant(Preview.dev.genre))
}
