//
//  ListView.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

struct ListView: View {
    // TODO: This data will come from backend API via ProfileViewModel

    let reviews: [Review]
    
    var body: some View {
        ScrollView {
            // TODO: Backend - These reviews will be fetched from:
            // GET /api/reviews/user/{userId}
            LazyVStack(spacing: 8) {
                ForEach(Array(reviews.enumerated()), id: \.element.id) { index, review in
                    ReviewListCard(review: review, ranking: index + 1)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
        }
    }
}

struct ReviewListCard: View {
    // TODO: Backend - Review data from API response
    let review: Review
    let ranking: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Rating and Ranking Column
            VStack(spacing: 4) {
                RatingCircle(rating: review.rating, size: 54, fontSize: .title3)
                
                Text("#\(ranking)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 60)
            
            // Song Info Column
            VStack(alignment: .leading, spacing: 4) {
                // TODO: Backend - Song title from review.song object
                
                Text(review.song.title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                // TODO: Backend - Artist name from review.song object
                Text(review.song.artist)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                // TODO: Backend - Review date from review.dateRated
                Text(review.formattedDate)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // TODO: Backend - Optional comment from review.comment
                if let comment = review.comment, !comment.isEmpty {
                    Text(comment)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(3)
                        .padding(.top, 4)
                }
            }
            
            Spacer()
            
            // Album Cover
            // TODO: Backend - Album cover URL/name from review.song.albumCoverURL
            // This will come from Spotify API or stored in database
            AlbumCover(imageName: review.song.albumCoverURL, size: 80, cornerRadius: 8)
        }
        .padding(12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ListView(reviews: MockData.sampleReviews)
    }
}
