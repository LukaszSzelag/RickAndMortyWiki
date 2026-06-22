//
//  RootView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 17/06/2026.
//

import SwiftUI

struct RootView: View {
    let dependencies: AppDependencies
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            
            Tab("Characters", systemImage: "person") {
                CharactersView(dependencies: dependencies)
            }
            
            Tab("Episodes", systemImage: "tv") {
                EpisodeListView()
            }
            
            Tab("Locations", systemImage: "map") {
                LocationListView()
            }
            
            Tab("Home", systemImage: "magnifyingglass", role: .search) {
                HomeView()
            }
        }
        .tint(.appTeal)
    }
}

#Preview {
    let dependencies = AppDependencies.mockSuccess()
    RootView(dependencies: dependencies)
}
