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
    let locationRepository: any LocationRepository
    let favoritesRepository: any FavoritesRepository
}

extension AppDependencies {
    static func production() -> AppDependencies {
        let apiClient = RickAndMortyApiClient()
        
        return AppDependencies(
            characterRepository: DefaultCharacterRepository(apiClient: apiClient),
            episodeRepository: DefaultEpisodeRepository(apiClient: apiClient),
            locationRepository: DefaultLocationRepository(apiClient: apiClient),
            favoritesRepository: DefaultFavoritesRepository()
        )
    }
}

#if DEBUG
extension AppDependencies {
    static func mockSuccess() -> AppDependencies {
        let characterReposiotory = MockCharacterRepository(
            charactersPageResult: .success(.mockCharacterPage),
            characterByIDResult: .success(.mockRick),
            charactersByIDsResult: .success(Character.mockCharacters)
        )
        let episodeRepository = MockEpisodeRepository(
            episodesPageResult: .success(.mockEpisodePage),
            episodeByIDResult: .success(.mockEp1),
            episodesByIDsResult: .success(Episode.mockEpisodes)
        )
        let locationRepository = MockLocationRepository(
            locationsPageResult: .success(.mockLocationPage),
            locationByIDResult: .success(.mockLoc1),
            locationsByIDsResult: .success(Location.mockLocations)
        )
        let favoritesRepository = MockFavoritesRepository(ids: [1, 2, 3])
        
        return AppDependencies(
            characterRepository: characterReposiotory,
            episodeRepository: episodeRepository,
            locationRepository: locationRepository,
            favoritesRepository: favoritesRepository
        )
    }
    
    static func mockEmpty() -> AppDependencies {
        let characterReposiotory = MockCharacterRepository(
            charactersPageResult: .success(.mockEmptyCharacterPage),
            characterByIDResult: .success(.mockRick),
            charactersByIDsResult: .success([])
        )
        let episodeRepository = MockEpisodeRepository(
            episodesPageResult: .success(.mockEmptyEpisodePage),
            episodeByIDResult: .success(.mockEp1),
            episodesByIDsResult: .success([])
        )
        let locationRepository = MockLocationRepository(
            locationsPageResult: .success(.mockEmptyLocationPage),
            locationByIDResult: .success(.mockLoc1),
            locationsByIDsResult: .success([])
        )
        let favoritesRepository = MockFavoritesRepository(ids: [])
        
        return AppDependencies(
            characterRepository: characterReposiotory,
            episodeRepository: episodeRepository,
            locationRepository: locationRepository,
            favoritesRepository: favoritesRepository
        )
    }
    
    static func mockFailure() -> AppDependencies {
        let characterReposiotory = MockCharacterRepository(
            charactersPageResult: .failure(ApiError.fromCode(429)),
            characterByIDResult: .failure(ApiError.fromCode(404)),
            charactersByIDsResult: .failure(ApiError.fromCode(403))
        )
        let episodeRepository = MockEpisodeRepository(
            episodesPageResult: .failure(ApiError.fromCode(429)),
            episodeByIDResult: .failure(ApiError.fromCode(404)),
            episodesByIDsResult: .failure(ApiError.fromCode(403))
        )
        let locationRepository = MockLocationRepository(
            locationsPageResult: .failure(ApiError.fromCode(429)),
            locationByIDResult: .failure(ApiError.fromCode(404)),
            locationsByIDsResult: .failure(ApiError.fromCode(403))
        )
        let favoritesRepository = MockFavoritesRepository(ids: [])
        
        return AppDependencies(
            characterRepository: characterReposiotory,
            episodeRepository: episodeRepository,
            locationRepository: locationRepository,
            favoritesRepository: favoritesRepository
        )
    }
}

#endif
