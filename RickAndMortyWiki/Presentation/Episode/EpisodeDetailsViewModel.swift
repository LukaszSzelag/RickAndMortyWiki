//
//  EpisodeDetailsViewModel.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 07/06/2026.
//

import Foundation

@MainActor
@Observable
final class EpisodeDetailsViewModel {
    private let characterRepository: CharacterRepository
    private let episodeRepository: EpisodeRepository
    private let favoriteCharactersRepository: FavoriteCharactersRepository
    let episodeID: Int
    
    private(set) var state: EpisodeDetailsState = .idle
    private(set) var favoriteIDs: Set<Int> = []
    
    // MARK: - INIT
    init(
        characterRepository: CharacterRepository,
        episodeRepository: EpisodeRepository,
        favoriteCharactersRepository: FavoriteCharactersRepository,
        episodeID: Int
    ) {
        self.characterRepository = characterRepository
        self.episodeRepository = episodeRepository
        self.favoriteCharactersRepository = favoriteCharactersRepository
        self.episodeID = episodeID
    }
    
    func loadWhenAppeared() async {
        guard state == .idle else { return }
        await loadData()
    }
    
    func retry() async {
        state = .idle
        await loadData()
    }
    
    func isFavorite(_ character: Character) -> Bool {
        return favoriteIDs.contains(character.id)
    }
    
    private func loadData() async {
        state = .loading
        
        do {
            let episode = try await episodeRepository.fetchEpisode(id: episodeID)

            var characters = try await characterRepository.fetchCharactersByIDs(episode.characterIDs)
            favoriteIDs = await favoriteCharactersRepository.favoriteCharacterIDs()
            
            characters.sort {
                let lhsIsFavorite = isFavorite($0)
                let rhsIsFavorite = isFavorite($1)
                
                if lhsIsFavorite != rhsIsFavorite {
                    return lhsIsFavorite
                }
                return $0.id < $1.id
            }
            
            state = .loaded(episode, characters)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
