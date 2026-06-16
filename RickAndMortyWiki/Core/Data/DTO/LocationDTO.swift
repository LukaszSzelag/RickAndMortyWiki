//
//  LocationDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct LocationDTO: Decodable, Sendable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [URL]
}

extension LocationDTO {
    func toDomain() -> Location {
        return Location(
            id: id,
            name: name,
            type: type,
            dimension: dimension,
            residents: residents
        )
    }
}
