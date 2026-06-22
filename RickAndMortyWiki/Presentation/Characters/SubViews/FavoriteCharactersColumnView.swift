//
//  FavoriteCharactersColumnView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 18/06/2026.
//

import SwiftUI

struct FavoriteCharactersColumnView: View {
    let character: Character
    let size: CGFloat = 70
    
    var viewModel: CharactersViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            CharacterImage(character: character, size: size)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(.teal, lineWidth: 2)
                }
                .shadow(color: .appGreen, radius: 3)
                .overlay(alignment: .topTrailing) {
                    Circle()
                        .fill(.primaryBackground)
                        .frame(width: 24, height: 24)
                        .overlay {
                            Image(systemName: "xmark")
                                .foregroundStyle(.red)
                        }
                        .onTapGesture {
                            Task {
                                await viewModel.toggleFavorite(characterID: character.id)
                            }
                        }
                        .offset(x: 6, y: -6)
                }
            Text(character.name)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(width: size)
    }
}

#Preview {
    let dependencies = AppDependencies.production()
    let characterRepository = dependencies.characterRepository
    let favoritesRepository = dependencies.favoritesRepository
    
    FavoriteCharactersColumnView(character: .mockJerry, viewModel: CharactersViewModel(characterRepository: characterRepository, favoritesRepository: favoritesRepository))
        .preferredColorScheme(.dark)
}
