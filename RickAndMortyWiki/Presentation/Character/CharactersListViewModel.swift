//
//  CharactersListViewModel.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

@MainActor
@Observable
final class CharactersListViewModel {
    private let characterRepository: CharacterRepository
    private let favoriteCharactersRepository: FavoriteCharactersRepository
    
    private(set) var characters: [Character] = []
    private(set) var favoriteCharactersIDs: Set<Int> = []
    private(set) var favoriteCharacters: [Character] = []
    private(set) var isFilterSearching: Bool = false
    var displayedCharacters: [Character] {
        if let searchFilter = activeSearchText {
            let filteredFavoriteCharacters = favoriteCharacters.filter { $0.name.localizedCaseInsensitiveContains(searchFilter) }
            let filteredFavoriteCharactersIDs = Set(filteredFavoriteCharacters.map(\.id))
            let nonFavoriteCharacters = characters.filter { !filteredFavoriteCharactersIDs.contains($0.id) }
            
            return filteredFavoriteCharacters + nonFavoriteCharacters
        }
        
        let nonFavoriteCharacters = characters.filter { !favoriteCharactersIDs.contains($0.id) }
        return favoriteCharacters + nonFavoriteCharacters
    }
    
    private(set) var state: CharactersListState = .idle
    
    private(set) var isLoadingNextPage = false
    private var currentPage = 1
    private var hasNextPage = true
    private var canLoadMore: Bool {
        hasNextPage && !isLoadingNextPage
    }
    
    var searchText: String = ""
    private var activeSearchText: String? = nil
    private var normalizedSearchText: String? {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            return nil
        }
        
        return trimmed
    }
    
    // MARK: - INIT
    init(
        characterRepository: CharacterRepository,
        favoriteCharactersRepository: FavoriteCharactersRepository
    ) {
        self.characterRepository = characterRepository
        self.favoriteCharactersRepository = favoriteCharactersRepository
    }
    
    func toggleFavorite(id: Int) async {
        await favoriteCharactersRepository.toggleIfFavorite(id: id)
        await refreshFavorites()
    }
    
    func refreshFavorites() async {
        await loadFavoriteCharacters()
    }
    
    func isFavorite(_ character: Character) -> Bool {
        favoriteCharactersIDs.contains(character.id)
    }
    
    private func loadFavoriteCharacters() async {
        let ids = await favoriteCharactersRepository.favoriteCharacterIDs()
        
        guard !ids.isEmpty else {
            favoriteCharactersIDs = []
            favoriteCharacters = []
            return
        }
        
        do {
            favoriteCharactersIDs = ids
            favoriteCharacters = try await characterRepository.fetchCharactersByIDs(Array(favoriteCharactersIDs))
        } catch {
            favoriteCharacters = []
        }
    }
    
    func loadInitialPageIfNeeded() async {
        guard characters.isEmpty else { return }
        guard state == .idle else { return }
        await loadFavoriteCharacters()
        await refresh()
    }
    
    func refresh() async {
        currentPage = 1
        hasNextPage = true
        characters = []
        state = .loading
        
        await loadPage(page: 1, reset: true)
    }
    
    func loadNextPageIfNeeded(currentCharacter: Character) async {
        guard characters.last?.id == currentCharacter.id else { return }
        guard canLoadMore else { return }
        
        isLoadingNextPage = true
        defer { isLoadingNextPage = false }
        await loadPage(page: currentPage + 1, reset: false)
    }
    
    private func loadPage(page: Int, reset: Bool) async {
        do {
            let charactersPage = try await characterRepository.fetchCharacters(page: page, name: activeSearchText)
            currentPage = page
            hasNextPage = charactersPage.hasNextPage
            
            if reset {
                characters = charactersPage.items
            } else {
                characters.append(contentsOf: charactersPage.items)
            }
            
            state = displayedCharacters.isEmpty ? .empty : .loaded
        } catch {
            if characters.isEmpty {
                state = .error(error.localizedDescription)
            }
        }
    }
    
    func search() async {
        activeSearchText = normalizedSearchText
        await refresh()
    }
    
    func searchTextChanged(from oldValue: String, to newValue: String) async {
        let oldTrimmed = oldValue.trimmingCharacters(in: .whitespacesAndNewlines)
        let newTrimmed = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !oldTrimmed.isEmpty, newTrimmed.isEmpty {
            activeSearchText = nil
            await refresh()
        }
    }
}
