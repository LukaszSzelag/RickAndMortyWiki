//
//  EpisodeDTO+Mapper.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

extension EpisodeDTO {
    func toDomain() -> Episode {
        Episode(
            id: id,
            name: name,
            airDate: airDate,
            episodeCode: episode,
            characterIDs: characters.compactMap { Int($0.lastPathComponent) }
        )
    }
}
