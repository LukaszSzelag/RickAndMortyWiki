//
//  CharactersListViewModelTests.swift
//  RickAndMortyWikiTests
//
//  Created by Łukasz Szeląg on 09/06/2026.
//

import Testing
@testable import RickAndMortyWiki


@MainActor
@Suite("CharactersListViewModel Tests")
struct CharactersListViewModelTests {

    @Test
    func loadInitialPageIfNeeded_whenRepositorySucceeds_setsLoadedState() async {
        let charactersRepository = MockCharacterRepository(charactersPageResult: .success(.mock), charactersByIDsResult: .success([]))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [])
        
        let viewModel = CharactersListViewModel(characterRepository: charactersRepository, favoriteCharactersRepository: favoriteCharactersRepository)
        
        await viewModel.loadInitialPageIfNeeded()
        
        #expect(viewModel.characters == Character.mockCharacters)
        #expect(viewModel.state == .loaded)
    }
    
    @Test
    func loadInitialPageIfNeeded_whenRepositoryReturnsEmptyPage_setsEmptyState() async {
        let charactersRepository = MockCharacterRepository(charactersPageResult: .success(.empty), charactersByIDsResult: .success([]))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [])
        
        let viewModel = CharactersListViewModel(characterRepository: charactersRepository, favoriteCharactersRepository: favoriteCharactersRepository)
        
        await viewModel.loadInitialPageIfNeeded()
        
        #expect(viewModel.characters == [])
        #expect(viewModel.state == .empty)
    }

    @Test
    func loadInitialPageIfNeeded_whenRepositoryReturnsError_setsErroState() async {
        let charactersRepository = MockCharacterRepository(charactersPageResult: .failure(ApiError.fromCode(404)), charactersByIDsResult: .failure(ApiError.fromCode(404)))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [])
        
        let viewModel = CharactersListViewModel(characterRepository: charactersRepository, favoriteCharactersRepository: favoriteCharactersRepository)
        
        await viewModel.loadInitialPageIfNeeded()
        
        guard case .error(let message) = viewModel.state else {
            Issue.record("Expected error state")
            return
        }
        
        #expect(viewModel.characters == [])
        #expect(message.isEmpty == false)
    }
    
    @Test
    func loadInitialPageIfNeeded_whenFavoritesExist_displayFavoritesFirst() async {
        let charactersRepository = MockCharacterRepository(charactersPageResult: .success(.mock), charactersByIDsResult: .success([.mockSummer]))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [Character.mockSummer.id])
        
        let viewModel = CharactersListViewModel(characterRepository: charactersRepository, favoriteCharactersRepository: favoriteCharactersRepository)
        
        await viewModel.loadInitialPageIfNeeded()
        
        #expect(viewModel.characters.isEmpty == false)
        #expect(viewModel.displayedCharacters.first?.id == Character.mockSummer.id)
        #expect(viewModel.isFavorite(.mockMorty) == false)
        #expect(viewModel.isFavorite(.mockSummer) == true)
    }
    
    @Test
    func search_whenRepositoryReturnsEmpty_setsEmptyState() async {
        let charactersRepository = MockCharacterRepository(charactersPageResult: .success(.empty), charactersByIDsResult: .success([]))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [1, 2])
        
        let viewModel = CharactersListViewModel(characterRepository: charactersRepository, favoriteCharactersRepository: favoriteCharactersRepository)
        
        viewModel.searchText = "NotSearchable"
        await viewModel.search()
        
        #expect(viewModel.state == .empty)
        #expect(viewModel.characters.isEmpty == true)
        #expect(viewModel.displayedCharacters.isEmpty == true)
        #expect(viewModel.favoriteCharacters.isEmpty == true)
    }
    
    @Test
    func refresh_whenRepositorySucceeds_refreshCharacters() async {
        let charactersRepository = MockCharacterRepository(charactersPageResult: .success(.mock), charactersByIDsResult: .success(Character.mockCharacters))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [1, 2])
        
        let viewModel = CharactersListViewModel(characterRepository: charactersRepository, favoriteCharactersRepository: favoriteCharactersRepository)
        
        await viewModel.refresh()
        
        #expect(viewModel.characters == Character.mockCharacters)
        #expect(viewModel.state == .loaded)
    }
    
    @Test
    func loadNextPageIfNeeded_whenCurrentCharacterIsLastAndNextPageExists_appendsCharacters() async {
        let charactersRepository = MockCharacterRepository(charactersPageResult: .success(.mock), charactersByIDsResult: .success(Character.mockCharacters))
        let favoriteCharactersRepository = MockFavoriteCharactersRepository(ids: [])
        
        let viewModel = CharactersListViewModel(characterRepository: charactersRepository, favoriteCharactersRepository: favoriteCharactersRepository)
        
        await viewModel.loadInitialPageIfNeeded()
        
        let initialCharacterCount = viewModel.characters.count
        
        guard let lastCharacter = viewModel.characters.last else {
            Issue.record("Expected characters to not be empty")
            return
        }
        
        await viewModel.loadNextPageIfNeeded(currentCharacter: lastCharacter)
        
        #expect(viewModel.characters.count > initialCharacterCount)
        #expect(viewModel.characters.count == initialCharacterCount + Character.mockCharacters.count)
    }
}
