//
//  Constants.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

// App Colors
struct AppColors {
    static let background = Color.black
    static let primary = Color.white
    static let secondary = Color.gray
    static let accent = Color("1DB954")
    static let cardBackground = Color.white.opacity(0.05)
    static let divider = Color.gray.opacity(0.3)
}

// App Fonts
struct AppFonts {
    static let largeTitle = Font.largeTitle.weight(.bold)
    static let title = Font.title.weight(.semibold)
    static let title2 = Font.title2.weight(.bold)
    static let title3 = Font.title3.weight(.bold)
    static let headline = Font.headline
    static let subheadline = Font.subheadline
    static let body = Font.body
    static let caption = Font.caption
    static let caption2 = Font.caption2
}

// App Sizes
struct AppSizes {
    static let cornerRadius: CGFloat = 12
    static let padding: CGFloat = 16
    static let smallPadding: CGFloat = 8
    static let iconSize: CGFloat = 24
    static let largeIconSize: CGFloat = 32
    
    // Component Sizes
    static let ratingCircleSize: CGFloat = 54
    static let ratingBadgeSize: CGFloat = 40
    static let albumCoverSize: CGFloat = 80
    static let artistImageSize: CGFloat = 60
    static let tabBarHeight: CGFloat = 80
}

// API Configuration
struct APIConfig {
    static let baseURL = "" // TODO: Update with backend link
    static let timeout: TimeInterval = 30
}

// Spotify Configuration
struct SpotifyConfig {
    static let clientID = "" // TODO: Add Spotify Client ID
    static let redirectURI = "" // TODO: Add redirect URI
}

// App Configuration
struct AppConfig {
    static let appName = "Tuun"
    static let maxReviewCommentLength = 500
    static let minRating: Double = 1.0
    static let maxRating: Double = 10.0
}
