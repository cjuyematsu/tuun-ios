//
//  ProfileHeaderView.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @Binding var selectedTab: ProfileTab
    
    var body: some View {
        VStack(spacing: 16) {
            // Username
            Text(user.username)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            // Stats Row
            HStack(spacing: 40) {
                ProfileStat(value: user.reviewCount, label: "Reviews")
                ProfileStat(value: user.followerCount, label: "Followers")
                ProfileStat(value: user.followingCount, label: "Following")
            }
            
            // Tab Selector
            ProfileTabSelector(selectedTab: $selectedTab)
        }
        .padding(.top, 8)
    }
}

struct ProfileStat: View {
    let value: Int
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(value)")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(label)
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        ProfileHeaderView(
            user: MockData.sampleUser,
            selectedTab: .constant(.list)
        )
    }
}
