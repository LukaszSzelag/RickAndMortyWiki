//
//  PaginatedResult.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct PaginatedResult<T: Equatable & Sendable>: Equatable & Sendable {
    let items: [T]
    let totalCount: Int
    let totalPages: Int
}
