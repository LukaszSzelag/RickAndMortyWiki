//
//  CharacterDetailsViewModel.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import Foundation

@MainActor
@Observable
final class CharacterDetailsViewModel {
    private let favoriteCharactersRepository: FavoriteCharactersRepository
    let character: Character
    
    var isFavorite: Bool = false
    
    // MARK: - INIT
    init(favoriteCharactersRepository: FavoriteCharactersRepository, character: Character) {
        self.favoriteCharactersRepository = favoriteCharactersRepository
        self.character = character
    }
    
    func loadFavoriteState() async {
        isFavorite = await favoriteCharactersRepository.isCharacterFavorite(id: character.id)
    }
    
    func toggleFavorite() async {
        await favoriteCharactersRepository.toggleIfFavorite(id: character.id)
        await loadFavoriteState()
    }
}
