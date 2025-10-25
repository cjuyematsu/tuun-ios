//
//  ProfileViewModel.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import Foundation
import SwiftUI
import Combine

class ProfileViewModel: ObservableObject {
    // TODO: Backend - User data from GET /api/users/{userId}
    @Published var user: User
    
    // TODO: Backend - Reviews from GET /api/reviews/user/{userId}
    @Published var reviews: [Review]
    
    // TODO: Backend - Artist summaries calculated from reviews
    @Published var artistSummaries: [(id: String, artist: String, imageURL: String, averageRating: Double, songCount: Int)]
    
    init(user: User = MockData.sampleUser,
         reviews: [Review] = MockData.sampleReviews,
         artistSummaries: [(id: String, artist: String, imageURL: String, averageRating: Double, songCount: Int)] = MockData.sampleArtistSummaries) {
        self.user = user
        self.reviews = reviews.sorted { $0.rating > $1.rating }
        self.artistSummaries = artistSummaries
    }
    
    // TODO: Backend - API call
    // func loadUserProfile(userId: String) async {
    //     do {
    //         // Fetch user data
    //         self.user = try await APIService.shared.fetchUserProfile(userId: userId)
    //
    //         // Fetch user's reviews
    //         self.reviews = try await APIService.shared.fetchUserReviews(userId: userId)
    //
    //         // Calculate artist summaries from reviews
    //         self.artistSummaries = calculateArtistSummaries()
    //     } catch {
    //         print("Error loading profile: \(error)")
    //         // Handle error - show alert or error state
    //     }
    // }
    
    var sortedReviews: [Review] {
        // Reviews sorted by rating (highest first)
        reviews.sorted { $0.rating > $1.rating }
    }
    
    // TODO: Backend - This function will calculate artist summaries from fetched reviews
    // Using pre-calculated data from MockData
    private func calculateArtistSummaries() -> [(artist: String, imageURL: String, averageRating: Double, songCount: Int)] {
        // Group reviews by artist name
        let grouped = Dictionary(grouping: reviews) { $0.song.artist }
        
        // Calculate avg. rating for specific user for this artist
        return grouped.map { artist, artistReviews in
            let avgRating = artistReviews.reduce(0.0) { $0 + $1.rating } / Double(artistReviews.count)
            
            // TODO: Backend - Artist image URL will come from:
            // 1. Spotify API (GET https://api.spotify.com/v1/artists/{id})
            // 2. Or stored in database
            let imageURL = artistReviews.first?.song.albumCoverURL ?? ""
            
            return (
                artist: artist,
                imageURL: imageURL,
                averageRating: avgRating,
                songCount: artistReviews.count
            )
        }
        .sorted { $0.averageRating > $1.averageRating } 
    }
}
