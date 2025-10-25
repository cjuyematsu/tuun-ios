//
//  ProfileTabSelector.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

enum ProfileTab {
    case list
    case grid
    case summary
    
    var icon: String {
        switch self {
        case .summary: return "chart.bar.fill"
        case .grid: return "square.grid.3x3.fill"
        case .list: return "list.bullet"
        }
    }
}

struct ProfileTabSelector: View {
    @Binding var selectedTab: ProfileTab
    
    var body: some View {
        HStack(spacing: 0) {
            ProfileTabButton(
                icon: ProfileTab.summary.icon,
                isSelected: selectedTab == .summary
            ) {
                selectedTab = .summary
            }
            
            ProfileTabButton(
                icon: ProfileTab.grid.icon,
                isSelected: selectedTab == .grid
            ) {
                selectedTab = .grid
            }
            
            ProfileTabButton(
                icon: ProfileTab.list.icon,
                isSelected: selectedTab == .list
            ) {
                selectedTab = .list
            }
        }
        .frame(height: 44)
    }
}

struct ProfileTabButton: View {
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(isSelected ? .white : .gray)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        ProfileTabSelector(selectedTab: .constant(.list))
    }
}
