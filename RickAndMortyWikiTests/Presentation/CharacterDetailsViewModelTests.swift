//
//  CharacterDetailsViewModelTests.swift
//  RickAndMortyWikiTests
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import Testing
@testable import RickAndMortyWiki

@MainActor
@Suite("CharacterDetailsViewModel Tests")
struct CharacterDetailsViewModelTests {

    @Test
    func loadFavoriteState_whenCharacterIsFavorite_setsIsFavoriteToTrue() async {
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [Character.mockRick.id])
        
        let viewModel = CharacterDetailsViewModel(
            favoriteCharactersRepository: favoriteCharactersRepository,
            character: Character.mockRick
        )
        
        await viewModel.loadFavoriteState()
        #expect(viewModel.isFavorite == true)
    }
    
    @Test
    func loadFavoriteState_whenCharacterIsNotFavorite_setsIsFavoriteToFalse() async {
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [Character.mockRick.id])
        
        let viewModel = CharacterDetailsViewModel(
            favoriteCharactersRepository: favoriteCharactersRepository,
            character: Character.mockMorty
        )
        
        await viewModel.loadFavoriteState()
        #expect(viewModel.isFavorite == false)
    }
    
    @Test
    func toggleFavorite_whenCharacterIsNotFavorite_addsToFavorite() async {
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [])
        
        let viewModel = CharacterDetailsViewModel(
            favoriteCharactersRepository: favoriteCharactersRepository,
            character: Character.mockMorty
        )
        
        await viewModel.toggleFavorite()
        
        #expect(viewModel.isFavorite == true)
        
        let isFavorite = await favoriteCharactersRepository.isCharacterFavorite(id: Character.mockMorty.id)
        #expect(isFavorite == true)
    }
}
