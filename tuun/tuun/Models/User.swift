//
//  User.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import Foundation

// TODO: Backend - Maps to users table in database
// GET /api/users/{id}
// POST /api/users (create new user)
// PUT /api/users/{id} (update user)

struct User: Identifiable, Codable {
    let id: String              // Store id as String then convert to UUID (can change later)
    let username: String        // Unique username
    var followerCount: Int      // TODO: Backend - Calculate from followers table
    var followingCount: Int     // TODO: Backend - Calculate from followers table
    var reviewCount: Int        // TODO: Backend - Calculate from reviews table
    
    init(id: String = UUID().uuidString, username: String, followerCount: Int = 0, followingCount: Int = 0, reviewCount: Int = 0) {
        self.id = id
        self.username = username
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.reviewCount = reviewCount
    }
}
