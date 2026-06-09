//
//  EpisodeDetailsViewModelTests.swift
//  RickAndMortyWikiTests
//
//  Created by Łukasz Szeląg on 08/06/2026.
//

import Testing
@testable import RickAndMortyWiki

@MainActor
@Suite("EpisodeDetailsViewModel Tests")
struct EpisodeDetailsViewModelTests {

    @Test
    func loadWhenAppeared_whenRepositoriesSucceed_setsLoadedState() async throws {
        let characterRepository = MockCharacterRepository(charactersPageResult: .success(.mock), charactersByIDsResult: .success(Character.mockEpisodeCharacters))
        let episodeRepository = MockEpisodeRepository(episodeResult: .success(.mock))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [])
        let episodeID = Episode.mock.id
        
        let viewModel = EpisodeDetailsViewModel(
            characterRepository: characterRepository,
            episodeRepository: episodeRepository,
            favoriteCharactersRepository: favoriteCharactersRepository,
            episodeID: episodeID
        )
        
        await viewModel.loadWhenAppeared()
        
        #expect(viewModel.state == .loaded(.mock, Character.mockEpisodeCharacters))
    }

    @Test
    func loadWhenAppeared_whenCharactersContainFavorites_sortsFavoritesFirst() async {
        let characters = [
            Character.mockRick,
            Character.mockMorty
        ]
        
        let characterRepository = MockCharacterRepository(charactersPageResult: .success(.mock), charactersByIDsResult: .success(characters))
        let episodeRepository = MockEpisodeRepository(episodeResult: .success(.mock))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [Character.mockMorty.id])
        
        let viewModel = EpisodeDetailsViewModel(
            characterRepository: characterRepository,
            episodeRepository: episodeRepository,
            favoriteCharactersRepository: favoriteCharactersRepository,
            episodeID: 1
        )
        
        await viewModel.loadWhenAppeared()
        
        guard case .loaded(_, let loadedCharacters) = viewModel.state else {
            Issue.record("Expected loaded state")
            return
        }
        
        #expect(
            loadedCharacters.map(\.id) == [Character.mockMorty.id, Character.mockRick.id]
        )
    }
    
    @Test
    func loadWhenAppeared_whenEpisodeResponseRepositoryFails_setsErrorState() async {
        let characterRepository = MockCharacterRepository(charactersPageResult: .success(.mock), charactersByIDsResult: .success(Character.mockCharacters))
        let episodeRepository = MockEpisodeRepository(episodeResult: .failure(ApiError.decodingFailure))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [Character.mockMorty.id])
        
        let viewModel = EpisodeDetailsViewModel(
            characterRepository: characterRepository,
            episodeRepository: episodeRepository,
            favoriteCharactersRepository: favoriteCharactersRepository,
            episodeID: 1
        )
        
        await viewModel.loadWhenAppeared()
        
        guard case .error(let message) = viewModel.state else {
            Issue.record("Expected error state")
            return
        }
        
        #expect(message.isEmpty == false)
    }
}
