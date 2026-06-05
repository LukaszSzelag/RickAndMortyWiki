//
//  CharactersPage.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 03/06/2026.
//

import Foundation

struct CharactersPage: Equatable, Sendable {
    let items: [Character]
    let totalCount: Int
    let totalPages: Int
}
