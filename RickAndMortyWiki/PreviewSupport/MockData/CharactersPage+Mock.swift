//
//  CharactersPage+Mock.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import Foundation

#if DEBUG
extension CharactersPage {
    static let mock = CharactersPage(
        items: Character.mockCharacters,
        totalCount: Character.mockCharacters.count,
        hasNextPage: true
    )
    
    static let empty = CharactersPage(
        items: [],
        totalCount: 0,
        hasNextPage: false
    )
}
#endif
