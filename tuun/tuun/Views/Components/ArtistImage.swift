//
//  ArtistImage.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.

import SwiftUI

struct ArtistImage: View {
    let imageName: String
    let size: CGFloat
    let cornerRadius: CGFloat
    
    init(imageName: String, size: CGFloat = 60, cornerRadius: CGFloat = 8) {
        self.imageName = imageName
        self.size = size
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

#Preview {
    ZStack {
        Color.black
        HStack(spacing: 20) {
            ArtistImage(imageName: "kendrick", size: 80)
            ArtistImage(imageName: "tyler", size: 60)
        }
    }
}
