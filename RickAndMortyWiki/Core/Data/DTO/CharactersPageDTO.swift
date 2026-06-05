//
//  CharactersPageDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct CharactersPageDTO: Decodable, Sendable {
    let info: PageInfoDTO
    let results: [CharacterDTO]
}

struct PageInfoDTO: Decodable, Sendable {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?
}
