//
//  MainTabView.swift
//  airbnb
//
//  Created by SENA on 1.10.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore" ,systemImage: "magnifyingglass") }
            WishlistView()
                .tabItem { Label("Wishlist" ,systemImage: "heart.fill") }
            ProfileView()
                .tabItem { Label("Profile" ,systemImage: "person.crop.circle.fill") }
        }
        .tint(.pink)
        
    }
}

#Preview {
    MainTabView()
}
