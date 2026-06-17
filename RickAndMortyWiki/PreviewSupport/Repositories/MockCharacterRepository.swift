//
//  MockCharacterRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
struct MockCharacterRepository: CharacterRepository {
    var charactersPageResult: Result<PageResponse<Character>, Error>
    var characterByIDResult: Result<Character, Error>
    var charactersByIDsResult: Result<[Character], Error>
    
    init(
        charactersPageResult: Result<PageResponse<Character>, Error>,
        characterByIDResult: Result<Character, Error>,
        charactersByIDsResult: Result<[Character], Error>
    )
    {
        self.charactersPageResult = charactersPageResult
        self.characterByIDResult = characterByIDResult
        self.charactersByIDsResult = charactersByIDsResult
    }
    
    func fetchCharacters(page: Int, filters: [CharacterDTO.Filter : String]) async throws -> PageResponse<Character> {
        try charactersPageResult.get()
    }
    
    func fetchCharacterByID(_ id: Int) async throws -> Character {
        let mockCharacter = try characterByIDResult.get()
        
        if mockCharacter.id == id {
            return mockCharacter
        } else {
            throw ApiError.notFound
        }
    }
    
    func fetchCharactersByIDs(_ ids: [Int]) async throws -> [Character] {
        try charactersByIDsResult.get().filter { ids.contains($0.id) }
    }
}
#endif
