//
//  CharactersView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 18/06/2026.
//

import SwiftUI

struct CharactersView: View {
    private let dependencies: AppDependencies
    
    @State private var viewModel: CharactersViewModel
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
        self._viewModel = State(initialValue: CharactersViewModel(characterRepository: dependencies.characterRepository, favoritesRepository: dependencies.favoritesRepository))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground.ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    FavoriteCharactersListView(viewModel: viewModel)
                    CharactersListView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    let dependencies = AppDependencies.production()
    CharactersView(dependencies: dependencies)
}
