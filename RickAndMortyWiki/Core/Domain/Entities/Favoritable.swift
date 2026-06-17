//
//  Favoritable.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 17/06/2026.
//

import Foundation

protocol Favoritable: Sendable {
    static var favoritesKey: String { get }
}
