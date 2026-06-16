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
    
    func fetchCharacters(page: Int, filters: [CharacterDTO.Filter : String]) async throws -> PageResponse<Character> {
        do {
            let characterPageResponse: PageResponseDTO<CharacterDTO> = try await apiClient.request(endpoint: GetItemsPage(page: page, filters: filters))
            
            return characterPageResponse.toDomain { $0.toDomain() }
            
        } catch ApiError.notFound {
            return PageResponse<Character>(itemCount: 0, pagesCount: 0, hasNextPage: false, hasPreviousPage: false, itemsOnPage: [])
        }
    }
    
    func fetchCharacterByID(_ id: Int) async throws -> Character {
        let characterResponse: CharacterDTO = try await apiClient.request(endpoint: GetSingleItem(id: id))
        
        return characterResponse.toDomain()
    }
    
    func fetchCharactersByIDs(_ ids: [Int]) async throws -> [Character] {
        guard !ids.isEmpty else { return [] }
        
        if ids.count == 1 {
            let character: Character = try await fetchCharacterByID(ids[0])
            return [character]
        } else {
            let charactersResponse: [CharacterDTO] = try await apiClient.request(endpoint: GetMultipleItems(ids: ids))
            
            return charactersResponse.map { $0.toDomain() }
        }
    }
}
