//
//  ProfileView.swift
//  tuun
//
//  Created by Cole Uyematsu on 10/19/25.
//

import SwiftUI

struct ProfileView: View {
    // TODO: Backend - ViewModel will fetch data from API
    @StateObject private var viewModel = ProfileViewModel()
    @State private var selectedBottomTab: TabBarItem = .yourList
    @State private var selectedProfileTab: ProfileTab = .list
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Profile Header
                // TODO: Backend - User data from GET /api/users/{userId}
                ProfileHeaderView(
                    user: viewModel.user,
                    selectedTab: $selectedProfileTab
                )
                .padding(.horizontal)
                
                // Divider
                Divider()
                    .background(Color.gray.opacity(0.3))
                    .padding(.top, 12)
                
                // Content based on selected tab
                // TODO: Backend - All views get data from GET /api/reviews/user/{userId}
                Group {
                    switch selectedProfileTab {
                    case .list:
                        ListView(reviews: viewModel.sortedReviews)
                            .transition(.opacity)
                    case .grid:
                        GridView(reviews: viewModel.sortedReviews)
                            .transition(.opacity)
                    case .summary:
                        SummaryView(artistSummaries: viewModel.artistSummaries)
                            .transition(.opacity)
                    }
                }
                
                // Bottom Tab Bar
                // TODO: Backend - Navigation will trigger different API calls
                TabBar(selectedTab: $selectedBottomTab)
            }
        }
        // TODO: Backend - Add this when connecting to API:
        // .onAppear {
        //     Task {
        //         await viewModel.loadUserProfile(userId: currentUserId)
        //     }
        // }
    }
}

#Preview {
    ProfileView()
}
