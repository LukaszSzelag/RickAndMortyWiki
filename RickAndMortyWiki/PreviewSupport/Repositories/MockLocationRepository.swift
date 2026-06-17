//
//  MockLocationRepository.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 17/06/2026.
//

import Foundation

#if DEBUG
struct MockLocationRepository: LocationRepository {
    var locationsPageResult: Result<PageResponse<Location>, Error>
    var locationByIDResult: Result<Location, Error>
    var locationsByIDsResult: Result<[Location], Error>
    
    init(
        locationsPageResult: Result<PageResponse<Location>, Error>,
        locationByIDResult: Result<Location, Error>,
        locationsByIDsResult: Result<[Location], Error>
    )
    {
        self.locationsPageResult = locationsPageResult
        self.locationByIDResult = locationByIDResult
        self.locationsByIDsResult = locationsByIDsResult
    }
    
    func fetchLocations(page: Int, filters: [LocationDTO.Filter : String]) async throws -> PageResponse<Location> {
        try locationsPageResult.get()
    }
    
    func fetchLocationByID(_ id: Int) async throws -> Location {
        let mockLocation = try locationByIDResult.get()
        
        if mockLocation.id == id {
            return mockLocation
        } else {
            throw ApiError.notFound
        }
    }
    
    func fetchLocationsByIDs(_ ids: [Int]) async throws -> [Location] {
        try locationsByIDsResult.get().filter { ids.contains($0.id) }
    }
}
#endif
