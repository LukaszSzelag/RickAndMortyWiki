//
//  AppDependencies.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 07/06/2026.
//

import Foundation

struct AppDependencies: Sendable {
    let characterRepository: any CharacterRepository
    let episodeRepository: any EpisodeRepository
    let favoriteCharactersRepository: any FavoriteCharactersRepository
}

extension AppDependencies {
    static func production() -> AppDependencies {
        let apiClient = RickAndMortyApiClient()
        
        return AppDependencies(
            characterRepository: DefaultCharacterRepository(
                apiClient: apiClient
            ),
            episodeRepository: DefaultEpisodeRepository(
                apiClient: apiClient
            ),
            favoriteCharactersRepository: DefaultFavoriteCharactersRepository()
        )
    }
}

#if DEBUG
extension AppDependencies {
    static func mockSuccess() -> AppDependencies {
        return AppDependencies(
            characterRepository: MockCharacterRepository(charactersPageResult: .success(.mock), charactersByIDsResult: .success(Character.mockCharacters)),
            episodeRepository: MockEpisodeRepository(episodeResult: .success(.mock)),
            favoriteCharactersRepository: MockFavoriteCharactersRepository(ids: [1, 2])
        )
    }
    
    static func mockEmpty() -> AppDependencies {
        return AppDependencies(
            characterRepository: MockCharacterRepository(charactersPageResult: .success(.empty), charactersByIDsResult: .success([])),
            episodeRepository: MockEpisodeRepository(episodeResult: .success(.mock)),
            favoriteCharactersRepository: MockFavoriteCharactersRepository(ids: [])
        )
    }
    
    static func mockFailure() -> AppDependencies {
        return AppDependencies(
            characterRepository: MockCharacterRepository(charactersPageResult: .failure(ApiError.fromCode(429)), charactersByIDsResult: .failure(ApiError.decodingFailure)),
            episodeRepository: MockEpisodeRepository(episodeResult: .failure(ApiError.fromCode(404))),
            favoriteCharactersRepository: MockFavoriteCharactersRepository(ids: [])
        )
    }
}

#endif
