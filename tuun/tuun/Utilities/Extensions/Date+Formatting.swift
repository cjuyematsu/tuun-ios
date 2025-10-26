//
//  Date+Formatting.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

extension Date {
    func formatted(as format: String = "MM/dd/yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension View {
    func cardStyle() -> some View {
        self
            .background(Color.tuunCard)
            .cornerRadius(AppSizes.cornerRadius)
    }
}

extension Double {
    func formatRating() -> String {
        String(format: "%.1f", self)
    }
}
