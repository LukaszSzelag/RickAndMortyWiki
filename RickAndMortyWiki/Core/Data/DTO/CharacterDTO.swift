//
//  CharacterDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct CharacterDTO: Decodable, Sendable {
    let id: Int
    let name: String
    let status: String
    let gender: String
    let origin: LocationReferenceDTO
    let location: LocationReferenceDTO
    let image: URL
    let episode: [URL]
}
