//
//  TabBar.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

enum TabBarItem: String, CaseIterable {
    case feed
    case friends
    case add
    case yourList
    case suggestion
    
    var icon: String {
        switch self {
        case .feed: return "text.justify"
        case .friends: return "person.2"
        case .add: return "plus.circle.fill"
        case .yourList: return "chart.bar"
        case .suggestion: return "shuffle"
        }
    }
    
    var label: String {
        switch self {
        case .feed: return "feed"
        case .friends: return "friends"
        case .add: return ""
        case .yourList: return "your list"
        case .suggestion: return "suggestion"
        }
    }
    
    var isLarge: Bool {
        self == .add
    }
}

struct TabBar: View {
    @Binding var selectedTab: TabBarItem
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabBarItem.allCases, id: \.self) { item in
                TabBarButton(
                    item: item,
                    isSelected: selectedTab == item
                ) {
                    selectedTab = item
                }
            }
        }
        .frame(height: 80)
        .background(Color.black)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3)),
            alignment: .top
        )
    }
}

struct TabBarButton: View {
    let item: TabBarItem
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: item.icon)
                    .font(item.isLarge ? .system(size: 32) : .system(size: 24))
                    .foregroundColor(isSelected ? .white : .gray)
                
                if !item.label.isEmpty {
                    Text(item.label)
                        .font(.caption2)
                        .foregroundColor(isSelected ? .white : .gray)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            Spacer()
            TabBar(selectedTab: .constant(.yourList))
        }
    }
}
