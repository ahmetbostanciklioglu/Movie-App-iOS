//
//  ReviewCard.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import SwiftUI

struct ReviewCard: View {
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: review.authorImage)) { image in
                image
                    .resizable()
            } placeholder: {
                ZStack {
                    Color.appGrayColor1
                    
                    if let firstChart = review.authorName.first {
                        Text(String(firstChart))
                    }
                }
            }
            .scaledToFill()
            .frame(width: 45, height: 45)
            .clipShape(Circle())

            
            Text(review.content)
                .poppins(.light)
            
            Divider()
        }
    }
}

#Preview {
    ReviewCard(review: Preview.dev.review)
}
