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
    
    func fetchEpisodes(page: Int, filters: [EpisodeDTO.Filter : String]) async throws -> PageResponse<Episode> {
        let episodePageResponse: PageResponseDTO<EpisodeDTO> = try await apiClient.request(endpoint: GetItemsPage(page: page, filters: filters))
        
        return episodePageResponse.toDomain { $0.toDomain() }
    }
    func fetchEpisodeByID(_ id: Int) async throws -> Episode {
        let episodeResponse: EpisodeDTO = try await apiClient.request(endpoint: GetSingleItem(id: id))
        
        return episodeResponse.toDomain()
    }
    func fetchEpisodesByIDs(_ ids: [Int]) async throws -> [Episode] {
        guard !ids.isEmpty else { return [] }
        
        if ids.count == 1 {
            let episode: Episode = try await fetchEpisodeByID(ids[0])
            return [episode]
        } else {
            let episodesResponse: [EpisodeDTO] = try await apiClient.request(endpoint: GetMultipleItems(ids: ids))
            
            return episodesResponse.map { $0.toDomain() }
        }
    }
}
