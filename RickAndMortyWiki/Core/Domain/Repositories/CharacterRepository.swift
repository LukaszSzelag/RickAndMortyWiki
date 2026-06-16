//
//  CharacterRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

protocol CharacterRepository: Sendable {
    func fetchCharacters(page: Int, filters: [CharacterDTO.Filter : String]) async throws -> PageResponse<Character>
    func fetchCharacterByID(_ id: Int) async throws -> Character
    func fetchCharactersByIDs(_ ids: [Int]) async throws -> [Character]
}
