//
//  CharacterDTO+Mapping.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

extension CharacterDTO {
    func toDomain() -> Character {
        Character(
            id: id,
            name: name,
            status: CharacterStatusMapper.map(status),
            gender: CharacterGenderMapper.map(gender),
            originName: origin.name,
            locationName: location.name,
            imageURL: image,
            episodeIDs: episode.compactMap { Int($0.lastPathComponent) }
        )
    }
}
