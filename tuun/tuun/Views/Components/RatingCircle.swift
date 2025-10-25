//
//  RatingCircle.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

struct RatingCircle: View {
    let rating: Double
    let size: CGFloat
    let fontSize: Font
    
    init(rating: Double, size: CGFloat = 54, fontSize: Font = .title3) {
        self.rating = rating
        self.size = size
        self.fontSize = fontSize
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 2)
                .frame(width: size, height: size)
            
            Text(String(format: "%.1f", rating))
                .font(fontSize)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct RatingBadge: View {
    let rating: Double
    let size: CGFloat
    
    init(rating: Double, size: CGFloat = 40) {
        self.rating = rating
        self.size = size
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: size, height: size)
            
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: size, height: size)
            
            Text(String(format: "%.1f", rating))
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        VStack(spacing: 20) {
            RatingCircle(rating: 9.7)
            RatingBadge(rating: 8.5)
        }
    }
}
