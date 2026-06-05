//
//  CharactersPageDTO+Mapping.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

extension CharactersPageDTO {
    func toDomain() -> CharactersPage {
        CharactersPage(
            items: results.map { $0.toDomain() },
            totalCount: info.count,
            totalPages: info.pages
        )
    }
}
