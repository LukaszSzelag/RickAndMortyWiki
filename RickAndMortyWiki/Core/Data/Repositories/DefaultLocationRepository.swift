//
//  DefaultLocationRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

struct DefaultLocationRepository: LocationRepository {
    private let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchLocations(page: Int, filters: [LocationDTO.Filter : String]) async throws -> PageResponse<Location> {
        let locationPageResponse: PageResponseDTO<LocationDTO> = try await apiClient.request(endpoint: GetItemsPage(page: page, filters: filters))
        
        return locationPageResponse.toDomain { $0.toDomain() }
    }
    func fetchLocationByID(_ id: Int) async throws -> Location {
        let locationResponse: LocationDTO = try await apiClient.request(endpoint: GetSingleItem(id: id))
        
        return locationResponse.toDomain()
    }
    func fetchLocationsByIDs(_ ids: [Int]) async throws -> [Location] {
        guard !ids.isEmpty else { return [] }
        
        if ids.count == 1 {
            let location: Location = try await fetchLocationByID(ids[0])
            return [location]
        } else {
            let locationsResponse: [LocationDTO] = try await apiClient.request(endpoint: GetMultipleItems(ids: ids))
            
            return locationsResponse.map { $0.toDomain() }
        }
    }
}
