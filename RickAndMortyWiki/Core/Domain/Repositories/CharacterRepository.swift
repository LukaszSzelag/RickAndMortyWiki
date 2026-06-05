//
//  CharacterRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

protocol CharacterRepository: Sendable {
    func fetchCharacters(page: Int, name: String?) async throws -> CharactersPage
    func fetchCharactersByIDs(_ ids: [Int]) async throws -> [Character]
}
