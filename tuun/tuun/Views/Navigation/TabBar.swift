import SwiftUI

enum Tab: Int, CaseIterable {
    case home, search, library, rate
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .library: return "Your Library"
        case .rate: return "Rate"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "icon_home"
        case .search: return "icon_search"
        case .library: return "icon_library"
        case .rate: return "icon_add"
        }
    }
    
    var iconSelected: String {
        switch self {
        case .home: return "icon_home_selected"
        case .search: return "icon_search_selected"
        case .library: return "icon_library_selected"
        case .rate: return "icon_add_selected"
        }
    }
}

struct TabBar: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                case .home: HomeView()
                case .search: SearchView()
                case .library: LibraryView()
                case .rate: RateView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Tab Bar
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        VStack(spacing: 5) {
                            Image(selectedTab == tab ? tab.iconSelected : tab.icon)
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 22, height: 22)
                            Text(tab.title)
                                .font(.custom(selectedTab == tab ? "Aleo-Bold" : "Aleo-Regular", size: 11))
                        }
                        .foregroundColor(selectedTab == tab ? .tuunTabBarSelected : .tuunTabBarUnselected)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 26)
                    }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.tuunTabBarBackground)
                    .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: -4)
                    .ignoresSafeArea(.container, edges: .bottom)
            )
        }
        .background(Color.tuunBackground)
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home").font(.largeTitle)
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search").font(.largeTitle)
    }
}

struct LibraryView: View {
    var body: some View {
        Text("Library").font(.largeTitle)
    }
}

struct RateView: View {
    var body: some View {
        Text("Rate").font(.largeTitle)
    }
}
