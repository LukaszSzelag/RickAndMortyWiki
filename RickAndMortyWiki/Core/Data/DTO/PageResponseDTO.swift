//
//  PageResponseDTO.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 16/06/2026.
//

import Foundation

struct PageResponseDTO<Item: Decodable & Sendable>: Decodable, Sendable {
    let info: PageInfoDTO
    let results: [Item]
}

struct PageInfoDTO: Decodable, Sendable {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?
}

extension PageResponseDTO {
    func toDomain() -> PageResponse<Item> {
        return PageResponse<Item>(
            itemCount: info.count,
            pagesCount: info.pages,
            hasNextPage: info.next != nil,
            hasPreviousPage: info.prev != nil,
            itemsOnPage: results
        )
    }
}
