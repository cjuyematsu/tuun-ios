//
//  Review.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import Foundation

// TODO: Backend - Maps to reviews table in database
// GET /api/reviews/user/{userId} - Get all reviews for a user
// GET /api/reviews/{id} - Get single review
// POST /api/reviews - Create new review
// PUT /api/reviews/{id} - Update review
// DELETE /api/reviews/{id} - Delete review
// POST /api/reviews/{id}/like - Like a review
// DELETE /api/reviews/{id}/like - Unlike a review

struct Review: Identifiable, Codable {
    let id: String              // Store id as String then convert to UUID (can change later)
    let userID: String          // Foreign key to users table
    let song: Song
    let rating: Double          // 1.0 - 10.0
    let comment: String?
    let dateRated: Date
    var likes: Int              // TODO: Backend - Count from reviews table
    var ranking: Int?
    
    init(id: String = UUID().uuidString,
         userID: String,
         song: Song,
         rating: Double,
         comment: String? = nil,
         dateRated: Date = Date(),
         likes: Int = 0,
         ranking: Int? = nil) {
        self.id = id
        self.userID = userID
        self.song = song
        self.rating = rating
        self.comment = comment
        self.dateRated = dateRated
        self.likes = likes
        self.ranking = ranking
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: dateRated)
    }
}
