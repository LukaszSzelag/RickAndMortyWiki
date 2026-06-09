//
//  DefaultCharacterRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

struct DefaultCharacterRepository: CharacterRepository {
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient = RickAndMortyApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchCharacters(page: Int, name: String?) async throws -> CharactersPage {
        do {
            let response: CharactersPageDTO = try await apiClient.request(.characters(page: page, name: name))
            return response.toDomain()
        } catch ApiError.notFound {
            return CharactersPage(items: [], totalCount: 0, hasNextPage: false)
        }
    }
    
    func fetchCharactersByIDs(_ ids: [Int]) async throws -> [Character] {
        guard !ids.isEmpty else { return [] }
        
        if ids.count == 1 {
            let dto: CharacterDTO = try await apiClient.request(.charactersByIDs(ids))
            
            return [dto.toDomain()]
        } else {
            let dtos: [CharacterDTO] = try await apiClient.request(.charactersByIDs(ids))
            
            return dtos.map { $0.toDomain() }
        }
    }
}
