//
//  LocationReferenceDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct LocationReferenceDTO: Decodable, Sendable {
    let name: String
    let url: String
}
