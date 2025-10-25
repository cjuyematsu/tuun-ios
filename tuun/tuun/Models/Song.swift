//
//  Song.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import Foundation

// TODO: Backend - Maps to songs table in database
// GET /api/songs/{id}
// POST /api/songs (create from Spotify data)
// Also populated from Spotify API: GET https://api.spotify.com/v1/tracks/{id}

struct Song: Identifiable, Codable {
    let id: String              // Store id as String then convert to UUID (can change later)
    let title: String           // Song name
    let artist: String          // Artist name(s)
    let albumCoverURL: String   // TODO: Backend - Album artwork URL from Spotify or stored path
    let spotifyID: String?      // Optional Spotify track ID for fetching additional data
    
    init(id: String = UUID().uuidString, title: String, artist: String, albumCoverURL: String, spotifyID: String? = nil) {
        self.id = id
        self.title = title
        self.artist = artist
        self.albumCoverURL = albumCoverURL
        self.spotifyID = spotifyID
    }
}
