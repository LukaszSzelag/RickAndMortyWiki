//
//  MockEpisodeRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
struct MockEpisodeRepository: EpisodeRepository {
    var episodesPageResult: Result<PageResponse<Episode>, Error>
    var episodeByIDResult: Result<Episode, Error>
    var episodesByIDsResult: Result<[Episode], Error>
    
    init(
        episodesPageResult: Result<PageResponse<Episode>, Error>,
        episodeByIDResult: Result<Episode, Error>,
        episodesByIDsResult: Result<[Episode], Error>
    )
    {
        self.episodesPageResult = episodesPageResult
        self.episodeByIDResult = episodeByIDResult
        self.episodesByIDsResult = episodesByIDsResult
    }
    
    func fetchEpisodes(page: Int, filters: [EpisodeDTO.Filter : String]) async throws -> PageResponse<Episode> {
        try episodesPageResult.get()
    }
    
    func fetchEpisodeByID(_ id: Int) async throws -> Episode {
        let mockEpisode = try episodeByIDResult.get()
        
        if mockEpisode.id == id {
            return mockEpisode
        } else {
            throw ApiError.notFound
        }
    }
    
    func fetchEpisodesByIDs(_ ids: [Int]) async throws -> [Episode] {
        try episodesByIDsResult.get().filter { ids.contains($0.id) }
    }
}
#endif
