//
//  Character.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct Character: Identifiable, Equatable, Sendable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: CharacterGender
    let originLocationReference: CharacterLocationReference
    let lastSeenLocationReference: CharacterLocationReference
    let imageURL: URL
    let episodeURLs: [URL]
}

enum CharacterStatus: String, Sendable {
    case alive
    case dead
    case unknown
}

enum CharacterGender: String, Sendable {
    case male
    case female
    case genderless
    case unknown
}

extension Character: Favoritable {
    static let favoritesKey: String = "favoriteCharactersIDs"
}
