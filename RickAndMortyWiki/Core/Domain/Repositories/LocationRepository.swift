//
//  LocationRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

protocol LocationRepository: Sendable {
    func fetchLocations(page: Int, filters: [LocationDTO.Filter : String]) async throws -> PageResponse<Location>
    func fetchLocationByID(_ id: Int) async throws -> Location
    func fetchLocationsByIDs(_ ids: [Int]) async throws -> [Location]
}
