//
//  Location.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

struct Location: Equatable, Identifiable, Sendable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [URL]
}

extension Location: Favoritable {
    static let favoritesKey: String = "favoriteLocationsIDs"
}
