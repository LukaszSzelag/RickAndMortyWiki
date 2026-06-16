//
//  EpisodeDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct EpisodeDTO: Decodable, Sendable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String // Episode Code
    let characters: [URL]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
    }
}

extension EpisodeDTO {
    func toDomain() -> Episode {
        Episode(
            id: id,
            name: name,
            airDate: airDate,
            episodeCode: episode,
            characterURLs: characters
        )
    }
}
