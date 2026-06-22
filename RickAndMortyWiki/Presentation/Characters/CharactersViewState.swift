//
//  CharactersViewState.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 18/06/2026.
//

import Foundation

enum CharactersViewState: Equatable, Sendable {
    case idle
    case empty
    case loading
    case loaded
    case error(errorDescription: String)
}
