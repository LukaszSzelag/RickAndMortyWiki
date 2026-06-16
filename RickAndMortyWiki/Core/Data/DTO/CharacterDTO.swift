//
//  CharacterDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct CharacterDTO {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterLocationReferenceDTO
    let location: CharacterLocationReferenceDTO
    let image: URL
    let episode: [URL]
}

extension CharacterDTO {
    func toDomain() -> Character {
        Character(
            id: id,
            name: name,
            status: CharacterStatusMapper.map(status),
            species: species,
            type: type,
            gender: CharacterGenderMapper.map(gender),
            originLocationReference: origin.toDomain(),
            lastSeenLocationReference: location.toDomain(),
            imageURL: image,
            episodeURLs: episode
        )
    }
}

extension CharacterDTO: ApiResource {
    enum Filter: String, CaseIterable, Sendable, Hashable {
        case name
        case status
        case species
        case type
        case gender
    }
    
    static let endpointType: ApiEndpointType = .character
}
