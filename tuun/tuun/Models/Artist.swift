//
//  Artist.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import Foundation

// TODO: Backend - Could map to artists table in database or could be embedded in songs
// GET /api/artists/{id} - Get artist details
// POST /api/artists - Create artist from Spotify data
// Use Spotify API: GET https://api.spotify.com/v1/artists/{id}

struct Artist: Identifiable, Codable {
    let id: String              // Store id as String then convert to UUID (can change later)
    let name: String            // Artist name (e.g., "Kendrick Lamar")
    let imageURL: String        // TODO: Backend - Artist photo URL from Spotify API
    let spotifyID: String?      // Spotify artist ID for fetching additional data (bio, genres, popularity, related artists)
    
    init(id: String = UUID().uuidString, name: String, imageURL: String, spotifyID: String? = nil) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.spotifyID = spotifyID
    }
}
