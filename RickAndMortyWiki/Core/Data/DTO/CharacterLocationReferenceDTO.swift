//
//  LocationReferenceDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

struct CharacterLocationReferenceDTO: Decodable, Sendable {
    let name: String
    let url: URL
}

extension CharacterLocationReferenceDTO {
    func toDomain() -> CharacterLocationReference {
        return CharacterLocationReference(
            name: name,
            url: url
        )
    }
}
