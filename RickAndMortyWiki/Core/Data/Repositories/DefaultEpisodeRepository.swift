//
//  DefaultEpisodeRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

struct DefaultEpisodeRepository: EpisodeRepository {
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient = RickAndMortyApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchEpisode(id: Int) async throws -> Episode {
        let dto: EpisodeDTO = try await apiClient.request(.episode(id: id))
        
        return dto.toDomain()
    }
}
