//
//  MockEpisodeRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
struct MockEpisodeRepository: EpisodeRepository {
    var episodeResult: Result<Episode, Error>
    
    init(
        episodeResult: Result<Episode, Error>
    ) {
        self.episodeResult = episodeResult
    }
    
    func fetchEpisode(id: Int) async throws -> Episode {
        try episodeResult.get()
    }
}
#endif
