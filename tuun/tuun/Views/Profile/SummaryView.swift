//
//  SummaryView.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

struct SummaryView: View {
    // TODO: This data will be calculated from backend reviews
    
    let artistSummaries: [(id:String, artist: String, imageURL: String, averageRating: Double, songCount: Int)]
    @State private var selectedSummaryTab: SummaryTab = .artist
    
    enum SummaryTab: String {
        case artist = "Artist"
        case genre = "Genre"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Tab Selector
            SummaryTabSelector(selectedTab: $selectedSummaryTab)
            
            // Content
            if selectedSummaryTab == .artist {
                ArtistSummaryList(summaries: artistSummaries)
            } else {
                // TODO: Backend - Genre summary will be similar to artist
                // Group reviews by genre instead of artist
                GenrePlaceholder()
            }
        }
    }
}

struct SummaryTabSelector: View {
    @Binding var selectedTab: SummaryView.SummaryTab
    
    var body: some View {
        HStack(spacing: 0) {
            SummaryTabButton(
                title: SummaryView.SummaryTab.artist.rawValue,
                isSelected: selectedTab == .artist
            ) {
                selectedTab = .artist
            }
            
            SummaryTabButton(
                title: SummaryView.SummaryTab.genre.rawValue,
                isSelected: selectedTab == .genre
            ) {
                selectedTab = .genre
            }
        }
        .frame(height: 44)
        .background(Color.white.opacity(0.05))
    }
}

struct SummaryTabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(isSelected ? .white : .gray)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(isSelected ? Color.white.opacity(0.1) : Color.clear)
        }
    }
}

struct ArtistSummaryList: View {
    // TODO: Backend - This data comes from ProfileViewModel.artistSummaries
    // Calculated by grouping reviews by artist and averaging ratings
    
    let summaries: [(id: String, artist: String, imageURL: String, averageRating: Double, songCount: Int)]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                // TODO: Backend - Artist summaries calculated from:
                // 1. GET /api/reviews/user/{userId}
                // 2. Group by artist
                // 3. Calculate average rating per artist
                // 4. Sort by average rating (highest first)
                ForEach(Array(summaries.enumerated()), id: \.offset) { _, summary in
                    ArtistSummaryCard(
                        artistName: summary.artist,
                        imageURL: summary.imageURL,
                        averageRating: summary.averageRating,
                        songCount: summary.songCount
                    )
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
        }
    }
}

struct ArtistSummaryCard: View {
    // TODO: Backend - Artist data

    let artistName: String // From review.song.artist
    let imageURL: String // From Spotify API or database
    let averageRating: Double // Calculated from all artist's reviews
    let songCount: Int // Count of reviews for this artist
    
    var body: some View {
        HStack(spacing: 12) {
            // Rating Circle
            // TODO: Backend - Average of all ratings for this user for this artist
            RatingCircle(rating: averageRating, size: 54, fontSize: .title3)
            
            // Artist Info
            VStack(alignment: .leading, spacing: 4) {
                // TODO: Backend - Artist name from reviews
                
                Text(artistName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                // TODO: Backend - Count of reviews from this user for this artist
                Text("\(songCount) song\(songCount == 1 ? "" : "s") rated")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Artist Image
            // TODO: Backend - Artist image will come from:
            // 1. Spotify API (search artist -> get images)
            // 2. Or stored in database
            
            ArtistImage(imageName: imageURL, size: 60, cornerRadius: 8)
        }
        .padding(12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

struct GenrePlaceholder: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "music.note.list")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            Text("Genre View")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.top, 8)
            Text("Coming Soon")
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SummaryView(artistSummaries: MockData.sampleArtistSummaries)
    }
}
