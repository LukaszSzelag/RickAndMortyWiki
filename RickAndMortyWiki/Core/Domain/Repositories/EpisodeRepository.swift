//
//  EpisodeRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

protocol EpisodeRepository: Sendable {
    func fetchEpisode(id: Int) async throws -> Episode
}
