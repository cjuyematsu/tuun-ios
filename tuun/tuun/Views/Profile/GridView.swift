//
//  GridView.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

struct GridView: View {
    // TODO: This data will come from backend API via ProfileViewModel
    
    let reviews: [Review]
    
    private let columns = [
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2),
        GridItem(.flexible(), spacing: 2)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 2) {
                // TODO: Backend - These reviews will be fetched from:
                // GET /api/reviews/user/{userId}
                
                ForEach(reviews) { review in
                    GridAlbumCard(review: review)
                }
            }
            .padding(.horizontal, 2)
        }
    }
}

struct GridAlbumCard: View {
    // TODO: Backend - Review data from API response
    
    let review: Review
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                // Album Cover
                // TODO: Backend - Album cover will come from:
                // 1. Spotify API (review.song.spotifyID -> fetch artwork)
                // 2. Or stored in database (review.song.albumCoverURL)
                AlbumCover(
                    imageName: review.song.albumCoverURL,
                    size: geometry.size.width,
                    cornerRadius: 0
                )
                
                // Rating Badge
                // TODO: Backend - Rating from review.rating field
                RatingBadge(rating: review.rating, size: 40)
                    .padding(8)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        GridView(reviews: MockData.sampleReviews)
    }
}
