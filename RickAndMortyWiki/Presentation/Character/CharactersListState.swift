//
//  CharactersListState.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import Foundation

enum CharactersListState: Equatable {
    case idle
    case loading
    case loaded
    case empty
    case error(String)
}
