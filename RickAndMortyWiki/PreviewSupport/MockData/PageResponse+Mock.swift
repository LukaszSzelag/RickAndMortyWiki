//
//  PageResponse+Mock.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
extension PageResponse {
    static var mockCharacterPage: PageResponse<Character> {
        PageResponse<Character>(
            itemCount: Character.mocks.count,
            pagesCount: 1,
            hasNextPage: true,
            hasPreviousPage: true,
            itemsOnPage: Character.mocks
        )
    }
    
    static var mockEmptyCharacterPage: PageResponse<Character> {
        PageResponse<Character>(
            itemCount: 0,
            pagesCount: 1,
            hasNextPage: false,
            hasPreviousPage: false,
            itemsOnPage: []
        )
    }
    
    static var mockLocationPage: PageResponse<Location> {
        PageResponse<Location>(
            itemCount: Location.mockLocations.count,
            pagesCount: 1,
            hasNextPage: true,
            hasPreviousPage: true,
            itemsOnPage: Location.mockLocations
        )
    }
    
    static var mockEmptyLocationPage: PageResponse<Location> {
        PageResponse<Location>(
            itemCount: 0,
            pagesCount: 1,
            hasNextPage: false,
            hasPreviousPage: false,
            itemsOnPage: []
        )
    }
    
    static var mockEpisodePage: PageResponse<Episode> {
        PageResponse<Episode>(
            itemCount: Episode.mockEpisodes.count,
            pagesCount: 1,
            hasNextPage: true,
            hasPreviousPage: true,
            itemsOnPage: Episode.mockEpisodes
        )
    }
    
    static var mockEmptyEpisodePage: PageResponse<Episode> {
        PageResponse<Episode>(
            itemCount: 0,
            pagesCount: 1,
            hasNextPage: false,
            hasPreviousPage: false,
            itemsOnPage: []
        )
    }
}
#endif
