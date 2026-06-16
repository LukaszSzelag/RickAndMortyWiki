//
//  EpisodeRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

protocol EpisodeRepository: Sendable {
    func fetchEpisodes(page: Int, filters: [EpisodeDTO.Filter : String]) async throws -> PageResponse<Episode>
    func fetchEpisodeByID(_ id: Int) async throws -> Episode
    func fetchEpisodesByIDs(_ ids: [Int]) async throws -> [Episode]
}
