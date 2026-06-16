//
//  PageResponse.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

struct PageResponse<Item: Sendable>: Sendable {
    let itemCount: Int
    let pagesCount: Int
    let hasNextPage: Bool
    let hasPreviousPage: Bool
    let itemsOnPage: [Item]
}
