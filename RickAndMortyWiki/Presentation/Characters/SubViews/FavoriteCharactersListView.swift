//
//  FavoriteCharactersListView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 18/06/2026.
//

import SwiftUI

struct FavoriteCharactersListView: View {
    
    var viewModel: CharactersViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorites")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(viewModel.favoriteCharacters) { character in
                        NavigationLink(destination: Text(character.name)){
                            FavoriteCharactersColumnView(character: character, viewModel: viewModel)
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    let dependencies = AppDependencies.production()
    let characterRepository = dependencies.characterRepository
    let favoritesRepository = dependencies.favoritesRepository
    
    FavoriteCharactersListView(viewModel: .init(characterRepository: characterRepository, favoritesRepository: favoritesRepository))
}
