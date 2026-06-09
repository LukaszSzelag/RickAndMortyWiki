//
//  MockCharacterRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
struct MockCharacterRepository: CharacterRepository {
    var charactersPageResult: Result<CharactersPage, Error>
    var charactersByIDsResult: Result<[Character], Error>
    
    init(
        charactersPageResult: Result<CharactersPage, Error>,
        charactersByIDsResult: Result<[Character], Error>
    )
    {
        self.charactersPageResult = charactersPageResult
        self.charactersByIDsResult = charactersByIDsResult
    }
    
    func fetchCharacters(page: Int, name: String?) async throws -> CharactersPage {
        try charactersPageResult.get()
    }
    
    func fetchCharactersByIDs(_ ids: [Int]) async throws -> [Character] {
        try charactersByIDsResult.get().filter { ids.contains($0.id) }
    }
}
#endif
