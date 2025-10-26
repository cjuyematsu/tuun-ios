//
//  AlbumCover.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.

import SwiftUI

struct AlbumCover: View {
    let imageName: String
    let size: CGFloat
    let cornerRadius: CGFloat
    
    init(imageName: String, size: CGFloat = 80, cornerRadius: CGFloat = 8) {
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
        VStack(spacing: 20) {
            AlbumCover(imageName: "flower_boy", size: 100)
            AlbumCover(imageName: "mbdtf", size: 60)
        }
    }
}
