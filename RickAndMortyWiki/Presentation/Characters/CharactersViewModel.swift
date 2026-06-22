//
//  CharactersViewModel.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 18/06/2026.
//

import Foundation

@MainActor
@Observable
final class CharactersViewModel {
    private let characterRepository: CharacterRepository
    private let favoritesRepository: FavoritesRepository
    
    var viewState: CharactersViewState = .idle
    
    var isLoading: Bool = false
    var hasNextPage: Bool = true
    var currentPage: Int = 1
    
    var canLoadMore: Bool {
        return hasNextPage && !isLoading
    }
    
    var favoriteCharactersIDs: Set<Int> = []
    var favoriteCharacters: [Character] = []
    var characters: [Character] = []
    
    // MARK: INIT
    init(characterRepository: CharacterRepository, favoritesRepository: FavoritesRepository) {
        self.characterRepository = characterRepository
        self.favoritesRepository = favoritesRepository
    }
    
    func loadInitialPage() async {
        guard viewState == .idle else { return }
        guard characters.isEmpty else { return }
        
        await loadFavorites()
        await refresh()
    }
    
    func refresh() async {
        guard !isLoading else { return }
        characters = []
        
        await loadPage(page: 1, refresh: true)
    }
    
    func loadNextPage(currentCharacter: Character) async {
        guard characters.last!.id == currentCharacter.id else { return }
        guard canLoadMore else { return }
        
        isLoading = true
        defer { isLoading = false }
        
        await loadPage(page: currentPage + 1, refresh: false)
    }
    
    func loadPage(page: Int, refresh: Bool) async {
        do {
            let charactersPage = try await characterRepository.fetchCharacters(page: page, filters: [:])
            
            currentPage = page
            hasNextPage = charactersPage.hasNextPage
            
            if refresh {
                characters = charactersPage.itemsOnPage
            } else {
                characters.append(contentsOf: charactersPage.itemsOnPage)
            }
            
            viewState = charactersPage.itemsOnPage.isEmpty ? .empty : .loaded
        } catch {
            if characters.isEmpty {
                viewState = .empty
            }
        }
    }
    
    func loadFavorites() async {
        do {
            favoriteCharactersIDs = await favoritesRepository.getFavoriteIDs(for: Character.self)
            favoriteCharacters = try await characterRepository.fetchCharactersByIDs(Array(favoriteCharactersIDs))
        } catch {
            favoriteCharacters = []
        }
    }
    
    func checkIfFavorite(characterID: Int) -> Bool {
        return favoriteCharactersIDs.contains(characterID)
    }
    
    func toggleFavorite(characterID: Int) async {
        await favoritesRepository.toggleFavorite(id: characterID, for: Character.self)
        await loadFavorites()
    }
}
