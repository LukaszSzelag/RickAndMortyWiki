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
    let gender: CharacterGender
    let origin: String
    let location: String
    let imageURL: URL
    let episodeIDs: [Int]
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
