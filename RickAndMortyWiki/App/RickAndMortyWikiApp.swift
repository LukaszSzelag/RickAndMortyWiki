//
//  RickAndMortyWikiApp.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import SwiftUI

@main
struct RickAndMortyWikiApp: App {
    private let dependencies: AppDependencies = AppDependencies.production()
    
    var body: some Scene {
        WindowGroup {
            RootView(dependencies: dependencies)
        }
    }
}
