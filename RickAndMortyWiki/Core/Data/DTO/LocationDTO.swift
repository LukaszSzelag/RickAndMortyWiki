//
//  LocationDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct LocationDTO {
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

extension LocationDTO: ApiResource {
    enum Filter: String, CaseIterable, Sendable, Hashable {
        case name
        case type
        case dimension
    }
    
    static let endpointType: ApiEndpointType = .location
}
